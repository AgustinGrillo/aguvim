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

local lazy_options = {
    -- No configured plugin uses LuaRocks; avoid bootstrapping Lua through Hererocks.
    rocks = {
        enabled = false,
    },
}

return require('lazy').setup({
    -- Color Scheme
    { 'catppuccin/nvim',      name = "catppuccin" },
    -- UI and quality-of-life tools
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
    },
    -- Icons
    'nvim-tree/nvim-web-devicons',
    -- File Explorer
    'nvim-tree/nvim-tree.lua',
    -- Collection of configurations for the built-in LSP client
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    -- LSP source for nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
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
    -- Tree sitter
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
    },
    -- Lualine
    'nvim-lualine/lualine.nvim',
    -- Telescope / FuzzyFinder
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'AckslD/nvim-neoclip.lua',
    -- Tabline
    'romgrk/barbar.nvim',
    -- Code Run and Debug
    'CRAG666/code_runner.nvim',
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    -- Github copilot
    'github/copilot.vim',
    -- Scrolling
    'karb94/neoscroll.nvim',
    -- vim-surround
    'tpope/vim-surround',
    -- Todo's manager
    'folke/todo-comments.nvim',
    -- Markdown plugin
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
    },
    -- Autopairs
    "windwp/nvim-autopairs",
    -- Latex
    'lervag/vimtex',
    -- Tmux
    "christoomey/vim-tmux-navigator",
}, lazy_options)
