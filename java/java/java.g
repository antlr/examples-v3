grammar JavaParser;
options {k=2; backtrack=true; memoize=true;}

@lexer::members {
protected boolean enumIsKeyword = false;
}

// starting point for parsing a java file
compilationUnit
	:	annotations?
		packageDeclaration?
        importDeclaration*
        typeDeclaration*
	;

packageDeclaration
	:	'package' qualifiedName ';'
	;
	
importDeclaration
	:	'import' 'static'? Identifier ('.' Identifier)* ('.' '*')? ';'
	;
	
typeDeclaration
	:	classOrInterfaceDeclaration
    |   ';'
	;
	
classOrInterfaceDeclaration
	:	modifier* (classDeclaration | interfaceDeclaration)
	;
	
classDeclaration
	:	normalClassDeclaration
    |   enumDeclaration
	;
	
normalClassDeclaration
	:	'class' Identifier (typeParameters)?
        ('extends' type)?
        ('implements' typeList)?
        classBody
	;
	
typeParameters
	:	'<' typeParameter (',' typeParameter)* '>'
	;

typeParameter
	:	Identifier ('extends' bound)?
	;
		
bound
	:	type ('&' type)*
	;

enumDeclaration
	:	ENUM Identifier ('implements' typeList)? enumBody
	;
	
enumBody
	:	'{' enumConstants? ','? enumBodyDeclarations? '}'
	;

enumConstants
	:	enumConstant (',' enumConstant)*
	;
	
enumConstant
	:	annotations? Identifier (arguments)? (classBody)?
	;
	
enumBodyDeclarations
	:	';' (classBodyDeclaration)*
	;
	
interfaceDeclaration
	:	normalInterfaceDeclaration
		| annotationTypeDeclaration
	;
	
normalInterfaceDeclaration
	:	'interface' Identifier typeParameter? ('extends' typeList)? interfaceBody
	;
	
typeList
	:	type (',' type)*
	;
	
classBody
	:	'{' classBodyDeclaration* '}'
	;
	
interfaceBody
	:	'{' interfaceBodyDeclaration* '}'
	;

classBodyDeclaration
	:	';'
	|	'static'? block
	|	modifier* memberDecl
	;
	
memberDecl
	:	genericMethodOrConstructorDecl
	|	methodDeclaration
	|	fieldDeclaration
	|	'void' Identifier voidMethodDeclaratorRest
	|	Identifier constructorDeclaratorRest
	|	interfaceDeclaration
	|	classDeclaration
	;
	
genericMethodOrConstructorDecl
	:	typeParameters genericMethodOrConstructorRest
	;
	
genericMethodOrConstructorRest
	:	(type | 'void') Identifier methodDeclaratorRest
	|	Identifier constructorDeclaratorRest
	;

methodDeclaration
	:	type Identifier methodDeclaratorRest
	;

fieldDeclaration
	:	type variableDeclarators ';'
	;
		
interfaceBodyDeclaration
	:	modifier* interfaceMemberDecl
	|   ';'
	;

interfaceMemberDecl
	:	interfaceMethodOrFieldDecl
	|   interfaceGenericMethodDecl
    |   'void' Identifier voidInterfaceMethodDeclaratorRest
    |   interfaceDeclaration
    |   classDeclaration
	;
	
interfaceMethodOrFieldDecl
	:	type Identifier interfaceMethodOrFieldRest
	;
	
interfaceMethodOrFieldRest
	:	constantDeclaratorsRest ';'
	|	interfaceMethodDeclaratorRest
	;
	
methodDeclaratorRest
	:	formalParameters ('[' ']')*
        ('throws' qualifiedNameList)?
        (   methodBody
        |   ';'
        )
	;
	
voidMethodDeclaratorRest
	:	formalParameters ('throws' qualifiedNameList)?
        (   methodBody
        |   ';'
        )
	;
	
interfaceMethodDeclaratorRest
	:	formalParameters ('[' ']')* ('throws' qualifiedNameList)? ';'
	;
	
interfaceGenericMethodDecl
	:	typeParameters (type | 'void') Identifier
        interfaceMethodDeclaratorRest
	;
	
voidInterfaceMethodDeclaratorRest
	:	formalParameters ('throws' qualifiedNameList)? ';'
	;
	
constructorDeclaratorRest
	:	formalParameters ('throws' qualifiedNameList)? methodBody
	;

constantDeclarator
	:	Identifier constantDeclaratorRest
	;
	
variableDeclarators
	:	variableDeclarator (',' variableDeclarator)*
	;

variableDeclarator
	:	Identifier variableDeclaratorRest
	;
	
variableDeclaratorRest
	:	('[' ']')+ ('=' variableInitializer)?
	|	'=' variableInitializer
	|
	;
	
constantDeclaratorsRest
    :   constantDeclaratorRest (',' constantDeclarator)*
    ;

constantDeclaratorRest
	:	('[' ']')* '=' variableInitializer
	;
	
variableDeclaratorId
	:	Identifier ('[' ']')*
	;

variableInitializer
	:	arrayInitializer
    |   expression
	;
	
arrayInitializer
	:	'{' (variableInitializer (',' variableInitializer)* (',')? )? '}'
	;

modifier
    :   annotation
    |   'public'
    |   'protected'
    |   'private'
    |   'static'
    |   'abstract'
    |   'final'
    |   'native'
    |   'synchronized'
    |   'transient'
    |   'volatile'
    |   'strictfp'
    ;

packageOrTypeName
	:	Identifier ('.' Identifier)*
	;

enumConstantName
    :   Identifier
    ;

typeName
	:   Identifier
    |   packageOrTypeName '.' Identifier
	;

type
	:	Identifier (typeArguments)? ('.' Identifier (typeArguments)? )* ('[' ']')*
	|	primitiveType ('[' ']')*
	;

primitiveType
    :   'boolean'
    |	'char'
    |	'byte'
    |	'short'
    |	'int'
    |	'long'
    |	'float'
    |	'double'
    ;

variableModifier
	:	'final'
    |   annotation
	;

typeArguments
	:	'<' typeArgument (',' typeArgument)* '>'
	;
	
typeArgument
	:	type
	|	'?' (('extends' | 'super') type)?
	;
	
qualifiedNameList
	:	qualifiedName (',' qualifiedName)*
	;
	
formalParameters
	:	'(' formalParameterDecls? ')'
	;
	
formalParameterDecls
	:	'final'? annotations? type formalParameterDeclsRest?
	;
	
formalParameterDeclsRest
	:	variableDeclaratorId (',' formalParameterDecls)?
	|   '...' variableDeclaratorId
	;
	
methodBody
	:	block
	;

qualifiedName
	:	Identifier ('.' Identifier)*
	;
	
literal	
	:   integerLiteral
    |   FloatingPointLiteral
    |   CharacterLiteral
    |   StringLiteral
    |   booleanLiteral
    |   'null'
	;

integerLiteral
    :   HexLiteral
    |   OctalLiteral
    |   DecimalLiteral
    ;

booleanLiteral
    :   'true'
    |   'false'
    ;

// ANNOTATIONS

annotations
	:	annotation+
	;

annotation
	:	'@' typeName ('(' (Identifier '=')? elementValue ')')?
	;
	
elementValue
	:	conditionalExpression
	|   annotation
	|   elementValueArrayInitializer
	;
	
elementValueArrayInitializer
	:	'{' (elementValue)? (',')? '}'
	;
	
annotationTypeDeclaration
	:	'@' 'interface' Identifier annotationTypeBody
	;
	
annotationTypeBody
	:	'{' (annotationTypeElementDeclarations)? '}'
	;
	
annotationTypeElementDeclarations
	:	(annotationTypeElementDeclaration) (annotationTypeElementDeclaration)*
	;
	
annotationTypeElementDeclaration
	:	(modifier)* annotationTypeElementRest
	;
	
annotationTypeElementRest
	:	type Identifier annotationMethodOrConstantRest ';'
	|   classDeclaration
	|   interfaceDeclaration
	|   enumDeclaration
	|   annotationTypeDeclaration
	;
	
annotationMethodOrConstantRest
	:	annotationMethodRest
	|   annotationConstantRest
	;
	
annotationMethodRest
 	:	'(' ')' (defaultValue)?
 	;
 	
annotationConstantRest
 	:	variableDeclarators
 	;
 	
defaultValue
 	:	'default' elementValue
 	;

// STATEMENTS / BLOCKS

block
	:	'{' blockStatement* '}'
	;
	
blockStatement
	:	localVariableDeclaration
    |   classOrInterfaceDeclaration
    |   statement
	;
	
localVariableDeclaration
	:	('final')? type variableDeclarators ';'
	;
	
statement
	: block
    | 'assert' expression (':' expression)? ';'
    | 'if' parExpression statement ('else' statement)?
    | 'for' '(' forControl ')' statement
    | 'while' parExpression statement
    | 'do' statement 'while' parExpression ';'
    | 'try' block
      (	catches 'finally' block
      | catches
      | 'finally' block
      )
    | 'switch' parExpression '{' switchBlockStatementGroups '}'
    | 'synchronized' parExpression block
    | 'return' expression? ';'
    | 'throw' expression ';'
    | 'break' Identifier? ';'
    | 'continue' Identifier? ';'
    | ';'
    | statementExpression ';'
    | Identifier ':' statement
	;
	
catches
	:	catchClause (catchClause)*
	;
	
catchClause
	:	'catch' '(' formalParameter ')' block
	;

formalParameter
	:	variableModifier* type variableDeclaratorId
	;
		
switchBlockStatementGroups
	:	(switchBlockStatementGroup)*
	;
	
switchBlockStatementGroup
	:	switchLabel blockStatement*
	;
	
switchLabel
	:	'case' constantExpression ':'
	|   'case' enumConstantName ':'
	|   'default' ':'
	;
	
moreStatementExpressions
	:	(',' statementExpression)*
	;

forControl
	:	forVarControl
	|   forInit? ';' expression? ';' forUpdate?
	;

forInit
	:	'final'? type variableDeclarators
    |   expressionList
	;
	
forVarControl
	:	'final'? (annotation)? type Identifier forVarControlRest
	;

forVarControlRest
	:	variableDeclaratorRest (',' variableDeclarator)* ';' expression? ':' forUpdate?
    |   ':' expression
	;

forUpdate
	:	expressionList
	;

// EXPRESSIONS

parExpression
	:	'(' expression ')'
	;
	
expressionList
    :   expression (',' expression)*
    ;

statementExpression
	:	expression
	;
	
constantExpression
	:	expression
	;
	
expression
	:	conditionalExpression (assignmentOperator expression)?
	;
	
assignmentOperator
	:	'='
    |   '+='
    |   '-='
    |   '*='
    |   '/='
    |   '&='
    |   '|='
    |   '^='
    |   '%='
    |   '<' '<' '='
    |   '>' '>' '='
    |   '>' '>' '>' '='
	;

conditionalExpression
    :   conditionalOrExpression ( '?' expression ':' expression )?
	;

conditionalOrExpression
    :   conditionalAndExpression ( '||' conditionalAndExpression )*
	;

conditionalAndExpression
    :   inclusiveOrExpression ( '&&' inclusiveOrExpression )*
	;

inclusiveOrExpression
    :   exclusiveOrExpression ( '|' exclusiveOrExpression )*
	;

exclusiveOrExpression
    :   andExpression ( '^' andExpression )*
	;

andExpression
    :   equalityExpression ( '&' equalityExpression )*
	;

equalityExpression
    :   instanceOfExpression ( ('==' | '!=') instanceOfExpression )*
	;

instanceOfExpression
    :   relationalExpression ('instanceof' type)?
	;

relationalExpression
    :   shiftExpression ( relationalOp shiftExpression )*
	;
	
relationalOp
	:	('<' '=' | '>' '=' | '<' | '>')
	;

shiftExpression
    :   additiveExpression ( shiftOp additiveExpression )*
	;

        // TODO: need a sem pred to check column on these >>>
shiftOp
	:	('<' '<' | '>' '>' '>' | '>' '>')
	;


additiveExpression
    :   multiplicativeExpression ( ('+' | '-') multiplicativeExpression )*
	;

multiplicativeExpression
    :   unaryExpression ( ( '*' | '/' | '%' ) unaryExpression )*
	;
	
unaryExpression
    :   '+' unaryExpression
    |	'-' unaryExpression
    |   '++' primary
    |   '--' primary
    |   unaryExpressionNotPlusMinus
    ;

unaryExpressionNotPlusMinus
    :   '~' unaryExpression
    | 	'!' unaryExpression
    |   castExpression
    |   primary selector* ('++'|'--')?
    ;

castExpression
    :  '(' primitiveType ')' unaryExpression
    |  '(' (expression | type) ')' unaryExpressionNotPlusMinus
    ;

primary
    :	parExpression
    |   nonWildcardTypeArguments
        (explicitGenericInvocationSuffix | 'this' arguments)
    |   'this' (arguments)?
    |   'super' superSuffix
    |   literal
    |   'new' creator
    |   Identifier ('.' Identifier)* (identifierSuffix)?
    |   primitiveType ('[' ']')* '.' 'class'
    |   'void' '.' 'class'
	;

identifierSuffix
	:	('[' ']')+ '.' 'class'
	|	('[' expression ']')+ // can also be matched by selector, but do here
    |   arguments
    |   '.' 'class'
    |   '.' explicitGenericInvocation
    |   '.' 'this'
    |   '.' 'super' arguments
    |   '.' 'new' (nonWildcardTypeArguments)? innerCreator
	;
	
creator
	:	nonWildcardTypeArguments? createdName
        (arrayCreatorRest | classCreatorRest)
	;

createdName
	:	Identifier nonWildcardTypeArguments?
        ('.' Identifier nonWildcardTypeArguments?)*
    |	primitiveType
	;
	
innerCreator
	:	Identifier classCreatorRest
	;

arrayCreatorRest
	:	'['
        (   ']' ('[' ']')* arrayInitializer
        |   expression ']' ('[' expression ']')* ('[' ']')*
        )
	;

classCreatorRest
	:	arguments classBody?
	;
	
explicitGenericInvocation
	:	nonWildcardTypeArguments explicitGenericInvocationSuffix
	;
	
nonWildcardTypeArguments
	:	'<' typeList '>'
	;
	
explicitGenericInvocationSuffix
	:	'super' superSuffix
	|   Identifier arguments
	;
	
selector
	:	'.' Identifier (arguments)?
	|   '.' 'this'
	|   '.' 'super' superSuffix
	|   '.' 'new' (nonWildcardTypeArguments)? innerCreator
	|   '[' expression ']'
	;
	
superSuffix
	:	arguments
	|   '.' Identifier (arguments)?
    ;

arguments
	:	'(' expressionList? ')'
	;

// LEXER

HexLiteral : '0' ('x'|'X') HexDigit+ IntegerTypeSuffix? ;

DecimalLiteral : ('0' | '1'..'9' '0'..'9'*) IntegerTypeSuffix? ;

OctalLiteral : '0' ('0'..'7')+ IntegerTypeSuffix? ;

fragment
HexDigit : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
IntegerTypeSuffix : ('l'|'L') ;

FloatingPointLiteral
    :   ('0'..'9')+ '.' ('0'..'9')* Exponent? FloatTypeSuffix?
    |   '.' ('0'..'9')+ Exponent? FloatTypeSuffix?
    |   ('0'..'9')+ Exponent FloatTypeSuffix?
    |   ('0'..'9')+ Exponent? FloatTypeSuffix
	;

fragment
Exponent : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
FloatTypeSuffix : ('f'|'F'|'d'|'D') ;

CharacterLiteral
    :   '\'' ( EscapeSequence | ~('\''|'\\') ) '\''
    ;

StringLiteral
    :  '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;

fragment
EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UnicodeEscape
    |   OctalEscape
    ;

fragment
OctalEscape
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UnicodeEscape
    :   '\\' 'u' HexDigit HexDigit HexDigit HexDigit
    ;

ENUM:	'enum' {if ( !enumIsKeyword ) type=Identifier;}
	;
	
Identifier 
    :   Letter (Letter|JavaIDDigit)*
    ;

fragment
Letter 
	:	'a'..'z'
	|	'A'..'Z'
	|	'_'
	|	'$'
	;

fragment
JavaIDDigit
	:	'0'..'9'
	;
		
/*
fragment
Letter
    :  '\u0024' |
       '\u0041'..'\u005a' |
       '\u005f' |
       '\u0061'..'\u007a' |
       '\u00c0'..'\u00d6' |
       '\u00d8'..'\u00f6' |
       '\u00f8'..'\u00ff' |
       '\u0100'..'\u1fff' |
       '\u3040'..'\u318f' |
       '\u3300'..'\u337f' |
       '\u3400'..'\u3d2d' |
       '\u4e00'..'\u9fff' |
       '\uf900'..'\ufaff'
    ;

fragment
JavaIDDigit
    :  '\u0030'..'\u0039' |
       '\u0660'..'\u0669' |
       '\u06f0'..'\u06f9' |
       '\u0966'..'\u096f' |
       '\u09e6'..'\u09ef' |
       '\u0a66'..'\u0a6f' |
       '\u0ae6'..'\u0aef' |
       '\u0b66'..'\u0b6f' |
       '\u0be7'..'\u0bef' |
       '\u0c66'..'\u0c6f' |
       '\u0ce6'..'\u0cef' |
       '\u0d66'..'\u0d6f' |
       '\u0e50'..'\u0e59' |
       '\u0ed0'..'\u0ed9' |
       '\u1040'..'\u1049'
   ;
*/

/*
Identifier :  
  {Character.isJavaIdentifierStart(input.LA(1))}? .
  ( {Character.isJavaIdentifierPart(input.LA(1))}? . )*
  ;
  */

WS  :  (' '|'\r'|'\t'|'\u000C'|'\n') {channel=99;}
    ;

COMMENT
    :   '/*' ( options {greedy=false;} : . )* '*/' {channel=99;}
    ;

LINE_COMMENT
    : '//' ~('\n'|'\r')* '\r'? '\n' {channel=99;}
    ;
