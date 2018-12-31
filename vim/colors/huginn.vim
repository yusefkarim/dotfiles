" Vim colorscheme
" Heavily based of off the monokai colorscheme
"
" Name:       huginn
" Maintainer: Yusef Karim
" License:    BSD
" ============================ SETUP ============================
set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif

set t_Co=256
let g:colors_name = 'huginn'

" ============================ COLORS ============================
"   Green           148
"   Blue            39
"   LightBlue       81
"   Purple          141
"   Magenta         197
"   White           255
"   BrightWhite     231
"   Grey            59
"   Red             88
"   Pink            168
"   Orange          208
"   LightYellow     185

" ------ Editor ------
hi Normal                   ctermfg=231 ctermbg=0 cterm=None
hi Cursor                   ctermfg=None ctermbg=None cterm=Reverse
hi Visual                   ctermfg=None ctermbg=59 cterm=None
hi CursorLine               ctermfg=None ctermbg=237 cterm=None
hi CursorColumn             ctermfg=None ctermbg=237 cterm=None
hi ColorColumn              ctermfg=None ctermbg=237 cterm=None
hi LineNr                   ctermfg=102 ctermbg=None cterm=None
hi VertSplit                ctermfg=241 ctermbg=241 cterm=None
hi MatchParen               ctermfg=197 ctermbg=None cterm=Underline
hi StatusLine               ctermfg=231 ctermbg=241 cterm=Bold
hi StatusLineNC             ctermfg=231 ctermbg=241 cterm=None
hi Pmenu                    ctermfg=None ctermbg=None cterm=None
hi PmenuSel                 ctermfg=None ctermbg=59 cterm=None
hi IncSearch                ctermfg=235 ctermbg=186 cterm=None
hi Search                   ctermfg=235 ctermbg=186 cterm=None
hi Folded                   ctermfg=242 ctermbg=235 cterm=None
hi SignColumn               ctermfg=None ctermbg=237 cterm=None
" Effects syntastic
hi Directory                ctermfg=185 ctermbg=None cterm=None


" ------ Syntax -----
" Variable and type identifiers
hi Identifier               ctermfg=81 ctermbg=None cterm=None
hi Type                     ctermfg=197 ctermbg=None cterm=None
hi Structure                ctermfg=148 ctermbg=None cterm=None
hi TypeDef                  ctermfg=148 ctermbg=None cterm=None
" static, register, volatile, etc
hi StorageClass             ctermfg=208 ctermbg=None cterm=None
" Constants and numbers
hi Constant                 ctermfg=168 ctermbg=None cterm=None
hi Character                ctermfg=168 ctermbg=None cterm=None
hi String                   ctermfg=168 ctermbg=None cterm=None
hi Boolean                  ctermfg=168 ctermbg=None cterm=None
hi Number                   ctermfg=185 ctermbg=None cterm=None
hi Float                    ctermfg=185 ctermbg=None cterm=None
" Function name
hi Function                 ctermfg=148 ctermbg=None cterm=None
" Statements
hi Statement                ctermfg=197 ctermbg=None cterm=None
" if, then, else, endif, switch, etc.
hi Conditional              ctermfg=197 ctermbg=None cterm=None
" for, do, while, etc.
hi Repeat                   ctermfg=197 ctermbg=None cterm=None
" case, default, etc.
hi Label                    ctermfg=186 ctermbg=None cterm=None
" try, catch, throw
hi Exception                ctermfg=186 ctermbg=None cterm=None
" sizeof, +, *, etc.
hi Operator                 ctermfg=197 ctermbg=None cterm=None
" Any other keyword
hi Keyword                  ctermfg=197 ctermbg=None cterm=None

" Comments and messages
hi Comment                  ctermfg=242 ctermbg=None cterm=None
hi SpecialComment           ctermfg=242 ctermbg=None cterm=None
hi ErrorMsg                 ctermfg=231 ctermbg=None cterm=None
hi WarningMsg               ctermfg=231 ctermbg=None cterm=None
hi Todo                     ctermfg=255 ctermbg=None cterm=Bold
hi Special                  ctermfg=231 ctermbg=None cterm=None

" Preprocessors
hi PreProc                  ctermfg=039 ctermbg=None cterm=None
hi Include                  ctermfg=039 ctermbg=None cterm=None
hi Define                   ctermfg=039 ctermbg=None cterm=None
hi Macro                    ctermfg=039 ctermbg=None cterm=None
hi PreCondit                ctermfg=039 ctermbg=None cterm=None

" Spelling
hi SpellCap                 ctermfg=185 ctermbg=None cterm=None
hi SpellBad                 ctermfg=185 ctermbg=None cterm=None
hi SpellLocal               ctermfg=185 ctermbg=None cterm=None
hi SpellRare                ctermfg=185 ctermbg=None cterm=None

" ----- Other stuff (I don't know what these do!) ------
hi DiffAdd                  ctermfg=231 ctermbg=None cterm=Bold
hi DiffDelete               ctermfg=88 ctermbg=None cterm=None
hi DiffChange               ctermfg=None ctermbg=None cterm=None
hi DiffText                 ctermfg=231 ctermbg=None cterm=Bold
hi NonText                  ctermfg=59 ctermbg=None cterm=None
hi SpecialKey               ctermfg=59 ctermbg=None cterm=None
hi Underlined               ctermfg=None ctermbg=None cterm=Underline
hi Title                    ctermfg=148 ctermbg=None cterm=Bold
hi Tag                      ctermfg=197 ctermbg=None cterm=None


" ------ html ------
hi htmlH1                   ctermfg=148 ctermbg=None cterm=None
hi htmlH2                   ctermfg=148 ctermbg=None cterm=None
hi htmlH3                   ctermfg=148 ctermbg=None cterm=None
hi htmlEndTag               ctermfg=148 ctermbg=None cterm=None
hi htmlTagName              ctermfg=None ctermbg=None cterm=None
hi htmlArg                  ctermfg=None ctermbg=None cterm=None
hi htmlSpecialChar          ctermfg=141 ctermbg=None cterm=None

" ------ markdown ------
hi markdownH1               ctermfg=148 ctermbg=None cterm=Bold
hi markdownH2               ctermfg=39 ctermbg=None cterm=Bold
hi markdownH3               ctermfg=141 ctermbg=None cterm=Bold
hi markdownH4               ctermfg=231 ctermbg=None cterm=Bold
hi markdownH5               ctermfg=231 ctermbg=None cterm=Bold
hi markdownH6               ctermfg=59 ctermbg=None cterm=Bold
hi markdownBold             ctermfg=231 ctermbg=None cterm=Bold
hi markdownBlockquote       ctermfg=231 ctermbg=None cterm=None
hi markdownBoldItalic       ctermfg=231 ctermbg=None cterm=Bold,Italic
hi markdownItalic           ctermfg=231 ctermbg=None cterm=Italic

" ----- javascript -----
hi javaScriptFunction       ctermfg=81 ctermbg=None cterm=None
hi javaScriptRailsFunction  ctermfg=81 ctermbg=None cterm=None
hi javaScriptBraces         ctermfg=None ctermbg=None cterm=None

" ----- css -----
hi cssURL                   ctermfg=208 ctermbg=None cterm=None
hi cssFunctionName          ctermfg=81 ctermbg=None cterm=None
hi cssColor                 ctermfg=141 ctermbg=None cterm=None
hi cssPseudoClassId         ctermfg=148 ctermbg=None cterm=None
hi cssClassName             ctermfg=148 ctermbg=None cterm=None
hi cssValueLength           ctermfg=141 ctermbg=None cterm=None
hi cssCommonAttr            ctermfg=81 ctermbg=None cterm=None
hi cssBraces                ctermfg=None ctermbg=None cterm=None

