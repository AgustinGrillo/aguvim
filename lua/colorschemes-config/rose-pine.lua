require('rose-pine').setup({
    variant = 'main',
    dark_variant = 'main',
    highlight_groups = {
        SnacksDashboardDesc = { fg = 'pine' },
        SnacksDashboardIcon = { link = 'SnacksDashboardKey' },
        SnacksDashboardKey = { fg = 'muted' },
    },
})

vim.cmd.colorscheme('rose-pine')
