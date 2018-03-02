" Vim colorscheme
" Heavily based of off the monokai colorscheme
" Created by: Yusef Karim

" ============================ SETUP ============================ 
set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif

set t_Co=256
let g:colors_name = "huginn"

" ============================ COLORS ============================
"   Green       148 
"   Blue        39 
"   Purple      141
"   Magenta     197
"   White1      231
"   White2      255
"   Grey        59
"   Red         88

" ------ Editor ------
hi Cursor ctermfg=235 ctermbg=231 cterm=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
hi LineNr ctermfg=102 ctermbg=NONE cterm=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE
hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold 
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE
hi IncSearch ctermfg=235 ctermbg=186 cterm=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline
hi Folded ctermfg=242 ctermbg=235 cterm=NONE
hi SignColumn ctermfg=NONE ctermbg=237 cterm=NONE
" Effects syntastic
hi Directory ctermfg=185 ctermbg=NONE cterm=NONE


" ------ Syntax -----

" Normal text
hi Normal ctermfg=231 ctermbg=235 cterm=NONE

" Variable and type identifiers
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE
hi Type ctermfg=197 ctermbg=NONE cterm=NONE
hi Structure ctermfg=148 ctermbg=NONE cterm=NONE
hi TypeDef ctermfg=148 ctermbg=NONE cterm=NONE
" static, register, volatile, etc
hi StorageClass ctermfg=208 ctermbg=NONE cterm=NONE

" Constants and numbers
hi Constant ctermfg=168 ctermbg=NONE cterm=NONE
hi Character ctermfg=168 ctermbg=NONE cterm=NONE
hi String ctermfg=168 ctermbg=NONE cterm=NONE
hi Boolean ctermfg=168 ctermbg=NONE cterm=NONE
hi Number ctermfg=185 ctermbg=NONE cterm=NONE
hi Float ctermfg=185 ctermbg=NONE cterm=NONE

" Function name
hi Function ctermfg=148 ctermbg=NONE cterm=NONE

" Statements
hi Statement ctermfg=197 ctermbg=NONE cterm=NONE
" if, then, else, endif, switch, etc.
hi Conditional ctermfg=197 ctermbg=NONE cterm=NONE
" for, do, while, etc.
hi Repeat ctermfg=197 ctermbg=NONE cterm=NONE
" case, default, etc.
hi Label ctermfg=186 ctermbg=NONE cterm=NONE
" try, catch, throw
hi Exception ctermfg=186 ctermbg=NONE cterm=NONE
" sizeof, +, *, etc.
hi Operator ctermfg=197 ctermbg=NONE cterm=NONE
" Any other keyword
hi Keyword ctermfg=197 ctermbg=NONE cterm=NONE

" Comments and messages
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE
hi SpecialComment ctermfg=242 ctermbg=NONE cterm=NONE
hi ErrorMsg ctermfg=231 ctermbg=NONE cterm=NONE
hi WarningMsg ctermfg=231 ctermbg=NONE cterm=NONE
hi Todo ctermfg=255 ctermbg=NONE cterm=bold
hi Special ctermfg=231 ctermbg=NONE cterm=NONE

" Preprocessors
hi PreProc ctermfg=039 ctermbg=NONE cterm=NONE
hi Include ctermfg=039 ctermbg=NONE cterm=NONE
hi Define ctermfg=039 ctermbg=NONE cterm=NONE
hi Macro ctermfg=039 ctermbg=NONE cterm=NONE
hi PreCondit ctermfg=039 ctermbg=NONE cterm=NONE

" Spelling
hi SpellCap ctermfg=185 ctermbg=NONE cterm=NONE
hi SpellBad ctermfg=185 ctermbg=NONE cterm=NONE
hi SpellLocal ctermfg=185 ctermbg=NONE cterm=NONE
hi SpellRare ctermfg=185 ctermbg=NONE cterm=NONE

" ----- Other stuff (I don't know what these do!) ------
hi DiffAdd ctermfg=231 ctermbg=NONE cterm=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffText ctermfg=231 ctermbg=NONE cterm=bold
hi NonText ctermfg=59 ctermbg=NONE cterm=NONE
hi SpecialKey ctermfg=59 ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
hi Title ctermfg=148 ctermbg=NONE cterm=bold
hi Tag ctermfg=197 ctermbg=NONE cterm=NONE


" ------ html ------
hi htmlH1 ctermfg=148 ctermbg=NONE cterm=NONE
hi htmlH2 ctermfg=148 ctermbg=NONE cterm=NONE
hi htmlH3 ctermfg=148 ctermbg=NONE cterm=NONE
hi htmlEndTag ctermfg=148 ctermbg=NONE cterm=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE

" ------ markdown ------
hi markdownH1 ctermfg=148 ctermbg=NONE cterm=bold
hi markdownH2 ctermfg=39 ctermbg=NONE cterm=bold
hi markdownH3 ctermfg=141 ctermbg=NONE cterm=bold
hi markdownH4 ctermfg=231 ctermbg=NONE cterm=bold
hi markdownH5 ctermfg=231 ctermbg=NONE cterm=bold
hi markdownH6 ctermfg=59 ctermbg=NONE cterm=bold
hi markdownBold ctermfg=231 ctermbg=NONE cterm=bold
hi markdownBlockquote ctermfg=231 ctermbg=NONE cterm=NONE
hi markdownBoldItalic ctermfg=231 ctermbg=NONE cterm=bold,italic
hi markdownItalic ctermfg=231 ctermbg=NONE cterm=italic

" ----- javascript -----
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE

" ----- css -----
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE

