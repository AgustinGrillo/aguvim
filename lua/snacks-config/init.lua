local snacks = require('snacks')

snacks.setup {
    dashboard = require('snacks-config.dashboard'),
    input = {},
    lazygit = require('snacks-config.lazygit'),
    picker = {
        ui_select = true,
    },
    terminal = require('snacks-config.terminal'),
}

require('snacks-config.mappings')
