" If vim-plug doesn't exist, install it 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')   
Plug 'morhetz/gruvbox'
Plug 'ap/vim-buftabline'
Plug 'w0rp/ale'
Plug 'mmai/vim-markdown-wiki'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'cespare/vim-toml'
call plug#end()

" Gruvbox colorscheme/plugin
let g:gruvbox_guisp_fallback = "bg"  " Fix gruxbox spell check highlighting
set termguicolors
set background=dark
colorscheme gruvbox

" Buftabline plugin
let g:buftabline_show = 1
let g:buftabline_plug_max = 0

" NERD Commenter plugin
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
nnoremap <C-c> :call NERDComment(0,"toggle")<CR>
vnoremap <C-c> :call NERDComment(0,"toggle")<CR>

" fzf plugin
nnoremap <C-f> :FZF<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-s> :Lines<CR>
let g:fzf_layout = { 'window': 'rightbelow 15new' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ALE plugin
" Make sure to install flake8 for Python3, eslint for JS
"let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘➤'
let g:ale_sign_warning = '⚑➤'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
"let g:ale_linters = {'python': ['flake8'], 'c': ['gcc', 'cppcheck']}
" \ 'rust': ['cargo', 'rls'],
let g:ale_linters = {'python': ['flake8'],
                   \ 'rust': ['cargo'],
                   \ 'c': ['gcc'], 
                   \ 'javascript': ['eslint']}
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_rust_cargo_use_clippy = 1
let g:ale_c_gcc_options = '-Wall -Wextra -Wunused -Wpedantic'
command ST let g:ale_c_gcc_executable = 'arm-none-eabi-gcc' |
            \ let g:ale_c_gcc_options .= ' -I../CMSIS/inc -Iinc' |
            \ ALELint

" Statusline (relies on ALE)
function! LinterStatus() abort
    let l:error = ale#statusline#FirstProblem(bufnr(''),'error')
    let l:warning = ale#statusline#FirstProblem(bufnr(''),'warning')
    if len(l:error)
        if l:error['lnum'] == line('.')
            return ""
        else
            hi statusline gui=underline guifg=#fb4934 guibg=NONE cterm=underline ctermfg=167 ctermbg=NONE
            return l:error['lnum']."--➤".l:error['text']
        endif
    elseif len(l:warning)
        if l:warning['lnum'] == line('.')
            return ""
        else
            hi statusline gui=underline guifg=#fabd2f guibg=NONE cterm=underline ctermfg=214 ctermbg=NONE
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

set laststatus=2                    " Statusline
set lazyredraw                      " Faster scrolling when syntax is on
set nobackup                        " No file backups
set shiftwidth=4                    " Number of characters to indent by
set tabstop=4                       " Indentation for tab key
set expandtab                       " Expand Tab as spaces
set smarttab                        " Higher IQ tabs
set encoding=utf8                   " UTF8 support
set nu                              " Enables line numbers
set ai                              " Auto indent
set si                              " Smart indent
set cursorline                      " Highlight current line
set colorcolumn=81                  " Highlight the nth column 
"set textwidth=80                    " Start new line after n characters
"set wrap                            " Enable soft wrapping
set linebreak                       " Move wrapped content to new line
set breakindent                     " Line up indentation of wrapped content 
set comments=s1:/*,mb:\ *,elx:\ */  " Smart comments
set showmatch                       " Highlight matching brackets
set incsearch                       " Start searching during typing
set hlsearch                        " Highlight all matches
set ignorecase                      " Ignore case when searching
set smartcase                       " Case-sensitive if captial letters are used
set noerrorbells                    " Get rid of bell sounds
set novisualbell                    " Get rid of bell flashes

" Filetype specific commands
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 spelllang=en_us spell
" autocmd BufRead,BufNewFile *.svelte setfiletype html

" Disable Page Up/Down in insert mode
inoremap <PageDown> <Nop>
inoremap <PageUp> <Nop>
" Exit terminal insert mode with Esc
tnoremap <Esc> <C-\><C-n>
" Open file/directory tree with Ctrl+n
nnoremap <C-n> :Ntree<CR>
" Clear search results when Enter is pressed
nnoremap <silent> <CR> :noh<CR><CR>

" Pressing F1 will write file, in normal and insert mode
nnoremap <F1> :w<CR>
inoremap <F1> <ESC>:w<CR>
" Change between buffers with F2 and F4, F3 will close current buffer
nnoremap <silent> <F2> :bprev<CR>
nnoremap <silent> <F3> :bd<CR>
nnoremap <silent> <F4> :bnext<CR>
" Change current window with F5
nnoremap <silent> <F5> <C-w><C-w>
" ALE shortcuts, F6 to prev error, F7 to run ALEDetail, F8 to next error
nnoremap <silent> <F6> :ALEPrevious<CR>
nnoremap <silent> <F7> :ALEDetail<CR>
nnoremap <silent> <F8> :ALENext<CR>

" Ctrl-t will use lualatex to create a pdf of the current latex file then
" display it with evince
" NOTE: If using the minted package, specify the output directory when
" importing: \usepackage[outputdir=/tmp]{minted}
nnoremap <C-t> :!rm -rf /tmp/_minted*
    \ && lualatex -shell-escape -output-directory=/tmp % 2>&1 > /dev/null
    \ && mv /tmp/%:t:r.pdf . 2>&1 > /dev/null
    \ && evince %:t:r.pdf 2>&1 > /dev/null &<CR><CR>

" My commands
" :CC compiles and runs the current file
command CC !cc % && ./a.out && rm a.out
" :CCM compiles and runs the current file, LINKS THE MATH LIBRARY(math.h)
command CCM !cc % -lm && ./a.out && rm a.out
" Run current Python3 script
command PY :term /usr/bin/env python3 %
" Priviliged Python3 script
command PPY :term sudo /usr/bin/env python3 %
" Beautify JSON formatted objects into a new file
command JSON !python3 -m json.tool % > %.json
" Output current date at cursor
command DATE :put =strftime('%A %Y-%m-%d %I:%M %p')
" Run cargo build (rust)
command RB !cargo build
function! CargoRun()
    if match(expand('%:p'), "bin") > 0
        echo "Running binary " . expand('%:t')
        !cargo run --bin %:t:r
    else
        echo "Running " . expand('%:t')
        !cargo run
    endif
endfunction
" Run cargo run (rust)
command RR call CargoRun()

" Overwrite default error/warning colorscheme for ALE
" hi ALEError gui=underline guifg=#fb4934 guibg=NONE cterm=underline ctermfg=167 ctermbg=NONE
" hi ALEWarning gui=underline guifg=#fabd2f guibg=NONE cterm=underline ctermfg=214 ctermbg=NONE
hi ALEError gui=None guifg=NONE guibg=NONE cterm=None ctermfg=NONE ctermbg=NONE
hi ALEWarning gui=None guifg=NONE guibg=NONE cterm=None ctermfg=NONE ctermbg=NONE
