" If vim-plug doesn't exist, install it 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')   
Plug 'junegunn/seoul256.vim'
Plug 'ap/vim-buftabline'
Plug 'mmai/vim-markdown-wiki'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'soywod/quicklist.vim'
Plug 'mhinz/vim-signify'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
call plug#end()

" Gruvbox colorscheme/plugin
syntax on
filetype plugin indent on
set termguicolors
set background=dark
" colorscheme gruvbox8
let g:seoul256_srgb = 1
let g:seoul256_background = 235
colorscheme seoul256

" Quicklist
nmap <C-up> <plug>(quicklist-toggle-qf)
nmap <up> <plug>(quicklist-prev-item)
nmap <down> <plug>(quicklist-next-item)

" Language server and autocompletion
" Install rust-analyzer, clangd, python-language-server, pyls-black, texlab, svls
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=yes
lua <<EOF

local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.pyls.setup({ on_attach=on_attach })
nvim_lsp.clangd.setup({ on_attach=on_attach })
nvim_lsp.texlab.setup({ on_attach=on_attach })
nvim_lsp.svls.setup({ on_attach=on_attach })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)
EOF
nnoremap <silent> <C-d> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-h> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-i> <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-s> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-x> <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-e> <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <C-f> <cmd>lua vim.lsp.buf.formatting()<CR>

" Trigger completion with <tab>
" found in :help completion
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Buftabline plugin
let g:buftabline_show = 1
let g:buftabline_plug_max = 0

" NERD Commenter plugin
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
noremap <C-c> :call NERDComment(0,"toggle")<CR>

" Enable folding
set foldmethod=manual
set foldlevel=99
" Select lines in visual mode then press space to fold those lines.
" Press space again in normal mode to unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Statusline
set laststatus=2
set statusline=%#Normal#%=%f\ %y%r\ %l/%L,\ %c\  

set undofile						            " Enable persistent undo
set lazyredraw                      " Faster scrolling when syntax is on
set nobackup                        " No file backups
set tabstop=8                       " Properly count tabs
set expandtab                       " Expand Tab as spaces
set shiftwidth=4                    " Number of characters to indent by
set autoindent                      " Auto indent
set smartindent                     " Smart indent
set smarttab                        " Higher IQ tabs
set encoding=utf8                   " UTF8 support
set nu                              " Enables line numbers
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
autocmd BufReadPre,BufNewFile *.tex
  \ setfiletype tex |
  \ syntax spell toplevel
autocmd BufReadPre,BufNewFile *.svelte setfiletype html
autocmd BufReadPre,BufNewFile *.md
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

" Jump around (to get down (and up)) using Ctrl-j/k
noremap <silent> <C-j> <C-D>
noremap <silent> <C-k> <C-U>
" Disable up/down arrow keys in visual mode
inoremap <up> <nop>
inoremap <down> <nop>
" Disable left/right arrow keys in normal mode
nnoremap <left> <nop>
nnoremap <right> <nop>
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
