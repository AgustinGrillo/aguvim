local servers = { 'pyright', 'clangd', 'lua_ls', 'ts_ls', 'eslint', 'marksman', 'jdtls', 'cmake' }

-- Mason
require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = servers,
}

-- Diagnostics
vim.diagnostic.config({
    underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = {
        current_line = true,
        severity = { min = vim.diagnostic.severity.ERROR },
        spacing = 4,
        prefix = '●',
    },
    signs = {
        severity = { min = vim.diagnostic.severity.WARN },
        -- keep the sign text empty (no glyph in signcolumn)
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.INFO]  = '',
            [vim.diagnostic.severity.HINT]  = '',
        },
        -- linehl = {},
        -- map severities to number-column highlight groups
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticLineNrError',
            [vim.diagnostic.severity.WARN]  = 'DiagnosticLineNrWarn',
            [vim.diagnostic.severity.INFO]  = 'DiagnosticLineNrInfo',
            [vim.diagnostic.severity.HINT]  = 'DiagnosticLineNrHint',
        },
    },
})

-- Add floating window to display diagnostics
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})
-- Highlight number instead of icon
vim.api.nvim_set_hl(0, "DiagnosticLineNrError", { fg = "#F38BA8", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", { fg = "#F9E2AF", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", { fg = "#A6E3A1", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", { fg = "#89B4FA", bold = true })


-- Disable the default keybinds
for _, bind in ipairs({ "grn", "gra", "gri", "grr", "grt" }) do
    pcall(vim.keymap.del, "n", bind)
end

-- Create keybindings, commands, inlay hints and autocommands on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        -- Set buffer-local options
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'

        -- Keymappings
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = 'LSP: ' .. desc, buffer = bufnr, silent = true, noremap = true })
        end

        -- Navigation and Information
        map('n', '<leader>gd', "<cmd>Telescope lsp_definitions<cr>", 'Go to Definition')
        map('n', '<leader>gD', vim.lsp.buf.declaration, 'Go to Declaration')
        map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        map('n', '<leader>gi', "<cmd>Telescope lsp_implementations<cr>", 'Go to Implementation')
        map('n', '<leader>gr', "<cmd>Telescope lsp_references<cr>", 'Go to References')
        map('n', '<leader>D', "<cmd>Telescope lsp_type_definitions<cr>", 'Type Definition')

        -- Refactoring and Actions
        map('n', '<leader>R', vim.lsp.buf.rename, 'Rename Symbol')
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code Actions')

        -- Diagnostics
        map('n', '<leader>fda', "<cmd>Telescope diagnostics<cr>", 'Show All Diagnostics')
        map('n', '<leader>fdc', "<cmd>Telescope diagnostics bufnr=0<cr>", 'Show File Diagnostics')

        -- Formatting
        if client and client:supports_method('textDocument/formatting') then
            map('n', '<leader>F', function() vim.lsp.buf.format({ async = true }) end, 'Format Buffer')
        end

    end,
})


-- Global LSP capabilities setup for nvim-cmp.
-- It tells all LSP servers that the client (Neovim) supports advanced completion features.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- General
vim.lsp.config('*', {
    capabilities = capabilities,
})

-- Server-specific configurations (overrides).
-- This has the highest priority and will override defaults from nvim-lspconfig.
-- Lua
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- Clangd
vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--query-driver=/usr/bin/clang++,/usr/bin/clang,/usr/bin/g++,/usr/bin/gcc",
    },
})
