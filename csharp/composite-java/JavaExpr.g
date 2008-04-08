parser grammar JavaExpr;

parExpression
    :   '(' expression ')'
    ;
    
expressionList
    :   expression (',' expression)*
    ;

statementExpression
    :   expression
    ;
    
constantExpression
    :   expression
    ;
    
expression
    :   conditionalExpression (assignmentOperator expression)?
    ;
    
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
    :   ('<' '=')=> t1='<' t2='=' 
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine }?
    |   ('>' '=')=> t1='>' t2='=' 
        { $t1.Line == $t2.Line && 
          $t1.CharPositionInLine + 1 == $t2.CharPositionInLine }?
    |   '<' 
    |   '>' 
    ;

shiftExpression
    :   additiveExpression ( shiftOp additiveExpression )*
    ;

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


additiveExpression
    :   multiplicativeExpression ( ('+' | '-') multiplicativeExpression )*
    ;

multiplicativeExpression
    :   unaryExpression ( ( '*' | '/' | '%' ) unaryExpression )*
    ;
    
unaryExpression
    :   '+' unaryExpression
    |   '-' unaryExpression
    |   '++' unaryExpression
    |   '--' unaryExpression
    |   unaryExpressionNotPlusMinus
    ;

unaryExpressionNotPlusMinus
    :   '~' unaryExpression
    |   '!' unaryExpression
    |   castExpression
    |   primary selector* ('++'|'--')?
    ;

castExpression
    :  '(' primitiveType ')' unaryExpression
    |  '(' (type | expression) ')' unaryExpressionNotPlusMinus
    ;

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

creator
    :   nonWildcardTypeArguments createdName classCreatorRest
    |   createdName (arrayCreatorRest | classCreatorRest)
    ;

createdName
    :   classOrInterfaceType
    |   primitiveType
    ;
    
innerCreator
    :   nonWildcardTypeArguments? Identifier classCreatorRest
    ;

arrayCreatorRest
    :   '['
        (   ']' ('[' ']')* arrayInitializer
        |   expression ']' ('[' expression ']')* ('[' ']')*
        )
    ;

classCreatorRest
    :   arguments classBody?
    ;
    
explicitGenericInvocation
    :   nonWildcardTypeArguments Identifier arguments
    ;
    
nonWildcardTypeArguments
    :   '<' typeList '>'
    ;
    
selector
    :   '.' Identifier arguments?
    |   '.' 'this'
    |   '.' 'super' superSuffix
    |   '.' 'new' innerCreator
    |   '[' expression ']'
    ;
    
superSuffix
    :   arguments
    |   '.' Identifier arguments?
    ;

arguments
    :   '(' expressionList? ')'
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

