local function toggle_zoom()
    -- Helper to identify the NvimTree window by filetype
    local function get_nvim_tree_win()
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == 'NvimTree' then
                return win
            end
        end
        return nil
    end

    local nvim_tree_win = get_nvim_tree_win()
    local current_win = vim.api.nvim_get_current_win()

    -- Do nothing if we are in the NvimTree window
    if nvim_tree_win == current_win then
        return
    end

    -- Get a list of "workable" windows (i.e., not NvimTree)
    local workable_wins = {}
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if win ~= nvim_tree_win then
            table.insert(workable_wins, win)
        end
    end

    -- If there's only one workable window, nothing to zoom
    if #workable_wins <= 1 then
        return
    end

    -- **THE FIX IS HERE: A MORE RELIABLE DETECTION METHOD**
    -- A "large" window is one that is not minimized. A zoomed state has exactly one large window.
    local large_wins_count = 0
    for _, win in ipairs(workable_wins) do
        if
            vim.api.nvim_win_get_width(win) > vim.o.winminwidth
            and vim.api.nvim_win_get_height(win) > vim.o.winminheight
        then
            large_wins_count = large_wins_count + 1
        end
    end

    -- If exactly one window is "large", we are zoomed in. Time to zoom out.
    if large_wins_count == 1 then
        -- Use the 'winfix' trick to preserve NvimTree's width while equalizing others.
        if nvim_tree_win then
            vim.wo[nvim_tree_win].winfixwidth = true
        end
        vim.cmd('wincmd =')
        if nvim_tree_win then
            vim.wo[nvim_tree_win].winfixwidth = false
        end
        -- If more than one window is large, we are zoomed out. Time to zoom in.
    else
        -- Directly maximize the current window.
        vim.api.nvim_win_set_height(current_win, 999)
        vim.api.nvim_win_set_width(current_win, 999)
    end
end

local function __toggle_zoom()
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
