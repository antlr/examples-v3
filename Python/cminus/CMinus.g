grammar CMinus;
options {
  language=Python;
  output=template;
}

scope slist {
    locals;
    stats;
}

/*
@slist::init {
    locals = new ArrayList();
    stats = new ArrayList();
}
*/

program
scope {
  globals;
  functions;
}
@init {
  $program::globals = []
  $program::functions = []
}
    :   declaration+
        -> program(globals={$program::globals},functions={$program::functions})
    ;

declaration
    :   variable   {$program::globals.append($variable.st);}
    |   f=function {$program::functions.append($f.st);}
    ;

// ack is $function.st ambig?  It can mean the rule's dyn scope or
// the ref in this rule.  Ack.

variable
    :   type declarator ';'
        -> {len($function) > 0 and $function::name is None}?
           globalVariable(type={$type.st},name={$declarator.st})
        -> variable(type={$type.st},name={$declarator.st})
    ;

declarator
    :   ID -> {stringtemplate3.StringTemplate($ID.text)}
    ;

function
scope {
    name;
}
scope slist;
@init {
  $slist::locals = []
  $slist::stats = []
}
    :   type ID {$function::name=$ID.text;}
        '(' ( p+=formalParameter ( ',' p+=formalParameter )* )? ')'
        block
        -> function(type={$type.st}, name={$function::name},
                    locals={$slist::locals},
                    stats={$slist::stats},
                    args={$p})
    ;

formalParameter
    :   type declarator 
        -> parameter(type={$type.st},name={$declarator.st})
    ;

type
    :   'int'  -> type_int()
    |   'char' -> type_char()
    |   ID     -> type_user_object(name={$ID.text})
    ;

block
    :  '{'
       ( variable {$slist::locals.append($variable.st);} )*
       ( stat {$slist::stats.append($stat.st);})*
       '}'
    ;

stat
scope slist;
@init {
  $slist::locals = []
  $slist::stats = []
}
    : forStat -> {$forStat.st}
    | expr ';' -> statement(expr={$expr.st})
    | block -> statementList(locals={$slist::locals}, stats={$slist::stats})
    | assignStat ';' -> {$assignStat.st}
    | ';' -> {stringtemplate3.StringTemplate(";")}
    ;

forStat
scope slist;
@init {
  $slist::locals = []
  $slist::stats = []
}
    :   'for' '(' e1=assignStat ';' e2=expr ';' e3=assignStat ')' block
        -> forLoop(e1={$e1.st},e2={$e2.st},e3={$e3.st},
                   locals={$slist::locals}, stats={$slist::stats})
    ;

assignStat
    :   ID '=' expr -> assign(lhs={$ID.text}, rhs={$expr.st})
    ;

expr:   condExpr -> {$condExpr.st}
    ;

condExpr
    :   a=aexpr
        (   (  '==' b=aexpr -> equals(left={$a.st},right={$b.st})
            |  '<' b=aexpr   -> lessThan(left={$a.st},right={$b.st})
            )
        |   -> {$a.st} // else just aexpr
        )
    ;

aexpr
    :   (a=atom -> {$a.st})
        ( '+' b=atom -> add(left={$aexpr.st}, right={$b.st}) )*
    ;

atom
    : ID -> refVar(id={$ID.text})
    | INT -> iconst(value={$INT.text})
    | '(' expr ')' -> {$expr.st}
    ; 

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT	:	('0'..'9')+
	;

WS  :   (' ' | '\t' | '\r' | '\n')+ {$channel=HIDDEN;}
    ;    
