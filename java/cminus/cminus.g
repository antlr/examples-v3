header {
import org.antlr.stringtemplate.*;
}

grammar CMinusParser;
options {output=template;}

scope slist {
    List locals; // must be defined one per semicolon
    List stats;
}

program
scope {
  List globals;
  List functions;
}
init {
  $globals = new ArrayList();
  $functions = new ArrayList();
}
    :   declaration+ -> program(globals={$globals},functions={$functions})
    ;

declaration
    :   variable   {$program.globals.add($variable.st);}
    |   f=function {$program.functions.add($f.st);}
    ;

// ack is $function.st ambig?  It can mean the rule's dyn scope or
// the ref in this rule.  Ack.

variable
    :   type declarator ';'
        -> {function_stack.size()>0 && $function.name==null}?
           globalVariable(type={$type.st},name={$declarator.st})
        -> variable(type={$type.st},name={$declarator.st})
    ;

declarator
    :   ID -> {new StringTemplate($ID.text)}
    ;

function
scope {
    String name;
}, slist;
init {
  $slist.locals = new ArrayList();
  $slist.stats = new ArrayList();
}
    :   type ID {$name=$ID.text;}
        '(' ( p+=formalParameter ( ',' p+=formalParameter )* )? ')'
        block
        -> function(type={$type.st}, name={$name},
                    locals={$slist.locals},
                    stats={$slist.stats},
                    args={toTemplates($p)})
    ;

formalParameter
    :   type declarator 
        -> parameter(type={$type.st},name={$declarator.st})
    ;

type
    :   "int"  -> type_int()
    |   "char" -> type_char()
    |   ID     -> type_user_object(name={$ID.text})
    ;

block
    :  '{'
       ( variable {$slist.locals.add($variable.st);} )*
       ( stat {$slist.stats.add($stat.st);})*
       '}'
    ;

stat
scope slist;
init {
  $slist.locals = new ArrayList();
  $slist.stats = new ArrayList();
}
    : forStat -> {$forStat.st}
    | expr ';' -> statement(expr={$expr.st})
    | block -> statementList(locals={$slist.locals}, stats={$slist.stats})
    | assignStat ';' -> {$assignStat.st}
    | ';' -> {new StringTemplate(";")}
    ;

forStat
scope slist;
init {
  $slist.locals = new ArrayList();
  $slist.stats = new ArrayList();
}
    :   "for" '(' e1=assignStat ';' e2=expr ';' e3=assignStat ')' block
        -> forLoop(e1={$e1.st},e2={$e2.st},e3={$e3.st},
                   locals={$slist.locals}, stats={$slist.stats})
    ;

assignStat
    :   ID '=' expr -> assign(lhs={$ID.text}, rhs={$expr.st})
    ;

expr:   condExpr -> {$condExpr.st}
    ;

condExpr
    :   a=aexpr
        (   (  "==" b=aexpr -> equals(left={$a.st},right={$b.st})
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

WS  :   (' ' | '\t' | '\r' | '\n')+ {channel=99;}
    ;    
