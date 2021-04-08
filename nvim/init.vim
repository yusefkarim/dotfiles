" If vim-plug doesn't exist, install it 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')   
Plug 'junegunn/seoul256.vim'
Plug 'ap/vim-buftabline'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'soywod/quicklist.vim'
Plug 'mhinz/vim-signify'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
call plug#end()

" Colorscheme
syntax on
filetype plugin indent on
set termguicolors
set background=dark
let g:seoul256_srgb = 1
let g:seoul256_background = 235
colorscheme seoul256

" vim-markdown plugin
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_new_list_item_indent = 2
autocmd FileType markdown map <CR> <Plug>Markdown_EditUrlUnderCursor

" Language server and autocompletion
" Install rust-analyzer, clangd, python-language-server, pyls-black, texlab, svls
" nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=yes
lua <<EOF

local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

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
nnoremap <silent> <C-s> <cmd>lua vim.lsp.buf.signature_help()<CR>
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

" fzf plugin
nnoremap f :FZF<CR>
nnoremap <C-_> :Lines<CR>

" Quicklist
nnoremap <C-up> <plug>(quicklist-toggle-qf)
nnoremap <up> <plug>(quicklist-prev-item)
nnoremap <down> <plug>(quicklist-next-item)

" Buftabline plugin
let g:buftabline_show = 1
let g:buftabline_plug_max = 0

" NERD Commenter plugin
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
noremap <C-c> :call NERDComment(0,"toggle")<CR>

" Configure folding
set foldmethod=syntax
set foldlevel=99
nnoremap <Space> za
let g:markdown_folding = 1
let g:tex_fold_enabled=1

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
set wrap                            " Enable soft wrapping
set linebreak                       " Move wrapped content to new line
set breakindent                     " Line up indentation of wrapped content 
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
autocmd BufEnter,BufReadPre,BufNewFile *.tex
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
autocmd FileType tex setlocal indentkeys=!^F,o,O,(,),],},\&,=item,=else,=fi
autocmd FileType text setlocal shiftwidth=2 tabstop=2 spelllang=en_us spell
autocmd FileType markdown setlocal conceallevel=2 shiftwidth=2 tabstop=2 spelllang=en_us spell

" Jump around (to get down (and up)) using Ctrl-j/k
noremap <C-j> <C-D>
noremap <C-k> <C-U>
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
" Clear screen and search results whith Ctrl+l
nnoremap <silent> <C-l> :let @/ = ""<CR>:clear<CR>
" Pressing F1 will write file, in normal and insert mode
nnoremap <F1> :w<CR>
inoremap <F1> <ESC>:w<CR>
" F2 and F4 can switch buffers, F3 closes the current buffer
nnoremap <silent> <F2> :bp<CR>
nnoremap <silent> <F3> :bd<CR>
nnoremap <silent> <F4> :bn<CR>

" Custom commands

" Compile to PDF using pandoc
command MD silent !{
    \ pandoc % -s --pdf-engine=lualatex
    \ --highlight-style=breezedark
    \ -f markdown-implicit_figures
    \ -H ~/.config/pandoc/header.tex 
    \ -V fontsize=11pt -V geometry:margin=2cm -V urlcolor:blue
    \ -o %:t:r.pdf
    \ && evince %:t:r.pdf;
    \ } &

" LaTeX stuff
" Use lualatex to create a pdf of the current Latex file
" NOTE: If using the minted package, specify the output directory when
" importing: \usepackage[outputdir=/tmp]{minted}
command T silent !{ 
    \ rm -rf /tmp/_minted* > /dev/null 2>&1
    \ && lualatex -shell-escape -output-directory=/tmp % > /dev/null 2>&1
    \ && biber /tmp/%:t:r > /dev/null 2>&1
    \ ; mv /tmp/%:t:r.pdf . > /dev/null 2>&1
    \ && evince %:t:r.pdf;
    \ } &

" :CC compiles and runs the current file
command CC :term cc % && ./a.out && rm a.out
" Run current Bash script
command SH :term /bin/bash %
" Run current Python3 script
command PY :term python3 %
" Priviliged Python3 script
command PPY :term sudo python3 %
" Run current NodeJS script
command NO :term /bin/node %
" Beautify JSON formatted objects into a new file
command JSON !python3 -m json.tool % > %.json
" Output current date at cursor
command DATE :put =strftime('%A %Y-%m-%d %I:%M %p')
" Create a notebook entry for current day
command ENTRY :put =strftime('[%Y-%m-%d](%Y-%m-%d.md)')
" Run cargo build (rust)
command RB :term cargo build
" Run cargo test
command RT :term cargo test -- --nocapture
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
        execute "term cargo run --bin " . l:file_name
    elseif match(l:abs_path, "example") >= 0
        let l:split_path = split(l:abs_path, '/')
        if match(l:file_name, "main") >= 0 && l:split_path[-2] != "examples"
          let l:file_name = l:split_path[-2]
        endif
        echo "Running example " . l:file_name
        execute "term cargo run --example " . l:file_name
    else
        echo "Running " . l:file_name
        term cargo run
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
