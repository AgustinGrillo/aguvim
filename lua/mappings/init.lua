local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- local opt = { expr = true, remap = true }

vim.g.mapleader = ' '

-- General maps
map('v', '<C-c>', '"+y', opts)
-- map('t', '<Esc>', '<C-\\><C-n>', opts)
-- Nvim Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- Telescope
map('n', '<leader>ff', ':Telescope find_files <CR>', opts)
map('n', '<leader>fw', ':Telescope live_grep <CR>', opts)
map('n', '<leader>fc', ':Telescope grep_string <CR>', opts)
map('n', '<leader>fy', ':Telescope neoclip <CR>', opts)
map('n', '<leader>ft', ':TodoTelescope <CR>', opts)
-- Commenting // TODO: Remove
vim.keymap.set('n', '<C-Bslash>', "v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'", { expr = true, remap = true })
vim.keymap.set('x', '<C-Bslash>', '<Plug>(comment_toggle_linewise_visual)')
-- Window Navigation
map('n', '<A-h>', ':wincmd h <CR>', opts)
map('n', '<A-w><Left>', ':wincmd h <CR>', opts)
map('n', '<A-l>', ':wincmd l <CR>', opts)
map('n', '<A-w><Right>', ':wincmd l <CR>', opts)
map('n', '<A-k>', ':wincmd k <CR>', opts)
map('n', '<A-w><Up>', ':wincmd k <CR>', opts)
map('n', '<A-j>', ':wincmd j <CR>', opts)
map('n', '<A-w><Down>', ':wincmd j <CR>', opts)
-- Window Managment
map('n', '<A-w>v', ':vsplit <CR>', opts)
-- Barbar (tabline)
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
map('n', '<A-S-,>', ':BufferMovePrevious<CR>', opts)
map('n', '<A-S-.>', ':BufferMoveNext<CR>', opts)
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-c>', ':BufferClose<CR>', opts)
-- Code Runner
map('n', '<leader>rr', ':RunCode<CR>', opts)
map('n', '<leader>rc', ':RunClose<CR>', opts)
-- Debugger (DAP)
map('n', '<leader>db', ':DapToggleBreakpoint <CR>', opts)
map('n', '<leader>dd', ':DapContinue <CR>', opts)
map('n', '<leader>ds', ':DapTerminate <CR>', opts)
map('n', '<leader>dt', ":lua require'dapui'.toggle() <CR>", opts)
map('n', '<A-s>', ':DapStepOver <CR>', opts)
map('n', '<A-i>', ':DapStepInto <CR>', opts)
map('n', '<A-o>', ':DapStepOut <CR>', opts)
map('n', '<Leader>dh', ":lua require'dap.ui.widgets'.hover() <CR>", opts)
map('v', '<Leader>dh', ":lua require'dap.ui.widgets'.hover() <CR>", opts)
-- Lazygit
map('n', '<leader>ll', ':LazyGit <CR>', opts)

