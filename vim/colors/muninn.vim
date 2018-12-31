" Vim colorscheme
"
" Name:       muninn
" Maintainer: Yusef Karim
" License:    BSD
" ============================ SETUP ============================
set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif

set t_Co=256
let g:colors_name = 'muninn'

" ============================ COLORS ============================
"   Black           0
"   White           255
"   BrightWhite     15
"   Grey            242
"   DarkGrey        234
"   DarkerGrey      232
"   Red             196
"   Blue            31
"   Pink            168
"   LightOrange     214
"   Orange          208
"   Magenta         197
"   LightYellow     185
"   BrightYellow    226

" ------ Editor ------
hi Normal                   ctermfg=255 ctermbg=232 cterm=None
hi Cursor                   ctermfg=None ctermbg=None cterm=None
hi Visual                   ctermfg=255 ctermbg=242 cterm=Bold
hi CursorLine               ctermfg=None ctermbg=234 cterm=None
hi LineNr                   ctermfg=242 ctermbg=None cterm=None
hi CursorLineNr             ctermfg=185 ctermbg=None cterm=None
hi MatchParen               ctermfg=197 ctermbg=None cterm=Bold
hi IncSearch                ctermfg=234 ctermbg=185 cterm=None
hi Search                   ctermfg=234 ctermbg=185 cterm=None
hi Folded                   ctermfg=242 ctermbg=234 cterm=None
" Effects syntastic
hi Directory                ctermfg=185 ctermbg=None cterm=None


" ------ Syntax -----
" Variable and type identifiers
hi Identifier               ctermfg=255 ctermbg=None cterm=None
hi Type                     ctermfg=15 ctermbg=None cterm=Bold
hi Structure                ctermfg=255 ctermbg=None cterm=None
hi TypeDef                  ctermfg=255 ctermbg=None cterm=None
" static, register, volatile, etc
hi StorageClass             ctermfg=208 ctermbg=None cterm=Bold
" Constants and numbers
hi Constant                 ctermfg=255 ctermbg=None cterm=None
hi Character                ctermfg=31 ctermbg=None cterm=None
hi String                   ctermfg=31 ctermbg=None cterm=None
hi Boolean                  ctermfg=185 ctermbg=None cterm=None
hi Number                   ctermfg=185 ctermbg=None cterm=None
hi Float                    ctermfg=185 ctermbg=None cterm=None
" Function name
hi Function                 ctermfg=255 ctermbg=None cterm=None
" Statements
hi Statement                ctermfg=255 ctermbg=None cterm=None
" if, then, else, endif, switch, etc.
hi Conditional              ctermfg=15 ctermbg=None cterm=Bold
" for, do, while, etc.
hi Repeat                   ctermfg=15 ctermbg=None cterm=Bold
" case, default, etc.
hi Label                    ctermfg=15 ctermbg=None cterm=Bold
" try, catch, throw
hi Exception                ctermfg=15 ctermbg=None cterm=Bold
" sizeof, +, *, etc.
hi Operator                 ctermfg=197 ctermbg=None cterm=Bold
" Any other keyword
hi Keyword                  ctermfg=15 ctermbg=None cterm=Bold
" '::' in Rust
hi Special                  ctermfg=255 ctermbg=None cterm=None

" Comments and messages
hi Comment                  ctermfg=242 ctermbg=None cterm=None
hi SpecialComment           ctermfg=242 ctermbg=None cterm=None
hi ErrorMsg                 ctermfg=226 ctermbg=None cterm=None
hi WarningMsg               ctermfg=226 ctermbg=None cterm=None
hi Todo                     ctermfg=226 ctermbg=None cterm=Bold

" Preprocessors
hi PreProc                  ctermfg=15 ctermbg=None cterm=Bold
hi Include                  ctermfg=15 ctermbg=None cterm=Bold
hi Define                   ctermfg=15 ctermbg=None cterm=Bold
hi Macro                    ctermfg=15 ctermbg=None cterm=Bold
hi PreCondit                ctermfg=15 ctermbg=None cterm=Bold

" Spelling
" Syntastic warning message
hi SpellCap                 ctermfg=0 ctermbg=226 cterm=None
" Syntastic error message
hi SpellBad                 ctermfg=0 ctermbg=196 cterm=None
hi SpellLocal               ctermfg=0 ctermbg=226 cterm=None
hi SpellRare                ctermfg=0 ctermbg=226 cterm=None

" ------ markdown ------
hi markdownH1               ctermfg=148 ctermbg=None cterm=bold
hi markdownH2               ctermfg=39 ctermbg=None cterm=bold
hi markdownH3               ctermfg=141 ctermbg=None cterm=bold
hi markdownH4               ctermfg=231 ctermbg=None cterm=bold
hi markdownH5               ctermfg=231 ctermbg=None cterm=bold
hi markdownH6               ctermfg=242 ctermbg=None cterm=bold
hi markdownBold             ctermfg=231 ctermbg=None cterm=bold
hi markdownBlockquote       ctermfg=231 ctermbg=None cterm=None
hi markdownBoldItalic       ctermfg=231 ctermbg=None cterm=Bold,Italic
hi markdownItalic           ctermfg=231 ctermbg=None cterm=Italic

" Rust
hi rustFuncName             ctermfg=214 ctermbg=None cterm=Bold
hi rustStructure            ctermfg=15 ctermbg=None cterm=Bold
hi rustTrait                ctermfg=15 ctermbg=None cterm=Bold
hi rustType                 ctermfg=15 ctermbg=None cterm=Bold
hi rustIdentifier           ctermfg=214 ctermbg=None cterm=Bold
hi rustKeyword              ctermfg=15 ctermbg=None cterm=Bold
hi rustLifetime             ctermfg=15 ctermbg=None cterm=Bold
hi rustMacro                ctermfg=15 ctermbg=None cterm=Bold
hi rustMacroVariable        ctermfg=15 ctermbg=None cterm=Bold
hi rustModPath              ctermfg=None ctermbg=None cterm=None
hi rustSelf                 ctermfg=168 ctermbg=None cterm=None
hi rustConstant             ctermfg=255 ctermbg=None cterm=None
hi rustKeyword              ctermfg=15 ctermbg=None cterm=Bold
hi rustReservedKeyword      ctermfg=15 ctermbg=None cterm=Bold
hi rustCommentBlockDoc      ctermfg=242 ctermbg=None cterm=None
hi rustCommentLineDoc       ctermfg=242 ctermbg=None cterm=None
hi rustEscapeError          ctermfg=196 ctermbg=None cterm=None

" Python
"hi pythonBuiltin            ctermfg=None ctermbg=None cterm=None
"hi pythonClassVar           ctermfg=None ctermbg=None cterm=None
"hi pythonCoding             ctermfg=None ctermbg=None cterm=None
"hi pythonException          ctermfg=None ctermbg=None cterm=None
"hi pythonImport             ctermfg=None ctermbg=None cterm=None
"hi pythonOperator           ctermfg=None ctermbg=None cterm=None
"hi pythonRepeat             ctermfg=None ctermbg=None cterm=None
"hi pythonRun                ctermfg=None ctermbg=None cterm=None
"hi pythonStatement          ctermfg=None ctermbg=None cterm=None
