local function toggle_zoom()
    -- Get a list of all windows in the current tab
    local wins = vim.api.nvim_tabpage_list_wins(0)

    -- If there's only one window, there's nothing to do
    if #wins <= 1 then
        return
    end

    -- Count how many windows are not minimized (i.e., larger than 1x1)
    local large_wins = 0
    for _, win in ipairs(wins) do
        if vim.api.nvim_win_get_width(win) > 1 and vim.api.nvim_win_get_height(win) > 1 then
            large_wins = large_wins + 1
        end
    end

    -- If exactly one window is "large", we consider the layout zoomed
    if large_wins == 1 then
        -- We're zoomed in, so equalize all windows
        vim.cmd('wincmd =')
    else
        -- We're not zoomed, so maximize the current window
        vim.cmd('wincmd |') -- Maximize horizontally
        vim.cmd('wincmd _') -- Maximize vertically
    end
end

-- Map the function to <A-Space> in normal mode
vim.keymap.set('n', '<A-Space>', toggle_zoom, { desc = 'Toggle window zoom' })
