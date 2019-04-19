" Vundle (Remember to clone vundle if on new machine)
set nocompatible
filetype off

" Runtime path set to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
" Include all Vundle plugins between vundle#begin() and vundle#end()
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ap/vim-buftabline'
Plugin 'morhetz/gruvbox'
Plugin 'mmai/vim-markdown-wiki'
Plugin 'scrooloose/nerdtree'
Plugin 'rust-lang/rust.vim'
Plugin 'haya14busa/incsearch.vim'

call vundle#end()
filetype plugin indent on

" syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

let g:syntastic_error_symbol = '✘➤'
let g:syntastic_warning_symbol = '⚑➤'
"let g:syntastic_enable_signs = 0

"let g:syntastic_c_compiler_options = '-Wall -Wextra -Werror'
let g:syntastic_c_config_file = '.syntastic_c_config'
let g:syntastic_tex_checkers = ['']

" buftabline stuff
let g:buftabline_show = 1
let  g:buftabline_plug_max = 0

" NERDtree stuff
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" incsearch stuff
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)

" Enables syntax processing
syntax enable

" colorscheme
set background=dark
colorscheme gruvbox

" Set default encryption method
set cm=blowfish2

" Enable folding
set foldmethod=manual
set foldlevel=99
" Select lines in visual mode then press space to fold those lines
" Press space again in normal mode to unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Press Ctrl+f to fold on curly brace, '{', press space to unfold
nnoremap <C-f> zfa}

set nobackup        " No file backups
set shiftwidth=4    " Number of characters to indent by
set tabstop=4       " Indentation for tab key
"set softtabstop=4   " Backspace 4 spaces instead of one for tabspaced stuff
set expandtab       " Expand Tab as spaces
set smarttab        " Higher IQ tabs
set textwidth=80    " Start new line after n characters
set encoding=utf8   " UTF8 support
set nu              " Enables line numbers
set ai              " Auto indent
set si              " Smart indent
set cursorline      " Highlight current line

" Smart comments
set comments=s1:/*,mb:\ *,elx:\ */

" Highlights matching brackets
set showmatch
set mat=0

set incsearch       " Start searching as it is typed
set hlsearch        " Don't highlight search patterns

" Get rid of vim sounds
set noerrorbells
set novisualbell

" Filetype specific commands
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 spelllang=en_us spell

" Disabling PgUp and PgDn in insert mode
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

" F6 will go to previous syntax error, F8 will go to next syntax error,
" F7 toggles syntastic
nmap <F6> :lprevious<CR>
nmap <F7> :SyntasticToggleMod<CR>
nmap <F8> :lnext<CR>

" Ctrl-p will use pandoc to create a pdf of the current markdown file then
" display it with evince
nmap <C-p> :!pandoc % -V fontsize=12pt -V geometry:margin=1in
           \ --pdf-engine=lualatex -o %:r.pdf </dev/null >/dev/null 2>&1
           \ && evince %:r.pdf </dev/null >/dev/null 2>&1 &<CR><CR>

" Ctrl-l will use lualatex to create a pdf of the current latex file then
" display it with evince
" NOTE: If using the minted package, specify the output directory when importing:
"       \usepackage[outputdir=/tmp]{minted}
" !rm -rf /tmp/%:r.* /tmp/_minted*
nmap <C-l> :!rm -rf /tmp/_minted*
           \ && lualatex -shell-escape -output-directory=/tmp % </dev/null >/dev/null 2>&1
           \ && evince /tmp/%:r.pdf </dev/null >/dev/null 2>&1
           \ && mv /tmp/%:r.pdf . </dev/null >/dev/null 2>&1  &<CR><CR>

" My commands
" :GCC compiles and runs the current file
command GCC !clear && gcc % && ./a.out && rm a.out
" :GCC compiles and runs the current file, LINKS THE MATH LIBRARY(math.h)
command GCCM !gcc % -lm && ./a.out && rm a.out
" Run current Python3 script
command PY !clear && /usr/bin/python3 %
" Beautify JSON formatted objects into a new file
command JSON !python3 -m json.tool % > %.json
" Output current date at cursor
command DATE :put =strftime('%A %Y-%m-%d %I:%M %p')

