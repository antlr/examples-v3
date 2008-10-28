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

// ANTLR v3 tree grammar to walk trees created by ANTLRv3.g 
tree grammar ANTLRv3Tree;

options {
	language=Delphi;
	tokenVocab = ANTLRv3;
	ASTLabelType = CommonTree;
}

grammarDef
    :   ^( grammarType ID DOC_COMMENT? optionsSpec? tokensSpec? attrScope* action* arule+ )
    ;

grammarType
	:	LEXER_GRAMMAR
    |	PARSER_GRAMMAR
    |	TREE_GRAMMAR
    |	COMBINED_GRAMMAR
    ;

tokensSpec
	:	^(ATOKENS tokenSpec+)
	;

tokenSpec
	:	^('=' TOKEN_REF STRING_LITERAL)
	|	^('=' TOKEN_REF CHAR_LITERAL)
	|	TOKEN_REF
	;

attrScope
	:	^('scope' ID AACTION)
	;

action
	:	^('@' ID ID AACTION)
	|	^('@' ID AACTION)
	;

optionsSpec
	:	^(OPTIONS option+)
	;

option
    :   ^('=' ID optionValue)
 	;
 	
optionValue
    :   ID
    |   STRING_LITERAL
    |   CHAR_LITERAL
    |   INT
    ;

arule
	:	^( RULE ID modifier? (^(ARG ARG_ACTION))? (^(RET ARG_ACTION))?
	       throwsSpec? optionsSpec? ruleScopeSpec? ruleAction*
	       altList
	       exceptionGroup? EOR
	     )
	;

modifier
	:	'protected'|'public'|'private'|'fragment'
	;

/** Match stuff like @init {int i;} */
ruleAction
	:	^('@' ID AACTION)
	;

throwsSpec
	:	^('throws' ID+)
	;

ruleScopeSpec
	:	^('scope' AACTION)
	|	^('scope' AACTION ID+)
	|	^('scope' ID+)
	;

ablock
    :   ^( BLOCK optionsSpec? (alternative arewrite)+ EOB )
    ;

altList
    :   ^( BLOCK (alternative arewrite)+ EOB )
    ;

alternative
    :   ^(AALT element+ EOA)
    |   ^(AALT EPSILON EOA)
    ;

exceptionGroup
	:	exceptionHandler+ finallyClause?
	|	finallyClause
    ;

exceptionHandler
    :    ^('catch' ARG_ACTION AACTION)
    ;

finallyClause
    :    ^('finally' AACTION)
    ;

element
	:	elementNoOptionSpec
	;

elementNoOptionSpec
	:	^(('='|'+=') ID ablock)
	|	^(('='|'+=') ID atom)
	|	atom
	|	ebnf
	|   AACTION
	|   SEMPRED
	|	GATED_SEMPRED
	|   treeSpec
	;

atom:   ^(('^'|'!') atom)
	|	arange
	|	notSet
    |	^(RULE_REF ARG_ACTION)
    |	RULE_REF
    |   terminal
    ;

notSet
	:	^('~' notTerminal)
	|	^('~' ablock)
	;

treeSpec
	:	^(TREE_BEGIN element+)
	;

/** Matches ENBF blocks (and token sets via block rule) */
ebnf
	:	^(SYNPRED ablock)
	|	SYN_SEMPRED
	|	^(ebnfSuffix ablock)
	|	ablock
	;

arange
	:	^(CHAR_RANGE CHAR_LITERAL CHAR_LITERAL)
	;

terminal
    :   CHAR_LITERAL
    |	TOKEN_REF
    |	STRING_LITERAL
    |	^(TOKEN_REF ARG_ACTION)
    |	'.'
	;

notTerminal
	:   CHAR_LITERAL
	|	TOKEN_REF
	|	STRING_LITERAL
	;
	
ebnfSuffix
	:	OPTIONAL
  	|	CLOSURE
   	|	POSITIVE_CLOSURE
	;
	
// R E W R I T E  S Y N T A X

arewrite
	:	(^('->' SEMPRED rewrite_alternative))* ^('->' rewrite_alternative)
	|
	;

rewrite_alternative
	:	rewrite_template
	|	rewrite_tree_alternative
   	|   ^(AALT EPSILON EOA)
	;

rewrite_tree_block
    :   ^(BLOCK rewrite_tree_alternative EOB)
    ;

rewrite_tree_alternative
    :	^(AALT rewrite_tree_element+ EOA)
    ;

rewrite_tree_element
	:	rewrite_tree_atom
	|	rewrite_tree
	|   rewrite_tree_block
	|   rewrite_tree_ebnf
	;

rewrite_tree_atom
    :   CHAR_LITERAL
	|   TOKEN_REF
	|   ^(TOKEN_REF ARG_ACTION) // for imaginary nodes
    |   RULE_REF
	|   STRING_LITERAL
	|   LBL
	|	AACTION
	;

rewrite_tree_ebnf
	:	^(ebnfSuffix rewrite_tree_block)
	;
	
rewrite_tree
	:	^(TREE_BEGIN rewrite_tree_atom rewrite_tree_element* )
	;

rewrite_template
	:   ^( TEMPLATE ID rewrite_template_args
		   (DOUBLE_QUOTE_STRING_LITERAL | DOUBLE_ANGLE_STRING_LITERAL)
		 )
	|	rewrite_template_ref
	|	rewrite_indirect_template_head
	|	AACTION
	;

/** foo(a={...}, ...) */
rewrite_template_ref
	:	^(TEMPLATE ID rewrite_template_args)
	;

/** ({expr})(a={...}, ...) */
rewrite_indirect_template_head
	:	^(TEMPLATE AACTION rewrite_template_args)
	;

rewrite_template_args
	:	^(ARGLIST rewrite_template_arg+)
	|	ARGLIST
	;

rewrite_template_arg
	:   ^(ARG ID AACTION)
	;
