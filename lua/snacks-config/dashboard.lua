local snacks = require('snacks')

return {
    formats = {
        label = { '%s', hl = 'SnacksDashboardKey' },
    },
    preset = {
        keys = {
            { icon = ' ', key = 'e', desc = 'New file', action = ':ene | startinsert' },
            {
                icon = ' ',
                key = '<leader>ff',
                label = 'SPC f f',
                desc = 'Find file',
                action = function()
                    snacks.picker.files()
                end,
            },
            {
                icon = ' ',
                key = '<leader>fr',
                label = 'SPC f r',
                desc = 'Recent',
                action = function()
                    snacks.picker.recent()
                end,
            },
            {
                icon = ' ',
                key = '<leader>fw',
                label = 'SPC f w',
                desc = 'Search text',
                action = function()
                    snacks.picker.grep()
                end,
            },
            {
                icon = ' ',
                key = 's',
                desc = 'Settings',
                action = function()
                    vim.cmd.edit(vim.fn.fnameescape(vim.fn.stdpath('config')))
                end,
            },
            { icon = ' ', key = 'q', desc = 'Quit NVIM', action = ':qa' },
        },
    },
    sections = {
        { section = 'keys', gap = 1 },
    },
}
