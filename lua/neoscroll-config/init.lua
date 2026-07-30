local neoscroll = require('neoscroll')

neoscroll.setup {
    hide_cursor = false,
    easing = 'linear',
}

local scroll_options = {
    move_cursor = false,
    duration = 100,
}

local mappings = {
    ['<C-k>'] = { amount = -0.2, desc = 'Scroll up 20%' },
    ['<C-Up>'] = { amount = -0.1, desc = 'Scroll up 10%' },
    ['<C-j>'] = { amount = 0.2, desc = 'Scroll down 20%' },
    ['<C-Down>'] = { amount = 0.1, desc = 'Scroll down 10%' },
}

local modes = { 'n', 'v', 'x' }
for key, mapping in pairs(mappings) do
    local amount = mapping.amount

    vim.keymap.set(modes, key, function()
        neoscroll.scroll(amount, scroll_options)
    end, { desc = mapping.desc })
end
