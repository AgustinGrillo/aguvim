local catppuccin = require("catppuccin")
local color_utils = require('catppuccin.utils.colors')

-- configure it (info at --> https://github.com/catppuccin/nvim)
catppuccin.setup({
    flavour = "mocha",
    custom_highlights = function(colors)
        local muted_blue = color_utils.blend(colors.blue, colors.overlay0, 0.55)

        return {
            SnacksDashboardDesc = { fg = colors.blue },
            SnacksDashboardIcon = { link = 'SnacksDashboardKey' },
            SnacksDashboardKey = { fg = muted_blue },
        }
    end,
})

vim.cmd.colorscheme "catppuccin"
