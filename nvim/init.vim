" If vim-plug doesn't exist, install it 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')   
Plug 'morhetz/gruvbox'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'ap/vim-buftabline'
Plug 'w0rp/ale'
Plug 'mmai/vim-markdown-wiki'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Gruvbox colorscheme/plugin
let g:gruvbox_guisp_fallback = "bg"  " Fix gruxbox spell check highlighting
set background=dark
colorscheme gruvbox

" NeoTex plugin
let g:tex_flavor = 'latex'
let g:neotex_pdflatex_alternative = "lualatex"
let g:neotex_pdflatex_add_options = "-output-directory=output"
let g:neotex_enabled = 2

" Buftabline plugin
let g:buftabline_show = 1
let g:buftabline_plug_max = 0

" FZF plugin
nmap <C-f> :FZF<CR>
nmap <C-g> :GFiles<CR>
nmap <C-s> :Lines<CR>

" ALE plugin
" Make sure to install flake8 for Python3
"let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘➤'
let g:ale_sign_warning = '⚑➤'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
let g:ale_linters = {'python': ['flake8'], 'c': ['gcc']}
let g:ale_c_gcc_options = '-Wall -Wextra -Wunused -Wpedantic'
command ST let g:ale_c_gcc_executable = 'arm-none-eabi-gcc' |
            \ let g:ale_c_gcc_options .= ' -I../CMSIS/inc -Iinc' |
            \ ALELint

" Ctrl+k will go to previous syntax error, Ctrl+j will go to next syntax error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Statusline (relies on ALE)
function! LinterStatus() abort
    let l:error = ale#statusline#FirstProblem(bufnr(''),'error')
    let l:warning = ale#statusline#FirstProblem(bufnr(''),'warning')
    if len(l:error)
        if l:error['lnum'] == line('.')
            return ""
        else
            hi statusline guifg=#fb4934 guibg=NONE ctermfg=167 ctermbg=NONE
            return l:error['lnum']."--➤".l:error['text']
        endif
    elseif len(l:warning)
        if l:warning['lnum'] == line('.')
            return ""
        else
            hi statusline guifg=#fabd2f guibg=NONE ctermfg=214 ctermbg=NONE
            return l:warning['lnum']."--➤".l:warning['text']
        endif
    else
        hi statusline guifg=#b8bb26 guibg=NONE ctermfg=142 ctermbg=NONE
        return "✓✓"
    endif
endfunction

set statusline=%{LinterStatus()}
set statusline+=%#Normal#
set statusline+=%=
set statusline+=%f\ %y%r\ %l/%L,\ %c\  

" Enables syntax processing
syntax enable
" Enable folding
set foldmethod=manual
set foldlevel=99
" Select lines in visual mode then press space to fold those lines.
" Press space again in normal mode to unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set laststatus=2    " Statusline
set lazyredraw      " Faster scrolling when syntax is on
set nobackup        " No file backups
set shiftwidth=4    " Number of characters to indent by
set tabstop=4       " Indentation for tab key
set expandtab       " Expand Tab as spaces
set smarttab        " Higher IQ tabs
set encoding=utf8   " UTF8 support
set nu              " Enables line numbers
set ai              " Auto indent
set si              " Smart indent
set cursorline      " Highlight current line
"set textwidth=80    " Start new line after n characters
"set wrap            " Enable soft wrapping
set linebreak       " Move wrapped content to new line
set breakindent     " Line up indentation of wrapped content 
" Smart comments
set comments=s1:/*,mb:\ *,elx:\ */
set showmatch       " Highlight matching brackets
set incsearch       " Start searching during typing
set hlsearch        " Highlight all matches
" Clear search results when Enter is pressed
nnoremap <silent> <CR> :noh<CR><CR>
" Get rid of vim sounds
set noerrorbells
set novisualbell

" Filetype specific commands
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 spelllang=en_us spell

" Disable Page Up/Down in insert mode
imap <PageDown> <Nop>
imap <PageUp> <Nop>

" Pressing F1 will write file, in normal and insert mode
nmap <F1> :w<CR>
imap <F1> <ESC>:w<CR>

" Change between buffers with F2 and F4, F3 will close current buffer
nmap <F2> :bprev<CR>
nmap <F3> :bd<CR>
nmap <F4> :bnext<CR>

" Change current window with F5
nmap <F5> <C-w><C-w>

" My commands
" :CC compiles and runs the current file
command CC !clear && cc % && ./a.out && rm a.out
" :CCM compiles and runs the current file, LINKS THE MATH LIBRARY(math.h)
command CCM !cc % -lm && ./a.out && rm a.out
" Run current Python3 script
command PY !clear && /usr/bin/python3 %
" Priviliged Python3 script
command PPY !clear && sudo /usr/bin/python3 %
" Beautify JSON formatted objects into a new file
command JSON !python3 -m json.tool % > %.json
" Output current date at cursor
command DATE :put =strftime('%A %Y-%m-%d %I:%M %p')
