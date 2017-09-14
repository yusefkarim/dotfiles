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
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'octol/vim-cpp-enhanced-highlight'

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
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za

" Proper indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set smarttab
set ai
set si

" highlight current line
set cursorline

" Smart comments
set comments=s1:/*,mb:\ *,elx:\ */

" highlights matching brackets
set showmatch
set mat=0

" Get rid of vim sounds
set noerrorbells
set novisualbell

" Vim search enhancments
set incsearch
set nohlsearch

" UTF8 support
set encoding=utf8

" Enables line numbers
set nu

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

" Change between buffers with F2 and F4, F3 will delete current buffer
nmap <F2> :bprev<CR>
nmap <F3> :bd<CR>
nmap <F4> :bnext<CR>

" Change current window with F5
nmap <F5> <C-w><C-w>

" Remap ctrl-n(autocomplete) to F6
imap <F6> <C-N>

" F7 will go to previous syntax error, F9 will go to next syntax error,
" F8 toggles syntastic
nmap <F7> :lprevious<CR>
nmap <F8> :SyntasticToggleMod<CR>
nmap <F9> :lnext<CR>

" My commands

" :GCC compiles and runs the current file
command GCC !gcc % && ./a.out
" :GCC compiles and runs the current file, LINKS THE MATH LIBRARY(math.h)
command GCCM !gcc % -lm && ./a.out
" :upload, runs upload command defined in .bashrc to upload to TM4C123
command Upload !make && sudo make flash
