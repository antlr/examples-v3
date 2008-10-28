/*
 [The "BSD licence"]
 Copyright (c) 2005-2007 Terence Parr
 Copyright (c) 2007-2008 Johannes Luber
 Copyright (c) 2008 Erik van Bilsen
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// ANTLR v3 grammar written in ANTLR v3 with AST construction 
grammar ANTLRv3;

options {
	language=Delphi;
	output=AST;
	ASTLabelType=CommonTree;
}

tokens {
	DOC_COMMENT;
	PARSER;	
    LEXER;
    RULE;
    BLOCK;
    OPTIONAL;
    CLOSURE;
    POSITIVE_CLOSURE;
    SYNPRED;
    RANGE;
    CHAR_RANGE;
    EPSILON;
    AALT;
    EOR;
    EOB;
    EOA; // end of alt
    ID;
    ARG;
    ARGLIST;
    RET;
    LEXER_GRAMMAR;
    PARSER_GRAMMAR;
    TREE_GRAMMAR;
    COMBINED_GRAMMAR;
    INITACTION;
    LBL; // $x used in rewrite rules
    TEMPLATE;
    SCOPE='scope';
    SEMPRED;
    GATED_SEMPRED; // {p}? =>
    SYN_SEMPRED; // (...) =>   it's a manually-specified synpred converted to sempred
    BACKTRACK_SEMPRED; // auto backtracking mode syn pred converted to sempred
    FRAGMENT='fragment';
    TREE_BEGIN='^(';
    AROOT='^';
    BANG='!';
    RANGE='..';
    REWRITE='->';
}

@memberDeclarations {
gtype: Integer;
}

grammarDef
    :   DOC_COMMENT?
    	(	'lexer'  {gtype:=LEXER_GRAMMAR;}    // pure lexer
    	|   'parser' {gtype:=PARSER_GRAMMAR;}   // pure parser
    	|   'tree'   {gtype:=TREE_GRAMMAR;}     // a tree parser
    	|		     {gtype:=COMBINED_GRAMMAR;} // merged parser/lexer
    	)
    	g='grammar' aid ';' optionsSpec? tokensSpec? attrScope* action*
    	arule+
    	EOF
    	-> ^( {Adaptor.CreateNode(gtype,$g)}
    		  aid DOC_COMMENT? optionsSpec? tokensSpec? attrScope* action* arule+
    		)
    ;

tokensSpec
	:	ATOKENS tokenSpec+ '}' -> ^(ATOKENS tokenSpec+)
	;

tokenSpec
	:	TOKEN_REF
		(	'=' (lit=STRING_LITERAL|lit=CHAR_LITERAL)	-> ^('=' TOKEN_REF $lit)
		|												-> TOKEN_REF
		)
		';'
	;

attrScope
	:	'scope' aid AACTION -> ^('scope' aid AACTION)
	;

/** Match stuff like @parser::members {int i;} */
action
	:	'@' (actionScopeName '::')? aid AACTION -> ^('@' actionScopeName? aid AACTION)
	;

/** Sometimes the scope names will collide with keywords; allow them as
 *  ids for action scopes.
 */
actionScopeName
	:	aid
	|	l='lexer'	-> ID[$l]
    |   p='parser'	-> ID[$p]
	;

optionsSpec
	:	OPTIONS (option ';')+ '}' -> ^(OPTIONS option+)
	;

option
    :   aid '=' optionValue -> ^('=' aid optionValue)
 	;
 	
optionValue
    :   aid
    |   STRING_LITERAL
    |   CHAR_LITERAL
    |   INT
    |	s='*' -> STRING_LITERAL[$s]  // used for k=*
    ;

arule
scope {
	string name;
}
	:	DOC_COMMENT?
		( modifier=('protected'|'public'|'private'|'fragment') )?
		aid {$arule::name = $aid.text;}
		'!'?
		( aarg=ARG_ACTION )?
		( 'returns' rt=ARG_ACTION  )?
		throwsSpec? optionsSpec? ruleScopeSpec? ruleAction*
		':'	altList	';'
		exceptionGroup?
	    -> ^( RULE aid {IfThen(Assigned(modifier),Adaptor.CreateNode(modifier),nil) } ^(ARG $aarg)? ^(RET $rt)?
	    	  throwsSpec? optionsSpec? ruleScopeSpec? ruleAction*
	    	  altList
	    	  exceptionGroup?
	    	  EOR['EOR']
	    	)
	;

/** Match stuff like @init {int i;} */
ruleAction
	:	'@' aid AACTION -> ^('@' aid AACTION)
	;

throwsSpec
	:	'throws' aid ( ',' aid )* -> ^('throws' aid+)
	;

ruleScopeSpec
	:	'scope' AACTION -> ^('scope' AACTION)
	|	'scope' aid (',' aid)* ';' -> ^('scope' aid+)
	|	'scope' AACTION
		'scope' aid (',' aid)* ';'
		-> ^('scope' AACTION aid+ )
	;

ablock
    :   lp='('
		( (opts=optionsSpec)? ':' )?
		altpair ( '|' altpair )*
        rp=')'
        -> ^( BLOCK[$lp,'BLOCK'] optionsSpec? altpair+ EOB[$rp,'EOB'] )
    ;

altpair : alternative arewrite ;

altList
@vars{
blkRoot: ICommonTree;
}
@init {
	// must create root manually as it's used by invoked rules in real antlr tool.
	// leave here to demonstrate use of {...} in rewrite rule
	// it's really BLOCK[firstToken,"BLOCK"]; set line/col to previous ( or : token.
    blkRoot := Adaptor.CreateNode(BLOCK,input.LT(-1),'BLOCK') as ICommonTree;
}
    :   altpair ( '|' altpair )* -> ^( {blkRoot} altpair+ EOB['EOB'] )
    ;

alternative
@vars {
firstToken, prevToken: IToken;
}
@init {
	firstToken := Input.LT(1);
	prevToken := Input.LT(-1); // either : or | I think
}
    :   element+ -> ^(AALT[firstToken,'ALT'] element+ EOA['EOA'])
    |   -> ^(AALT[prevToken,'ALT'] EPSILON[prevToken,'EPSILON'] EOA['EOA'])
    ;

exceptionGroup
	:	( exceptionHandler )+ ( finallyClause )?
	|	finallyClause
    ;

exceptionHandler
    :    'catch' ARG_ACTION AACTION -> ^('catch' ARG_ACTION AACTION)
    ;

finallyClause
    :    'finally' AACTION -> ^('finally' AACTION)
    ;

element
	:	elementNoOptionSpec
	;

elementNoOptionSpec
	:	aid (labelOp='='|labelOp='+=') atom
		(	ebnfSuffix	-> ^( ebnfSuffix ^(BLOCK['BLOCK'] ^(AALT['ALT'] ^($labelOp aid atom) EOA['EOA']) EOB['EOB']))
		|				-> ^($labelOp aid atom)
		)
	|	aid (labelOp='='|labelOp='+=') ablock
		(	ebnfSuffix	-> ^( ebnfSuffix ^(BLOCK['BLOCK'] ^(AALT['ALT'] ^($labelOp aid ablock) EOA['EOA']) EOB['EOB']))
		|				-> ^($labelOp aid ablock)
		)
	|	atom
		(	ebnfSuffix	-> ^( ebnfSuffix ^(BLOCK['BLOCK'] ^(AALT['ALT'] atom EOA['EOA']) EOB['EOB']) )
		|				-> atom
		)
	|	ebnf
	|   AACTION
	|   SEMPRED ( '=>' -> GATED_SEMPRED | -> SEMPRED )
	|   treeSpec
		(	ebnfSuffix	-> ^( ebnfSuffix ^(BLOCK['BLOCK'] ^(AALT['ALT'] treeSpec EOA['EOA']) EOB['EOB']) )
		|				-> treeSpec
		)
	;

atom:   arange ( (op='^'|op='!') -> ^($op arange) | -> arange )
    |   terminal
    |	notSet ( (op='^'|op='!') -> ^($op notSet) | -> notSet )
    |   RULE_REF ( arg=ARG_ACTION )? ( (op='^'|op='!') )?
    	-> {Assigned($arg) and Assigned($op)}?	^($op RULE_REF $arg)
    	-> {Assigned($arg)}?			^(RULE_REF $arg)
    	-> {Assigned($op)}?				^($op RULE_REF)
    	-> RULE_REF
    ;

notSet
	:	'~'
		(	notTerminal	-> ^('~' notTerminal)
		|	ablock		-> ^('~' ablock)
		)
	;

treeSpec
	:	'^(' element ( element )+ ')' -> ^(TREE_BEGIN element+)
	;

/** Matches ENBF blocks (and token sets via block rule) */
ebnf
@vars{
FirstToken: IToken;
}
@init {
    FirstToken := Input.LT(1);
}
@after {
	$ebnf.tree.Token.Line := FirstToken.Line;
	$ebnf.tree.Token.CharPositionInLine := FirstToken.CharPositionInLine;
}
	:	ablock
		(	op='?'	-> ^(OPTIONAL[op] ablock)
		|	op='*'	-> ^(CLOSURE[op] ablock)
		|	op='+'	-> ^(POSITIVE_CLOSURE[op] ablock)
		|   '=>'	// syntactic predicate
					-> {(gtype=COMBINED_GRAMMAR) and
					    IsUpper($arule::name[1])}?
					   // if lexer rule in combined, leave as pred for lexer
					   ^(SYNPRED['=>'] ablock)
					// in real antlr tool, text for SYN_SEMPRED is predname
					-> SYN_SEMPRED
        |			-> ablock
		)
	;

arange!
	:	c1=CHAR_LITERAL RANGE c2=CHAR_LITERAL -> ^(CHAR_RANGE[$c1,'..'] $c1 $c2)
	;

terminal
    :   (	CHAR_LITERAL				-> CHAR_LITERAL
    		// Args are only valid for lexer rules
		|   TOKEN_REF
			( ARG_ACTION				-> ^(TOKEN_REF ARG_ACTION)
			|							-> TOKEN_REF
			)
		|   STRING_LITERAL				-> STRING_LITERAL
		|   '.'							-> '.'
		)	
		(	'^'							-> ^('^' $terminal)
		|	'!' 						-> ^('!' $terminal)
		)?
	;

notTerminal
	:   CHAR_LITERAL
	|	TOKEN_REF
	|	STRING_LITERAL
	;
	
ebnfSuffix
@vars {
op: IToken;
}
@init {
	op := Input.LT(1);
}
	:	'?'	-> OPTIONAL[op]
  	|	'*' -> CLOSURE[op]
   	|	'+' -> POSITIVE_CLOSURE[op]
	;
	


// R E W R I T E  S Y N T A X

arewrite
@vars {
firstToken: IToken;
}
@init {
	firstToken := input.LT(1);
}
	:	(rew+='->' preds+=SEMPRED predicated+=rewrite_alternative)*
		rew2='->' last=rewrite_alternative
        -> ^($rew $preds $predicated)* ^($rew2 $last)
	|
	;

rewrite_alternative
options {backtrack=true;}
	:	rewrite_template
	|	rewrite_tree_alternative
   	|   /* empty rewrite */ -> ^(AALT['ALT'] EPSILON['EPSILON'] EOA['EOA'])
	;

rewrite_tree_block
    :   lp='(' rewrite_tree_alternative ')'
    	-> ^(BLOCK[$lp,'BLOCK'] rewrite_tree_alternative EOB[$lp,'EOB'])
    ;

rewrite_tree_alternative
    :	rewrite_tree_element+ -> ^(AALT['ALT'] rewrite_tree_element+ EOA['EOA'])
    ;

rewrite_tree_element
	:	rewrite_tree_atom
	|	rewrite_tree_atom ebnfSuffix
		-> ^( ebnfSuffix ^(BLOCK['BLOCK'] ^(AALT['ALT'] rewrite_tree_atom EOA['EOA']) EOB['EOB']))
	|   rewrite_tree
		(	ebnfSuffix
			-> ^(ebnfSuffix ^(BLOCK['BLOCK'] ^(AALT['ALT'] rewrite_tree EOA['EOA']) EOB['EOB']))
		|	-> rewrite_tree
		)
	|   rewrite_tree_ebnf
	;

rewrite_tree_atom
    :   CHAR_LITERAL
	|   TOKEN_REF ARG_ACTION? -> ^(TOKEN_REF ARG_ACTION?) // for imaginary nodes
    |   RULE_REF
	|   STRING_LITERAL
	|   d='$' aid -> LBL[$d,$aid.text] // reference to a label in a rewrite rule
	|	AACTION
	;

rewrite_tree_ebnf
@vars {
firstToken: IToken;
}
@init {
    firstToken := Input.LT(1);
}
@after {
	$rewrite_tree_ebnf.tree.Token.Line := firstToken.Line;
	$rewrite_tree_ebnf.tree.Token.CharPositionInLine := firstToken.CharPositionInLine;
}
	:	rewrite_tree_block ebnfSuffix -> ^(ebnfSuffix rewrite_tree_block)
	;
	
rewrite_tree
	:	'^(' rewrite_tree_atom rewrite_tree_element* ')'
		-> ^(TREE_BEGIN rewrite_tree_atom rewrite_tree_element* )
	;

/** Build a tree for a template rewrite:
      ^(TEMPLATE (ID|ACTION) ^(ARGLIST ^(ARG ID ACTION) ...) )
    where ARGLIST is always there even if no args exist.
    ID can be "template" keyword.  If first child is ACTION then it's
    an indirect template ref

    -> foo(a={...}, b={...})
    -> ({string-e})(a={...}, b={...})  // e evaluates to template name
    -> {%{$ID.text}} // create literal template from string (done in ActionTranslator)
	-> {st-expr} // st-expr evaluates to ST
 */
rewrite_template
	:   // -> template(a={...},...) "..."    inline template
		aid lp='(' rewrite_template_args	')'
		( str=DOUBLE_QUOTE_STRING_LITERAL | str=DOUBLE_ANGLE_STRING_LITERAL )
		-> ^(TEMPLATE[$lp,'TEMPLATE'] aid rewrite_template_args $str)

	|	// -> foo(a={...}, ...)
		rewrite_template_ref

	|	// -> ({expr})(a={...}, ...)
		rewrite_indirect_template_head

	|	// -> {...}
		AACTION
	;

/** -> foo(a={...}, ...) */
rewrite_template_ref
	:	aid lp='(' rewrite_template_args	')'
		-> ^(TEMPLATE[$lp,'TEMPLATE'] aid rewrite_template_args)
	;

/** -> ({expr})(a={...}, ...) */
rewrite_indirect_template_head
	:	lp='(' AACTION ')' '(' rewrite_template_args ')'
		-> ^(TEMPLATE[$lp,'TEMPLATE'] AACTION rewrite_template_args)
	;

rewrite_template_args
	:	rewrite_template_arg (',' rewrite_template_arg)*
		-> ^(ARGLIST rewrite_template_arg+)
	|	-> ARGLIST
	;

rewrite_template_arg
	:   aid '=' AACTION -> ^(ARG[$aid.start] aid AACTION)
	;

aid	:	TOKEN_REF -> ID[$TOKEN_REF]
	|	RULE_REF  -> ID[$RULE_REF]
	;

// L E X I C A L   R U L E S

SL_COMMENT
 	:	'//'
 	 	(	' $ANTLR ' SRC // src directive
 		|	~('\r'|'\n')*
		)
		'\r'? '\n'
		{$channel:=HIDDEN;}
	;

ML_COMMENT
	:	'/*' {if (Input.LAChar(1) = '*') then $type:=DOC_COMMENT else $channel:=HIDDEN;} .* '*/'
	;

CHAR_LITERAL
	:	'\'' LITERAL_CHAR '\''
	;

STRING_LITERAL
	:	'\'' LITERAL_CHAR LITERAL_CHAR* '\''
	;

fragment
LITERAL_CHAR
	:	ESC
	|	~('\''|'\\')
	;

DOUBLE_QUOTE_STRING_LITERAL
	:	'"' (ESC | ~('\\'|'"'))* '"'
	;

DOUBLE_ANGLE_STRING_LITERAL
	:	'<<' .* '>>'
	;

fragment
ESC	:	'\\'
		(	'n'
		|	'r'
		|	't'
		|	'b'
		|	'f'
		|	'"'
		|	'\''
		|	'\\'
		|	'>'
		|	'u' XDIGIT XDIGIT XDIGIT XDIGIT
		|	. // unknown, leave as it is
		)
	;

fragment
XDIGIT :
		'0' .. '9'
	|	'a' .. 'f'
	|	'A' .. 'F'
	;

INT	:	'0'..'9'+
	;

ARG_ACTION
	:	NESTED_ARG_ACTION
	;

fragment
NESTED_ARG_ACTION :
	'['
	(	options {greedy=false; k=1;}
	:	NESTED_ARG_ACTION
	|	ACTION_STRING_LITERAL
	|	ACTION_CHAR_LITERAL
	|	.
	)*
	']'
	{Text := Copy(Text,2,Length(Text)-1);}
	;

AACTION
	:	NESTED_ACTION ( '?' {$type := SEMPRED;} )?
	;

fragment
NESTED_ACTION :
	'{'
	(	options {greedy=false; k=2;}
	:	NESTED_ACTION
	|	SL_COMMENT
	|	ML_COMMENT
	|	ACTION_STRING_LITERAL
	|	ACTION_CHAR_LITERAL
	|	.
	)*
	'}'
   ;

fragment
ACTION_CHAR_LITERAL
	:	'\'' (ACTION_ESC|~('\\'|'\'')) '\''
	;

fragment
ACTION_STRING_LITERAL
	:	'"' (ACTION_ESC|~('\\'|'"'))* '"'
	;

fragment
ACTION_ESC
	:	'\\\''
	|	'\\' '"' // ANTLR doesn't like: '\\"'
	|	'\\' ~('\''|'"')
	;

TOKEN_REF
	:	'A'..'Z' ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*
	;

RULE_REF
	:	'a'..'z' ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*
	;

/** Match the start of an options section.  Don't allow normal
 *  action processing on the {...} as it's not a action.
 */
OPTIONS
	:	'options' WS_LOOP '{'
	;
	
ATOKENS
	:	'tokens' WS_LOOP '{'
	;

/** Reset the file and line information; useful when the grammar
 *  has been generated so that errors are shown relative to the
 *  original file like the old C preprocessor used to do.
 */
fragment
SRC	:	'src' ' ' fileinfo=ACTION_STRING_LITERAL ' ' line=INT
	;

WS	:	(	' '
		|	'\t'
		|	'\r'? '\n'
		)+
		{$channel:=HIDDEN;}
	;

fragment
WS_LOOP
	:	(	WS
		|	SL_COMMENT
		|	ML_COMMENT
		)*
	;

