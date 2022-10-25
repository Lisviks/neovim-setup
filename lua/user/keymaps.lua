local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Switch buffer
keymap('n', '<S-h>', ':bprevious<CR>', default_opts) 
keymap('n', '<S-l>', ':bnext<CR>', default_opts)

-- Move selected line / block of text in normal / visual mode
keymap('n', 'K', '<CMD>move .-2<CR>', default_opts)
keymap('n', 'J', '<CMD>move .+1<CR>', default_opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", default_opts)
keymap('x', 'J', ":move '>+1<CR>gv-gv", default_opts)
