grammar Calculator;
options {language=JavaScript;}

prog:   stat+ ;
                
stat:   expr NEWLINE {Calculator.log($expr.value);}
    |   ID '=' expr NEWLINE
        {this.memory[$ID.text] = $expr.value;}
    |   NEWLINE
    ;

expr returns [value]
    :   e=multExpr {$value = $e.value;}
        (   '+' e=multExpr {$value += $e.value;}
        |   '-' e=multExpr {$value -= $e.value;}
        )*
    ;

multExpr returns [value]
    :   e=atom {$value = $e.value;} ('*' e=atom {$value *= $e.value;})*
    ; 

atom returns [value]
    :   INT {$value = parseInt($INT.text,10);}
    |   ID
        {
        var v = this.memory[$ID.text];
        if ( org.antlr.lang.isNumber(v) ) $value = v;
        else Calculator.logError("undefined variable "+$ID.text);
        }
    |   '(' expr ')' {$value = $expr.value;}
    ;

ID  :   ('a'..'z'|'A'..'Z')+ ;
INT :   '0'..'9'+ ;
NEWLINE:'\r'? '\n' ;
WS  :   (' '|'\t')+ {this.skip();} ;
