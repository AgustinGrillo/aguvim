local illuminate = require('illuminate')

illuminate.configure({ delay = 500 })

vim.keymap.set('n', '<A-n>', function()
    illuminate.goto_next_reference(true)
end, { desc = 'Next Reference' })

vim.keymap.set('n', '<A-N>', function()
    illuminate.goto_prev_reference(true)
end, { desc = 'Previous Reference' })

vim.keymap.set('n', '<A-p>', illuminate.toggle, { desc = 'Toggle Highlighting' })
