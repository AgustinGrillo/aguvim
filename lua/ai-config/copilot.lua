vim.g.copilot_no_tab_map = true

vim.keymap.set('i', '<S-Tab>', function()
    if vim.fn.exists('*copilot#Accept') == 0 then
        return ''
    end

    return vim.fn['copilot#Accept']('')
end, {
    expr = true,
    silent = true,
    replace_keycodes = false,
    desc = 'Accept Copilot suggestion',
})
