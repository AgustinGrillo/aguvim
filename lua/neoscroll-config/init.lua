neoscroll = require('neoscroll')
neoscroll.setup({
  hide_cursor = false,
  easing = "linear"
})

-- Custom Mappings
local keymap = {
  ["<C-k>"] = function() neoscroll.scroll(-0.2, { move_cursor=false; duration = 100 }) end;
  ["<C-Up>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
  ["<C-j>"] = function() neoscroll.scroll(0.2, { move_cursor=false; duration = 100 }) end;
  ["<C-Down>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
