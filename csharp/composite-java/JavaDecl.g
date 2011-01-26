parser grammar JavaDecl;

public
packageDeclaration
    :   'package' qualifiedName ';'
    ;
    
public
importDeclaration
    :   'import' 'static'? qualifiedName ('.' '*')? ';'
    ;
    
public
typeDeclaration
    :   classOrInterfaceDeclaration
    |   ';'
    ;
    
public
classOrInterfaceDeclaration
    :   classOrInterfaceModifiers (classDeclaration | interfaceDeclaration)
    ;
    
public
classOrInterfaceModifiers
    :   classOrInterfaceModifier*
    ;

public
classOrInterfaceModifier
    :   annotation   // class or interface
    |   'public'     // class or interface
    |   'protected'  // class or interface
    |   'private'    // class or interface
    |   'abstract'   // class or interface
    |   'static'     // class or interface
    |   'final'      // class only -- does not apply to interfaces
    |   'strictfp'   // class or interface
    ;

public
modifiers
    :   modifier*
    ;

public
classDeclaration
    :   normalClassDeclaration
    |   enumDeclaration
    ;
    
public
normalClassDeclaration
    :   'class' Identifier typeParameters?
        ('extends' type)?
        ('implements' typeList)?
        classBody
    ;
    
public
typeParameters
    :   '<' typeParameter (',' typeParameter)* '>'
    ;

public
typeParameter
    :   Identifier ('extends' typeBound)?
    ;
        
public
typeBound
    :   type ('&' type)*
    ;

public
enumDeclaration
    :   ENUM Identifier ('implements' typeList)? enumBody
    ;

public
enumBody
    :   '{' enumConstants? ','? enumBodyDeclarations? '}'
    ;

public
enumConstants
    :   enumConstant (',' enumConstant)*
    ;
    
public
enumConstant
    :   annotations? Identifier arguments? classBody?
    ;
    
public
enumBodyDeclarations
    :   ';' (classBodyDeclaration)*
    ;
    
public
interfaceDeclaration
    :   normalInterfaceDeclaration
    |   annotationTypeDeclaration
    ;
    
public
normalInterfaceDeclaration
    :   'interface' Identifier typeParameters? ('extends' typeList)? interfaceBody
    ;
    
public
typeList
    :   type (',' type)*
    ;
    
public
classBody
    :   '{' classBodyDeclaration* '}'
    ;
    
public
interfaceBody
    :   '{' interfaceBodyDeclaration* '}'
    ;

public
classBodyDeclaration
    :   ';'
    |   'static'? block
    |   modifiers memberDecl
    ;
    
public
memberDecl
    :   genericMethodOrConstructorDecl
    |   memberDeclaration
    |   'void' Identifier voidMethodDeclaratorRest
    |   Identifier constructorDeclaratorRest
    |   interfaceDeclaration
    |   classDeclaration
    ;
    
public
memberDeclaration
    :   type (methodDeclaration | fieldDeclaration)
    ;

public
genericMethodOrConstructorDecl
    :   typeParameters genericMethodOrConstructorRest
    ;
    
public
genericMethodOrConstructorRest
    :   (type | 'void') Identifier methodDeclaratorRest
    |   Identifier constructorDeclaratorRest
    ;

public
methodDeclaration
    :   Identifier methodDeclaratorRest
    ;

public
fieldDeclaration
    :   variableDeclarators ';'
    ;
        
public
interfaceBodyDeclaration
    :   modifiers interfaceMemberDecl
    |   ';'
    ;

public
interfaceMemberDecl
    :   interfaceMethodOrFieldDecl
    |   interfaceGenericMethodDecl
    |   'void' Identifier voidInterfaceMethodDeclaratorRest
    |   interfaceDeclaration
    |   classDeclaration
    ;
    
public
interfaceMethodOrFieldDecl
    :   type Identifier interfaceMethodOrFieldRest
    ;
    
public
interfaceMethodOrFieldRest
    :   constantDeclaratorsRest ';'
    |   interfaceMethodDeclaratorRest
    ;
    
public
methodDeclaratorRest
    :   formalParameters ('[' ']')*
        ('throws' qualifiedNameList)?
        (   methodBody
        |   ';'
        )
    ;
    
public
voidMethodDeclaratorRest
    :   formalParameters ('throws' qualifiedNameList)?
        (   methodBody
        |   ';'
        )
    ;
    
public
interfaceMethodDeclaratorRest
    :   formalParameters ('[' ']')* ('throws' qualifiedNameList)? ';'
    ;
    
public
interfaceGenericMethodDecl
    :   typeParameters (type | 'void') Identifier
        interfaceMethodDeclaratorRest
    ;
    
public
voidInterfaceMethodDeclaratorRest
    :   formalParameters ('throws' qualifiedNameList)? ';'
    ;
    
public
constructorDeclaratorRest
    :   formalParameters ('throws' qualifiedNameList)? constructorBody
    ;

public
constantDeclarator
    :   Identifier constantDeclaratorRest
    ;
    
public
variableDeclarators
    :   variableDeclarator (',' variableDeclarator)*
    ;

public
variableDeclarator
    :   variableDeclaratorId ('=' variableInitializer)?
    ;
    
public
constantDeclaratorsRest
    :   constantDeclaratorRest (',' constantDeclarator)*
    ;

public
constantDeclaratorRest
    :   ('[' ']')* '=' variableInitializer
    ;
    
public
variableDeclaratorId
    :   Identifier ('[' ']')*
    ;

public
variableInitializer
    :   arrayInitializer
    |   expression
    ;
        
public
arrayInitializer
    :   '{' (variableInitializer (',' variableInitializer)* (',')? )? '}'
    ;

public
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

public
packageOrTypeName
    :   qualifiedName
    ;

public
enumConstantName
    :   Identifier
    ;

public
typeName
    :   qualifiedName
    ;

public
type
	:	classOrInterfaceType ('[' ']')*
	|	primitiveType ('[' ']')*
	;

public
classOrInterfaceType
	:	Identifier typeArguments? ('.' Identifier typeArguments? )*
	;

public
primitiveType
    :   'boolean'
    |   'char'
    |   'byte'
    |   'short'
    |   'int'
    |   'long'
    |   'float'
    |   'double'
    ;

public
variableModifier
    :   'final'
    |   annotation
    ;

public
typeArguments
    :   '<' typeArgument (',' typeArgument)* '>'
    ;
    
public
typeArgument
    :   type
    |   '?' (('extends' | 'super') type)?
    ;
    
public
qualifiedNameList
    :   qualifiedName (',' qualifiedName)*
    ;

public
formalParameters
    :   '(' formalParameterDecls? ')'
    ;
    
public
formalParameterDecls
    :   variableModifiers type formalParameterDeclsRest
    ;
    
public
formalParameterDeclsRest
    :   variableDeclaratorId (',' formalParameterDecls)?
    |   '...' variableDeclaratorId
    ;
    
public
methodBody
    :   block
    ;

public
constructorBody
    :   '{' explicitConstructorInvocation? blockStatement* '}'
    ;

public
explicitConstructorInvocation
    :   nonWildcardTypeArguments? ('this' | 'super') arguments ';'
    |   primary '.' nonWildcardTypeArguments? 'super' arguments ';'
    ;

public
qualifiedName
    :   Identifier ('.' Identifier)*
    ;
