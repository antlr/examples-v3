parser grammar JavaExpr;

public
parExpression
    :   '(' expression ')'
    ;
    
public
expressionList
    :   expression (',' expression)*
    ;

public
statementExpression
    :   expression
    ;
    
public
constantExpression
    :   expression
    ;
    
public
expression
    :   conditionalExpression (assignmentOperator expression)?
    ;
    
public
assignmentOperator
    :   '='
    |   '+='
    |   '-='
    |   '*='
    |   '/='
    |   '&='
    |   '|='
    |   '^='
    |   '%='
    |   ('<' '<' '=')=> t1='<' t2='<' t3='=' 
        { $t1.Line == $t2.Line &&
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine && 
          $t2.Line == $t3.Line && 
          $t2.CharPositionInLine + 1 == $t3.CharPositionInLine }?
    |   ('>' '>' '>' '=')=> t1='>' t2='>' t3='>' t4='='
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine &&
          $t2.Line == $t3.Line && 
          $t2.CharPositionInLine + 1 == $t3.CharPositionInLine &&
          $t3.Line == $t4.Line && 
          $t3.CharPositionInLine + 1 == $t4.CharPositionInLine }?
    |   ('>' '>' '=')=> t1='>' t2='>' t3='='
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine && 
          $t2.Line == $t3.Line && 
          $t2.CharPositionInLine + 1 == $t3.CharPositionInLine }?
    ;

public
conditionalExpression
    :   conditionalOrExpression ( '?' expression ':' expression )?
    ;

public
conditionalOrExpression
    :   conditionalAndExpression ( '||' conditionalAndExpression )*
    ;

public
conditionalAndExpression
    :   inclusiveOrExpression ( '&&' inclusiveOrExpression )*
    ;

public
inclusiveOrExpression
    :   exclusiveOrExpression ( '|' exclusiveOrExpression )*
    ;

public
exclusiveOrExpression
    :   andExpression ( '^' andExpression )*
    ;

public
andExpression
    :   equalityExpression ( '&' equalityExpression )*
    ;

public
equalityExpression
    :   instanceOfExpression ( ('==' | '!=') instanceOfExpression )*
    ;

public
instanceOfExpression
    :   relationalExpression ('instanceof' type)?
    ;

public
relationalExpression
    :   shiftExpression ( relationalOp shiftExpression )*
    ;
    
public
relationalOp
    :   ('<' '=')=> t1='<' t2='=' 
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine }?
    |   ('>' '=')=> t1='>' t2='=' 
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine }?
    |   '<' 
    |   '>' 
    ;

public
shiftExpression
    :   additiveExpression ( shiftOp additiveExpression )*
    ;

public
shiftOp
    :   ('<' '<')=> t1='<' t2='<' 
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine }?
    |   ('>' '>' '>')=> t1='>' t2='>' t3='>' 
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine &&
          $t2.Line == $t3.Line && 
          $t2.CharPositionInLine + 1 == $t3.CharPositionInLine }?
    |   ('>' '>')=> t1='>' t2='>'
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine }?
    ;

public
additiveExpression
    :   multiplicativeExpression ( ('+' | '-') multiplicativeExpression )*
    ;

public
multiplicativeExpression
    :   unaryExpression ( ( '*' | '/' | '%' ) unaryExpression )*
    ;
    
public
unaryExpression
    :   '+' unaryExpression
    |   '-' unaryExpression
    |   '++' unaryExpression
    |   '--' unaryExpression
    |   unaryExpressionNotPlusMinus
    ;

public
unaryExpressionNotPlusMinus
    :   '~' unaryExpression
    |   '!' unaryExpression
    |   castExpression
    |   primary selector* ('++'|'--')?
    ;

public
castExpression
    :  '(' primitiveType ')' unaryExpression
    |  '(' (type | expression) ')' unaryExpressionNotPlusMinus
    ;

public
primary
    :   parExpression
    |   'this' ('.' Identifier)* identifierSuffix?
    |   'super' superSuffix
    |   literal
    |   'new' creator
    |   Identifier ('.' Identifier)* identifierSuffix?
    |   primitiveType ('[' ']')* '.' 'class'
    |   'void' '.' 'class'
    ;

public
identifierSuffix
    :   ('[' ']')+ '.' 'class'
    |   ('[' expression ']')+ // can also be matched by selector, but do here
    |   arguments
    |   '.' 'class'
    |   '.' explicitGenericInvocation
    |   '.' 'this'
    |   '.' 'super' arguments
    |   '.' 'new' innerCreator
    ;

public
creator
    :   nonWildcardTypeArguments createdName classCreatorRest
    |   createdName (arrayCreatorRest | classCreatorRest)
    ;

public
createdName
    :   classOrInterfaceType
    |   primitiveType
    ;
    
public
innerCreator
    :   nonWildcardTypeArguments? Identifier classCreatorRest
    ;

public
arrayCreatorRest
    :   '['
        (   ']' ('[' ']')* arrayInitializer
        |   expression ']' ('[' expression ']')* ('[' ']')*
        )
    ;

public
classCreatorRest
    :   arguments classBody?
    ;
    
public
explicitGenericInvocation
    :   nonWildcardTypeArguments Identifier arguments
    ;
    
public
nonWildcardTypeArguments
    :   '<' typeList '>'
    ;
    
public
selector
    :   '.' Identifier arguments?
    |   '.' 'this'
    |   '.' 'super' superSuffix
    |   '.' 'new' innerCreator
    |   '[' expression ']'
    ;
    
public
superSuffix
    :   arguments
    |   '.' Identifier arguments?
    ;

public
arguments
    :   '(' expressionList? ')'
    ;
    
public
literal 
    :   integerLiteral
    |   FloatingPointLiteral
    |   CharacterLiteral
    |   StringLiteral
    |   booleanLiteral
    |   'null'
    ;

public
integerLiteral
    :   HexLiteral
    |   OctalLiteral
    |   DecimalLiteral
    ;

public
booleanLiteral
    :   'true'
    |   'false'
    ;
