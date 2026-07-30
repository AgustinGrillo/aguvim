local treesitter = require('nvim-treesitter')

local languages = { 'c', 'lua', 'cpp', 'python', 'java', 'haskell' }

treesitter.setup()
treesitter.install(languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
