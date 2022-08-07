local U = require('utils')

-- Clear screen and search results whith Ctrl+l
U.map('n', '<C-l>', ':let @/ = ""<CR>:clear<CR>')

-- Pressing F1 will write file, in normal and insert mode
U.map('n', '<F1>', ':w<CR>')
U.map('i', '<F1>', '<ESC>:w<CR>')

-- F2 and F4 can switch buffers, F3 closes the current buffer
U.map('n', '<F2>', ':bp<CR>')
U.map('n', '<F3>', ':bd<CR>')
U.map('n', '<F4>', ':bn<CR>')

-- Format the paragraph the cursor is on to match the currently set textwidth
U.map('n', '<S-f>', '}<S-v>{gq')

-- Jump around (to get down (and up)) using Ctrl-j/k
U.map('n', '<C-j>', '<C-D>')
U.map('n', '<C-k>', '<C-U>')

-- Disable up/down arrow keys in visual mode
U.map('i', '<up>', '<nop>')
U.map('i', '<down>', '<nop>')
-- Disable left/right arrow keys in normal mode
U.map('n', '<left>', '<nop>')
U.map('n', '<right>', '<nop>')
-- Move by editor lines
U.map('n', 'j', 'gj')
U.map('n', 'k', 'gk')

-- U.map('', '', '')
