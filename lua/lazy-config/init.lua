-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    -- Color Scheme
    { 'catppuccin/nvim',      name = "catppuccin" },
    -- Icons
    'kyazdani42/nvim-web-devicons',
    -- File Explorer
    'kyazdani42/nvim-tree.lua',
    -- Collection of configurations for the built-in LSP client
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    -- LSP source for nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- Snippets source for nvim-cmp
    'saadparwaiz1/cmp_luasnip',
    -- Snippets plugin
    'L3MON4D3/LuaSnip',
    -- Highlighting
    'RRethy/vim-illuminate',
    -- Git plugins
    'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',
    'kdheepak/lazygit.nvim',
    -- Tree sitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    -- Lualine
    'nvim-lualine/lualine.nvim',
    -- Telescope / FuzzyFinder
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    'sharkdp/fd',
    'BurntSushi/ripgrep',
    'AckslD/nvim-neoclip.lua',
    -- Vim select and input UI
    'stevearc/dressing.nvim',
    -- Comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    -- Tabline
    'romgrk/barbar.nvim',
    -- Code Run and Debug
    'CRAG666/code_runner.nvim',
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    -- Github copilot
    -- 'github/copilot.vim',
    -- Local AI code completion
    {
        'milanglacier/minuet-ai.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- Scrolling
    'karb94/neoscroll.nvim',
    -- vim-surround
    'tpope/vim-surround',
    -- Terminal toggler
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    -- Todo's manager
    'folke/todo-comments.nvim',
    -- Markdown plugin
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    },
    -- Greeter
    'goolord/alpha-nvim',
    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    -- Latex
    'lervag/vimtex',
})
