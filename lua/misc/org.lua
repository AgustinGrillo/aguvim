require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
    }
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3",
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set concealcursor=nv"
})

-- Remap folding keys specifically for Neorg files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  callback = function()
    vim.keymap.set('n', '<Tab>', 'za', { buffer = true, desc = "Neorg: Toggle fold" })
    vim.keymap.set('n', '<S-Tab>', 'zA', { buffer = true, desc = "Neorg: Recursively toggle fold" })
  end,
})
