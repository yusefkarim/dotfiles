" Vundle (Remember to clone vundle if on new machine)
set nocompatible
filetype off

" runtime path set to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
" Includ all Vundle plugins between vundle#begin() and vundle#end()
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'mmai/vim-markdown-wiki'

call vundle#end()

filetype plugin on

" syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=6

let g:syntastic_error_symbol = 'E!'
let g:syntastic_warning_symbol = 'W!'

"let g:syntastic_c_compiler_options = '-Wall -Wextra -Werror'
let g:syntastic_c_config_file = '.syntastic_c_config'

" airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#trailing_format = '[%s]t!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
set laststatus=2
let g:airline_theme='minimalist'
let g:airline_left_sep = ' '
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1
set noshowmode
set timeoutlen=10

" Latex stuff
let g:syntastic_tex_checkers = ['']
let g:livepreview_engine = 'lualatex'

" Enables syntax processing
syntax enable

" colorscheme
colorscheme huginn
" This makes the background transparent to match terminal
hi Normal ctermfg=255 ctermbg=none
" Overwriting colorscheme error messages for syntastic
highlight SyntasticErrorSign ctermfg=red ctermbg=NONE
highlight SyntasticWarningSign ctermfg=yellow ctermbg=NONE

" Enable folding
set foldmethod=manual
set foldlevel=99
" Select lines in visual mode then press space to fold those lines
" Press space again in normal mode to unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set nobackup        " No file backups
set shiftwidth=4    " Number of characters to indent by
set tabstop=4       " Indentation for tab key
"set softtabstop=4   " Backspace 4 spaces instead of one for tabspaced stuff
set expandtab       " Expand Tab as spaces
set smarttab        " Higher IQ tabs
"set textwidth=79    " Start new line after 79 characters
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
set nohlsearch      " Don't highlight search patterns

" Get rid of vim sounds
set noerrorbells
set novisualbell

" Automatic bracket closure
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

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

" My commands

" :GCC compiles and runs the current file
command GCC !gcc % && ./a.out
" :GCC compiles and runs the current file, LINKS THE MATH LIBRARY(math.h)
command GCCM !gcc % -lm && ./a.out
" Run current Python3 script
command PY !/usr/bin/python3 %
" :upload, runs upload command defined in .bashrc to upload to TM4C123
command Upload !make && sudo make flash
