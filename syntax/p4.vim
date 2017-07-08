" Vim syntax file
" Language: P4_16
" Maintainer: Milad Sharif
" Latest Revision: 02 June 2016

syn keyword P4Keyword action const package select
syn keyword P4Keyword table apply control
syn keyword P4Keyword parser state transition
syn keyword P4Keyword extern exit return tuple verify
syn keyword P4Typedef typedef 
syn keyword P4Conditional if else switch
syn keyword P4Type void error match_kind bool bit int varbit
syn keyword P4Direction in inout out
syn keyword P4Label default
syn keyword P4Structure header_union enum struct header
syn keyword P4Boolean true false

" Preprocs
syn region P4Define start="^\s*#\s*\(define\|undef\)\>" skip="\\$" end="$"
syn region  P4PreCondit start="^\s*#\s*\(if\|ifdef\|endif\|ifndef\|elif\)\>" skip="\\$" end="$" contains=P4Comment

syn region P4Included contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match P4Included contained "<[^>]*>"
syn match P4Include "^\s*#\s*include\>\s*["<]" contains=P4Included  

" Numbers
syn match P4Number "\<\(\d\+[s|w]\)\=0[xX]\x\+\>"
syn match P4Number "\<\(\d\+[s|w]\)0[oO]\o\+\>"
syn match P4Number "\<\(\d\+[s|w]\)0[bB][01]\+\>"
syn match P4Number "\<\d\+\>"

" Comments
syn keyword P4Todo contained TODO FIXME XXX
syn match P4Comment "//.*$" contains=P4Todo
syn region P4Comment start="/\*" end="\*/" contains=P4Todo

" Comment
hi def link P4Comment     Comment

" Constant
hi def link P4Constant    Constant
hi def link P4Boolean     Boolean
hi def link P4String      String
hi def link P4Number      Number

" Identifier

" Statement
hi def link P4Conditional Conditional
hi def link P4Label       Label
hi def link P4Operator    Operator
hi def link P4Keyword     Keyword 

" PreProc
hi def link P4PreProc     PreProc
hi def link P4Macro       Macro
hi def link P4Include     Include
hi def link P4Define      Define
hi def link P4PreCondit   PreCondit

"Type
hi def link P4Type        Type
hi def link P4Structure   Structure
hi def link P4Typedef     Typedef

hi def link P4Todo        Todo
