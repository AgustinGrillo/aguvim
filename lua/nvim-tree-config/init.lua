require 'nvim-tree'.setup {
    view = {
        side = 'right',
        width = 50,
        preserve_window_proportions = true,
    },
    git = {
        enable = true,
        ignore = false,
    },
    renderer = {
        highlight_git = true, -- Enable highlighting based on Git status
        icons = {
            show = {
                git = true,
            },
        },
    },
}
