local configs = require('nvim-treesitter.configs')

configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "cpp", "python", "java", "haskell" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {},
  },

  indent = {
    enable = true
  }
}

