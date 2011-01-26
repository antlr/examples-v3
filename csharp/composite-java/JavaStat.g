parser grammar JavaStat;

public
block
    :   '{' blockStatement* '}'
    ;
    
public
blockStatement
    :   localVariableDeclarationStatement
    |   classOrInterfaceDeclaration
    |   statement
    ;
    
public
localVariableDeclarationStatement
    :    localVariableDeclaration ';'
    ;

public
localVariableDeclaration
    :   variableModifiers type variableDeclarators
    ;
    
public
variableModifiers
    :   variableModifier*
    ;

public
statement
    : block
    |   ASSERT expression (':' expression)? ';'
    |   'if' parExpression statement (options {k=1;}:'else' statement)?
    |   'for' '(' forControl ')' statement
    |   'while' parExpression statement
    |   'do' statement 'while' parExpression ';'
    |   'try' block
        ( catches 'finally' block
        | catches
        |   'finally' block
        )
    |   'switch' parExpression '{' switchBlockStatementGroups '}'
    |   'synchronized' parExpression block
    |   'return' expression? ';'
    |   'throw' expression ';'
    |   'break' Identifier? ';'
    |   'continue' Identifier? ';'
    |   ';' 
    |   statementExpression ';'
    |   Identifier ':' statement
    ;
    
public
catches
    :   catchClause (catchClause)*
    ;
    
public
catchClause
    :   'catch' '(' formalParameter ')' block
    ;

public
formalParameter
    :   variableModifiers type variableDeclaratorId
    ;
        
public
switchBlockStatementGroups
    :   (switchBlockStatementGroup)*
    ;
    
/* The change here (switchLabel -> switchLabel+) technically makes this grammar
   ambiguous; but with appropriately greedy parsing it yields the most
   appropriate AST, one in which each group, except possibly the last one, has
   labels and statements. */
public
switchBlockStatementGroup
    :   switchLabel+ blockStatement*
    ;
    
public
switchLabel
    :   'case' constantExpression ':'
    |   'case' enumConstantName ':'
    |   'default' ':'
    ;
    
public
forControl
options {k=3;} // be efficient for common case: for (ID ID : ID) ...
    :   enhancedForControl
    |   forInit? ';' expression? ';' forUpdate?
    ;

public
forInit
    :   localVariableDeclaration
    |   expressionList
    ;
    
public
enhancedForControl
    :   variableModifiers type Identifier ':' expression
    ;

public
forUpdate
    :   expressionList
    ;

