-- -- Nvim tree config
-- local nvim_tree_events = require('nvim-tree.events')
-- local bufferline_state = require('bufferline.state')
--
-- nvim_tree_events.on_tree_open(function ()
--   bufferline_state.set_offset(31, "File Tree")
-- end)
--
-- nvim_tree_events.on_tree_close(function ()
--   bufferline_state.set_offset(0)
-- end)

-- Set barbar's options
require('barbar').setup {
    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = true,
    tabpages = false,

    icons = {
        button = '',
    }
}

--- Color
vim.api.nvim_command("hi BufferCurrent     guibg=#89b4fa guifg=#1e1e2e")
vim.api.nvim_command("hi BufferCurrentSign guibg=#89b4fa guifg=#1e1e2e")
vim.api.nvim_command("hi BufferCurrentIcon guibg=#89b4fa guifg=#1e1e2e")
vim.api.nvim_command("hi BufferCurrentMod  guibg=#89b4fa guifg=#1e1e2e")

vim.api.nvim_command("hi BufferVisible     guibg=none guifg=#CCCCCC")
vim.api.nvim_command("hi BufferVisibleSign guibg=none guifg=#CCCCCC")
vim.api.nvim_command("hi BufferVisibleIcon guibg=none guifg=#CCCCCC")
vim.api.nvim_command("hi BufferVisibleMod  guibg=none guifg=#CCCCCC")
