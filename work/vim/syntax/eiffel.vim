" vim:sw=2
" Eiffel syntax file
" Language:	Eiffel
" Maintainer:	Reimer Behrends <behrends@cse.msu.edu>
"		With much input from Jocelyn Fiat <fiat@eiffel.com>
" See http://www.cse.msu.edu/~behrends/vim/ for the most current version.
" Last Change:	2001 May 09

" Modified:	2006/03/07  Jérémie DELAITRE for SE 2.x

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Option handling

" Set strict options by default to best feat SE 2.x
if !exists("not_smarteiffel")
  unlet! eiffel_ignore_case
  let eiffel_pedantic=1
  let eiffel_strict=1

  syn keyword eiffelError	NONE
endif

if exists("eiffel_ignore_case")
  syn case ignore
else
  syn case match
  if exists("eiffel_pedantic") || exists("eiffel_strict")
    syn keyword eiffelError	current void result precursor none
    syn keyword eiffelError	CURRENT VOID RESULT PRECURSOR None
    syn keyword eiffelError	TRUE FALSE
  endif
  if exists("eiffel_pedantic")
    syn keyword eiffelError	true false
    syn match eiffelError	"\<[a-z_]\+[A-Z][a-zA_Z_]*\>"
    syn match eiffelError	"\<[A-Z][a-z_]*[A-Z][a-zA-Z_]*\>"
  endif
  if exists("eiffel_lower_case_predef")
    syn keyword eiffelPredefined current void result precursor
  endif
endif

if exists("eiffel_hex_constants")
  syn match  eiffelNumber	"\d[0-9a-fA-F]*[xX]"
endif

" Keyword definitions

syn keyword eiffelTopStruct	indexing feature creation inherit insert
syn match   eiffelTopStruct	"\<class\>"
syn match   eiffelKeyword	"\<end\>"
syn match   eiffelTopStruct	"^end\>\(\s*--\s\+class\s\+\<[A-Z][A-Z0-9_]*\>\)\=" contains=eiffelClassName
syn match   eiffelBrackets	"[[\]]"
syn match eiffelBracketError	"\]"
syn region eiffelGeneric	transparent matchgroup=eiffelBrackets start="\[" end="\]" contains=ALLBUT,eiffelBracketError,eiffelStringError,eiffelStringEscape,eiffelTopStruct
syn keyword eiffelDeclaration	is do once deferred unique local agent create attribute
syn keyword eiffelDeclaration	Unique
syn keyword eiffelProperty	expanded obsolete separate frozen
syn keyword eiffelProperty	prefix infix
syn keyword eiffelInheritClause	rename redefine undefine select export as
syn keyword eiffelAll		all
syn keyword eiffelKeyword	external alias
syn keyword eiffelStatement	if else elseif inspect
syn keyword eiffelStatement	when then
syn match   eiffelAssertion	"\<require\(\s\+else\)\=\>"
syn match   eiffelAssertion	"\<ensure\(\s\+then\)\=\>"
syn keyword eiffelAssertion	check
syn keyword eiffelDebug		debug
syn keyword eiffelStatement	from until loop
syn keyword eiffelAssertion	variant
syn match   eiffelAssertion	"\<invariant\>"
syn match   eiffelTopStruct	"^invariant\>"
syn keyword eiffelException	rescue retry

syn keyword eiffelPredefined	Current Void Result Precursor

" Operators
syn match   eiffelOperator	"\<and\(\s\+then\)\=\>"
syn match   eiffelOperator	"\<or\(\s\+else\)\=\>"
syn keyword eiffelOperator	xor implies not
syn keyword eiffelOperator	strip old
syn keyword eiffelOperator	Strip
syn match   eiffelOperator	"\$"
syn match   eiffelCreation	"!"
syn match   eiffelExport	"[{}]"
syn match   eiffelArray		"<<"
syn match   eiffelArray		">>"
syn match   eiffelConstraint	"->"
syn match   eiffelOperator	"[@#|&][^ \e\t\ba-zA-Z0-9%'\"]*"

" Special classes
syn keyword eiffelAnchored	like
syn keyword eiffelBitType	BIT

" Constants
if !exists("eiffel_pedantic")
  syn keyword eiffelBool	true false
endif
syn keyword eiffelBool		True False
syn region  eiffelString	start=+"+ skip=+%"+ end=+"+ contains=eiffelStringEscape,eiffelStringError
syn match   eiffelStringEscape	contained "%[^/]"
syn match   eiffelStringEscape	contained "%/\(\d\+\|0x\x\+\)/"
syn match   eiffelStringEscape	contained "^[ \t]*%"
syn match   eiffelStringEscape	contained "%[ \t]*$"
syn match   eiffelStringError	contained "%/[^0-9]"
syn match   eiffelStringError	contained "%/\d\+[^0-9/]"
syn match   eiffelBadConstant	"'\(%[^/]\|%/\(\d\+\|0x\x\+\)/\|[^'%]\)\+'"
syn match   eiffelBadConstant	"''"
syn match   eiffelCharacter	"'\(%[^/]\|%/\(\d\+\|0x\x\+\)/\|[^'%]\)'" contains=eiffelStringEscape
syn match   eiffelNumber	"-\=\<\d\+\(_\d\+\)*\>"
syn match   eiffelNumber	"\<[01]\+[bB]\>"
syn match   eiffelNumber	"-\=\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\)\=\([eE][-+]\=\d\+\(_\d\+\)*\)\="
syn match   eiffelNumber	"-\=\.\d\+\(_\d\+\)*\([eE][-+]\=\d\+\(_\d\+\)*\)\="
syn match   eiffelComment	"--.*" contains=eiffelTodo

syn case match

" Case sensitive stuff

syn keyword eiffelTodo		contained TODO XXX FIXME
syn match   eiffelClassName	"\<[A-Z][A-Z0-9_]*\>"

" Catch mismatched parentheses
syn match eiffelParenError	")"
syn region eiffelParen		transparent start="(" end=")" contains=ALLBUT,eiffelParenError,eiffelStringError,eiffelStringEscape

" Should suffice for even very long strings and expressions
syn sync lines=40

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_eiffel_syntax_inits")
  if version < 508
    let did_eiffel_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink eiffelKeyword		Statement
  HiLink eiffelProperty		Statement
  HiLink eiffelInheritClause	Statement
  HiLink eiffelStatement	Statement
  HiLink eiffelDeclaration	Statement
  HiLink eiffelAssertion	Statement
  HiLink eiffelDebug		Statement
  HiLink eiffelException	Statement


  HiLink eiffelTopStruct	PreProc

  HiLink eiffelAll		Special
  HiLink eiffelAnchored		Special
  HiLink eiffelBitType		Special


  HiLink eiffelBool		Boolean
  HiLink eiffelString		String
  HiLink eiffelCharacter	Character
  HiLink eiffelClassName	Type
  HiLink eiffelNumber		Number

  HiLink eiffelStringEscape	Special

  HiLink eiffelOperator		Special
  HiLink eiffelArray		Special
  HiLink eiffelExport		Special
  HiLink eiffelCreation		Special
  HiLink eiffelBrackets		Special
  HiLink eiffelGeneric		Special
  HiLink eiffelConstraint	Special

  HiLink eiffelPredefined	Constant

  HiLink eiffelComment		Comment

  HiLink eiffelError		Error
  HiLink eiffelBadConstant	Error
  HiLink eiffelStringError	Error
  HiLink eiffelParenError	Error
  HiLink eiffelBracketError	Error

  HiLink eiffelTodo		Todo

  delcommand HiLink
endif

let b:current_syntax = "eiffel"

" vim: ts=8
