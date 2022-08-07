local api = vim.api
local cmd = api.nvim_command

cmd [[
    autocmd FileType markdown,tex,xml,html,xhtml,css,scss,javascript,yaml setlocal shiftwidth=2 tabstop=2
]]

cmd [[ autocmd FileType markdown,tex setlocal spelllang=en_us spell ]]
cmd [[
    autocmd BufEnter,BufReadPre,BufNewFile *.tex setfiletype tex syntax spell toplevel
]]

cmd [[
    autocmd BufEnter,BufReadPre,BufNewFile *.md setfiletype markdown syntax spell toplevel
]]
cmd [[ autocmd FileType markdown setlocal conceallevel=2 ]]
cmd [[ autocmd FileType tex setlocal indentkeys=!^F,o,O,(,),],},\&,=item,=else,=fi ]]
