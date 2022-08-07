local U = require('utils')

U.map('n', '<C-t>', "<CMD>lua require('FTerm').toggle()<CR>")
U.map('t', '<C-t>', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
