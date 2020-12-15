" If vim-plug doesn't exist, install it 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')   
" Plug 'lifepillar/vim-gruvbox8'
Plug 'junegunn/seoul256.vim'
Plug 'ap/vim-buftabline'
Plug 'w0rp/ale'
Plug 'mmai/vim-markdown-wiki'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
call plug#end()

" Gruvbox colorscheme/plugin
syntax on
set termguicolors
set background=dark
" colorscheme gruvbox8
let g:seoul256_srgb = 1
let g:seoul256_background = 235
colorscheme seoul256

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

" ALE plugin
" Make sure to install flake8, black for Python3; eslint for JS;
" rust-analyzer, clippy, rustfmt for Rust
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘➤'
let g:ale_sign_warning = '⚑➤'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
" Optionally use 'rust': ['analyzer'] for rust_analyzer
let g:ale_linters = {'python': ['flake8'],
                   \ 'rust': ['cargo'],
                   \ 'tex': ['chktex'],
                   \ 'go': ['gofmt'],
                   \ 'c': ['gcc'], 
                   \ 'javascript': ['eslint']}
let b:ale_fixers = {'rust': ['rustfmt'],
                  \ 'python': ['black'],
                  \ 'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore E203'
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

" Enable folding
set foldmethod=manual
set foldlevel=99
" Select lines in visual mode then press space to fold those lines.
" Press space again in normal mode to unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set undofile						" Enable persistent undo
set laststatus=2                    " Statusline
set lazyredraw                      " Faster scrolling when syntax is on
set nobackup                        " No file backups
set shiftwidth=4                    " Number of characters to indent by
set tabstop=4                       " Indentation for tab key
set expandtab                       " Expand Tab as spaces
set smarttab                        " Higher IQ tabs
set encoding=utf8                   " UTF8 support
set nu                              " Enables line numbers
set autoindent                      " Auto indent
set smartindent                     " Smart indent
set cursorline                      " Highlight current line
set colorcolumn=81                  " Highlight the nth column 
"set textwidth=80                    " Start new line after n characters
"set wrap                            " Enable soft wrapping
set linebreak                       " Move wrapped content to new line
set breakindent                     " Line up indentation of wrapped content 
set comments=s1:/*,mb:\ *,elx:\ */  " Smart comments
set showmatch                       " Highlight matching brackets
set incsearch                       " Start searching during typing
set wrapscan      					        " Searches wrap around the end of the file
set hlsearch                        " Highlight all matches
set ignorecase                      " Ignore case when searching
set smartcase                       " Case-sensitive if captial letters are used
set noerrorbells                    " Get rid of bell sounds
set novisualbell                    " Get rid of bell flashes
" set mouse=a                         " Enable using mouse in all modes

" Filetype specific commands
autocmd BufRead,BufNewFile *.tex
  \ setfiletype tex |
  \ syntax spell toplevel
autocmd BufRead,BufNewFile *.svelte setfiletype html
autocmd BufRead,BufNewFile *.md
      \ setfiletype markdown |
      \ syntax spell toplevel
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 spelllang=en_us spell
autocmd FileType text setlocal shiftwidth=2 tabstop=2 spelllang=en_us spell
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 spelllang=en_us spell
autocmd FileType markdown setlocal conceallevel=2

" Disable Page Up/Down
noremap <PageDown> <Nop>
noremap <PageUp> <Nop>
" Jump around (to get down (and up)) using Ctrl-j/k
noremap <silent> <C-j> <C-D>
noremap <silent> <C-k> <C-U>
" Disable up/down arrow keys in visual mode
inoremap <up> <nop>
inoremap <down> <nop>
" Disable left/right arrow keys in normal mode
nnoremap <left> <nop>
nnoremap <right> <nop>
" Use up/down arrow keys in normal mode to navigate ALE errors/warnings
nnoremap <silent> <up> :ALEPrevious<CR>
nnoremap <silent> <down> :ALENext<CR>
nnoremap <silent> <C-down> :ALEDetail<CR>
" Move by editor lines
nnoremap j gj
nnoremap k gk

" Exit terminal insert mode with Esc
tnoremap <Esc> <C-\><C-n>
" Clear search results whith Ctrl+/
nnoremap <silent> <c-_> :noh<CR>
" Pressing F1 will write file, in normal and insert mode
nnoremap <F1> :w<CR>
inoremap <F1> <ESC>:w<CR>
" F2 and F4 can switch buffers, F3 closes the current buffer
nnoremap <silent> <F2> :bp<CR>
nnoremap <silent> <F3> :bd<CR>
nnoremap <silent> <F4> :bn<CR>

" Markdown stuff
function! ToggleCheckbox()
  let states = [' ', 'x']
  let line = getline('.')

  if(match(line, '\[.\]') != -1)
    for state in states
      if(match(line, '\['.state.'\]') != -1)
        let next_state = states[(index(states, state) + 1) % 2]
        let line = substitute(line, '\['.state.'\]', '\['.next_state.'\]', '')
        call setline('.', line)
        break
      endif
    endfor
  endif
endfunction
" Toggle Markdown checkboxes
nnoremap <C-t> :call ToggleCheckbox()<CR>

" LaTeX stuff
" Use lualatex to create a pdf of the current Latex file
" NOTE: If using the minted package, specify the output directory when
" importing: \usepackage[outputdir=/tmp]{minted}
nnoremap <C-l> :!{ 
    \ rm -rf /tmp/_minted*
    \ && lualatex -shell-escape -output-directory=/tmp % 2>&1 > /dev/null
    \ && biber /tmp/%:t:r 2>&1 > /dev/null
    \ ; mv /tmp/%:t:r.pdf . 2>&1 > /dev/null
    \ && pkill -SIGHUP -f %:t:r.pdf;
    \ } &<CR><CR>

" Custom commands
" :CC compiles and runs the current file
command CC !cc % && ./a.out && rm a.out
" :CCM compiles and runs the current file, LINKS THE MATH LIBRARY(math.h)
command CCM !cc % -lm && ./a.out && rm a.out
" Run current Python3 script
command PY :term /usr/bin/env python3 %
" Priviliged Python3 script
command PPY :term sudo /usr/bin/env python3 %
" Run current NodeJS script
command NO :term /bin/node %
" Beautify JSON formatted objects into a new file
command JSON !python3 -m json.tool % > %.json
" Output current date at cursor
command DATE :put =strftime('%A %Y-%m-%d %I:%M %p')
" Run cargo build (rust)
command RB !cargo build
" Disgusting no good function, I apologize to your eyeballs
function! CargoRun()
    let l:abs_path = expand('%:p')
    let l:file_name = expand('%:t:r')

    if match(l:abs_path, "bin") >= 0
        let l:split_path = split(l:abs_path, '/')
        if match(l:file_name, "main") >= 0 && l:split_path[-2] != "bin"
          let l:file_name = l:split_path[-2]
        endif
        echo "Running binary " . l:file_name
        execute "!cargo run --bin " . l:file_name
    elseif match(l:abs_path, "example") >= 0
        let l:split_path = split(l:abs_path, '/')
        if match(l:file_name, "main") >= 0 && l:split_path[-2] != "examples"
          let l:file_name = l:split_path[-2]
        endif
        echo "Running example " . l:file_name
        execute "!cargo run --example " . l:file_name
    else
        echo "Running " . l:file_name
        !cargo run
    endif
endfunction
" Run cargo run (rust)
command RR call CargoRun()
" Run cargo fmt (rust)
command RF !cargo fmt

" Extra custom highlighting preferences
hi htmlH1 guifg=#FFBD98 guibg=NONE gui=BOLD
hi htmlH2 guifg=#FFBFBD guibg=NONE gui=BOLD
hi htmlH3 guifg=#98BCBD guibg=NONE gui=BOLD
hi htmlH4 guifg=#DFDFFF guibg=NONE gui=BOLD
