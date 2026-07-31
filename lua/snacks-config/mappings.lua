local snacks = require('snacks')

vim.keymap.set({ 'n', 't' }, '<C-t>', function()
    snacks.terminal.toggle()
end, { desc = 'Toggle Terminal' })

vim.keymap.set('n', '<leader>ll', function()
    snacks.lazygit()
end, { desc = 'LazyGit' })

vim.keymap.set('n', '<leader>ff', function()
    snacks.picker.files()
end, { desc = 'Find Files' })
