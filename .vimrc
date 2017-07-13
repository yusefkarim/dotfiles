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

" airline stuff
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='term'
let g:airline_left_sep = ' '
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1
set noshowmode
set timeoutlen=10

" Enables syntax processing
syntax enable

" colorscheme, find at, /usr/share/vim/vim80/colors/
" Favourites: badwolf, monokai
colorscheme monokai

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

" Disabling PgUp and PgDn in insert mode
imap <PageDown> <Nop>
imap <PageUp> <Nop>

" Pressing F1 will write file, in normal and insert mode
nmap <F1> :w<CR>
imap <F1> <ESC>:w<CR>i

" Change between buffers with F2 and F4, F3 will change windows
nmap <F2> :bprev<CR>
nmap <F3> <C-w><C-w>
nmap <F4> :bnext<CR>

" Remap ctrl-n(autocomplete) to F5
imap <F5> <C-N>

" F6 will go to previous syntax error, F7 will go to next syntax error
nmap <F6> :lprevious<CR>
nmap <F7> :lnext<CR>

