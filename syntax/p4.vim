" Vim syntax file
" Language: P4
" Maintainer: Milad Sharif
" Latest Revision: 03 Oct 2017
" Options: p4_version = 14 or 16
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("p4_version")
  " Default is p4.16
  let p4_version = 16
endif


if p4_version == 14

  syn keyword P4Builtin apply                                       
  syn keyword P4Builtin extract set_metadata                                 
  syn keyword P4Builtin add_header copy_header remove_header                 
  syn keyword P4Builtin modify_field add_to_field                            
  syn keyword P4Builtin set_field_to_hash_index                              
  syn keyword P4Builtin modify_field_with_hash_based_offset                  
  syn keyword P4Builtin truncate drop                                        
  syn keyword P4Builtin count meter                                          
  syn keyword P4Builtin generate_digest                                      
  syn keyword P4Builtin resubmit recirculate                                 
  syn keyword P4Builtin clone_ingress_pkt_to_ingress                         
  syn keyword P4Builtin clone_egress_pkt_to_ingress                          
  syn keyword P4Builtin clone_ingress_pkt_to_egress                          
  syn keyword P4Builtin clone_egress_pkt_to_egress 

  syn keyword P4Keyword parser parser_value_set return
  syn keyword P4Keyword table action action_profile                                
  syn keyword P4Keyword header_type header metadata                   
  syn keyword P4Keyword field_list field_list_calculation calculated_field   
  syn keyword P4Keyword control                                              
  syn keyword P4Keyword counter meter register
  syn keyword P4Label default

  syn keyword P4Attribute reads actions action_profile dynamic_action_selection min_size max_size size
  syn keyword P4Attribute fields length max_length                    
  syn keyword P4Attribute input algorithm output_width                
  syn keyword P4Attribute verify update
  syn keyword P4Attribute type direct static width                         
  syn keyword P4Attribute instance_count min_width saturating  

elseif p4_version == 16

  syn keyword P4Keyword action select
  syn keyword P4Keyword table apply transition
  syn keyword P4Keyword exit return tuple
  syn keyword P4Builtin verify
  syn keyword P4Typedef typedef 
  syn keyword P4Conditional if else switch
  syn keyword P4Type void error match_kind bool bit int varbit
  syn keyword P4Type extern parser control package
  syn keyword P4StorageClass const
  syn keyword P4Direction in inout out
  syn keyword P4Label default
  syn keyword P4Structure header_union enum struct header
  syn keyword P4Boolean true false

  syn keyword P4Attribute key actions size
endif

" Preprocs
syn region P4Define start="^\s*#\s*\(define\|undef\)\>" skip="\\$" end="$"
syn region  P4PreCondit start="^\s*#\s*\(if\|ifdef\|endif\|else\|ifndef\|elif\)\>" skip="\\$" end="$" contains=P4Comment

syn region P4Included contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match P4Included contained "<[^>]*>"
syn match P4Include "^\s*#\s*include\>\s*["<]" contains=P4Included  

" Numbers
if p4_version == 16
  syn match P4Number "\<\(\d\+[s|w]\)\=0[xX]\x\+\>"
  syn match P4Number "\<\(\d\+[s|w]\)0[oO]\o\+\>"
  syn match P4Number "\<\(\d\+[s|w]\)0[bB][01]\+\>"
elseif p4_version == 14
  syn match P4Number "\<0[xX]\x\+\>"
  syn match P4Number "\<0[oO]\o\+\>"
  syn match P4Number "\<0[bB][01]\+\>"
endif
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
hi def link P4Attribute   Identifier
hi def link P4Builtin 	  Function

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
hi def link P4StorageClass StorageClass
hi def link P4Direction   StorageClass

hi def link P4Todo        Todo
