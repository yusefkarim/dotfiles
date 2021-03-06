" Vundle (Remember to clone vundle if on new machine)
set nocompatible
filetype off

" Runtime path set to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
" Include all Vundle plugins between vundle#begin() and vundle#end()
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'ap/vim-buftabline'
Plugin 'morhetz/gruvbox'
Plugin 'mmai/vim-markdown-wiki'
Plugin 'scrooloose/nerdtree'
Plugin 'haya14busa/incsearch.vim'

call vundle#end()
filetype plugin indent on

" ALE stuff
" Make sure to install pylint for Python3
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

" buftabline stuff
let g:buftabline_show = 1
let g:buftabline_plug_max = 0

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

" Fix gruxbox spell check highlighting
let g:gruvbox_guisp_fallback = "bg"
" colorscheme
set background=dark
colorscheme gruvbox

" Enable folding
set foldmethod=manual
set foldlevel=99
" Select lines in visual mode then press space to fold those lines
" Press space again in normal mode to unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Press Ctrl+f to fold on curly brace, '{', press space to unfold
nnoremap <C-f> zfa}

set laststatus=2    " Statusline
set ttyfast         " Faster screen redrawing
set lazyredraw      " Faster scrolling when syntax is on
set cm=blowfish2    " Set default encryption method
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
"set ruler           " Display cursor position at the bottom
"set textwidth=80    " Start new line after n characters
"set wrap            " Enable soft wrapping
set linebreak       " Move wrapped content to new line
set breakindent     " Line up indentation of wrapped content 

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
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
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

" Ctrl+k will go to previous syntax error, Ctrl+j will go to next syntax error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Ctrl-p will use pandoc to create a pdf of the current markdown file then
" display it with evince
nmap <C-p> :!pandoc % -V fontsize=12pt -V geometry:margin=1in
           \ --pdf-engine=lualatex -o %:r.pdf </dev/null >/dev/null 2>&1
           \ && evince %:r.pdf </dev/null >/dev/null 2>&1 &<CR><CR>

" Ctrl-l will use lualatex to create a pdf of the current latex file then
" display it with evince
" NOTE: If using the minted package, specify the output directory when importing:
"       \usepackage[outputdir=/tmp]{minted}
nmap <C-l> :!rm -rf /tmp/_minted*
           \ && lualatex -shell-escape -output-directory=/tmp % 2>&1 > /dev/null
           \ && mv /tmp/%:r.pdf . 2>&1 > /dev/null
           \ && evince %:r.pdf 2>&1 > /dev/null &<CR><CR>

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

