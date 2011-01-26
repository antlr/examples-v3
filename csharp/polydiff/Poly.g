grammar Poly;
options {
    language=CSharp2;
    output=AST;
}

tokens { MULT; } // imaginary token

@header {
    #pragma warning disable 0219
}

public
poly: term ('+'^ term)*
    ;

term: INT ID  -> ^(MULT["*"] INT ID)
    | INT exp -> ^(MULT["*"] INT exp)
    | exp
    | INT
    | ID
    ;

exp : ID '^'^ INT
    ;
    
ID  : 'a'..'z'+ ;

INT : '0'..'9'+ ;

WS  : (' '|'\t'|'\r'|'\n')+ {Skip();} ; // ?????????
