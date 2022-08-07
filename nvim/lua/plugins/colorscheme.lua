local cmd = vim.api.nvim_command
local g = vim.g

g.edge_enable_italic = 1
g.edge_disable_italic_comment= 1
cmd('colorscheme edge')
