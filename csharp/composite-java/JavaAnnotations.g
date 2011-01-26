parser grammar JavaAnnotations;

// ANNOTATIONS

public
annotations
    :   annotation+
    ;

public
annotation
    :   '@' annotationName ( '(' ( elementValuePairs | elementValue )? ')' )?
    ;
    
public
annotationName
    : Identifier ('.' Identifier)*
    ;

public
elementValuePairs
    :   elementValuePair (',' elementValuePair)*
    ;

public
elementValuePair
    :   Identifier '=' elementValue
    ;
    
public
elementValue
    :   conditionalExpression
    |   annotation
    |   elementValueArrayInitializer
    ;
    
public
elementValueArrayInitializer
    :   '{' (elementValue (',' elementValue)*)? (',')? '}'
    ;
    
public
annotationTypeDeclaration
    :   '@' 'interface' Identifier annotationTypeBody
    ;
    
public
annotationTypeBody
    :   '{' (annotationTypeElementDeclaration)* '}'
    ;
    
public
annotationTypeElementDeclaration
    :   modifiers annotationTypeElementRest
    ;
    
public
annotationTypeElementRest
    :   type annotationMethodOrConstantRest ';'
    |   normalClassDeclaration ';'?
    |   normalInterfaceDeclaration ';'?
    |   enumDeclaration ';'?
    |   annotationTypeDeclaration ';'?
    ;
    
public
annotationMethodOrConstantRest
    :   annotationMethodRest
    |   annotationConstantRest
    ;
    
public
annotationMethodRest
    :   Identifier '(' ')' defaultValue?
    ;
    
public
annotationConstantRest
    :   variableDeclarators
    ;
    
public
defaultValue
    :   'default' elementValue
    ;
