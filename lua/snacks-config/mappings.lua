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

vim.keymap.set('n', '<leader>fw', function()
    snacks.picker.grep()
end, { desc = 'Search Project Text' })

vim.keymap.set('n', '<leader>fc', function()
    snacks.picker.grep_word()
end, { desc = 'Search Word Under Cursor' })

vim.keymap.set('n', '<leader>ft', function()
    snacks.picker.todo_comments()
end, { desc = 'Find TODOs' })

vim.keymap.set('n', '<leader>fr', function()
    snacks.picker.recent()
end, { desc = 'Recent Files' })

vim.keymap.set('n', '<leader>fb', function()
    snacks.picker.buffers()
end, { desc = 'Find Open Buffers' })

vim.keymap.set('n', '<leader>fR', function()
    snacks.picker.resume()
end, { desc = 'Resume Last Picker' })

vim.keymap.set('n', '<leader>fs', function()
    snacks.picker.lsp_symbols()
end, { desc = 'Find Document Symbols' })
