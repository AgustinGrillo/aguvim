local snacks = require('snacks')

snacks.setup {
    dashboard = require('snacks-config.dashboard'),
    image = require('snacks-config.image'),
    input = {},
    lazygit = require('snacks-config.lazygit'),
    picker = require('snacks-config.picker'),
    terminal = require('snacks-config.terminal'),
}

require('snacks-config.mappings')
