/** Derived from Yukihiro Matsumoto's parse.y Ruby grammar by Terence Parr.
 *  Still working on it...
 */
grammar RubyParser;


program	:   compstmt ;

bodystmt	: compstmt
		  opt_rescue
		  opt_else
		  opt_ensure
		    
		;

compstmt	: stmts opt_terms
		    
		;
stmts		: stmt (terms stmt)*
		;
stmt
	: (ALIAS fitem  fitem
    | ALIAS GVAR GVAR
    | ALIAS GVAR BACK_REF
    | ALIAS GVAR NTH_REF
    | UNDEF undef_list
    | LBEGIN "{" compstmt "}"
    | LEND "{" compstmt "}"
    | lhs "=" command_call
    | mlhs "=" command_call
    | var_lhs OP_ASGN command_call
    | primary_value "[" aref_args "]" OP_ASGN command_call
    | primary_value "." IDENTIFIER OP_ASGN command_call
    | primary_value "." CONSTANT OP_ASGN command_call
    | primary_value COLON2 IDENTIFIER OP_ASGN command_call
    | backref OP_ASGN command_call
    | lhs "=" mrhs
    | mlhs "=" arg_value
    | mlhs "=" mrhs
    | expr
    )
        (IF_MOD expr_value
        | UNLESS_MOD expr_value
        | WHILE_MOD expr_value
        | UNTIL_MOD expr_value
        | RESCUE_MOD stmt
        )*
		;

expr		: (command_call | NOT expr | "!" command_call | arg) (AND expr | OR expr)*
		;

expr_value	: expr
		    
		;

command_call	: command
		| block_command
		| RETURN call_args
		    
		| BREAK call_args
		    
		| NEXT call_args
		    
		;

block_command	: block_call
		| block_call "." operation2 command_args
		    
		| block_call COLON2 operation2 command_args
		    
		;

cmd_brace_block	: LBRACE_ARG
		    
		  opt_block_var 
		  compstmt
		  "}"
		    
		;

command		: operation command_args
		    
		| operation command_args cmd_brace_block
		    
		| primary_value "." operation2 command_args
		    
		| primary_value "." operation2 command_args cmd_brace_block
		    
		| primary_value COLON2 operation2 command_args
		    
		| primary_value COLON2 operation2 command_args cmd_brace_block
		    
		| SUPER command_args
		    
		| YIELD command_args
		    
		;

mlhs		: mlhs_basic
		| LPAREN mlhs_entry ")"
		    
		;

mlhs_entry	: mlhs_basic
		| LPAREN mlhs_entry ")"
		    
		;

mlhs_basic	: mlhs_head
		    
		| mlhs_head mlhs_item
		    
		| mlhs_head STAR mlhs_node
		    
		| mlhs_head STAR
		| STAR mlhs_node
		| STAR
		;

mlhs_item	: mlhs_node
		| LPAREN mlhs_entry ")"
		;

mlhs_head	: (mlhs_item ",") (mlhs_item ",")*
		;

mlhs_node	: variable
		| primary_value "[" aref_args "]"
		| primary_value "." IDENTIFIER
		| primary_value COLON2 IDENTIFIER

		| primary_value "." CONSTANT
		| primary_value COLON2 CONSTANT

		| COLON3 CONSTANT

		| backref
		;

lhs		: variable
		| primary_value "[" aref_args "]"
		| primary_value "." IDENTIFIER
		| primary_value COLON2 IDENTIFIER
		| primary_value "." CONSTANT
		| primary_value COLON2 CONSTANT
		| COLON3 CONSTANT

		| backref
		;

cname		: IDENTIFIER
		    {
			//yyerror("class/module name must be CONSTANT");
		    }
		| CONSTANT
		;

cpath		: COLON3 cname
		| cname
		| primary_value COLON2 cname
		;

fname		: IDENTIFIER
		| CONSTANT
		| FID
		| op
		| reswords
		;

fitem		: fname
		| symbol
		;

undef_list	: (fitem) (","  fitem)*
		;

op		: "|"		
		| "^"		
		| "&"		
		| CMP		
		| EQ		
		| EQQ		
		| MATCH	
		| ">"		
		| GEQ		
		| "<"		
		| LEQ		
		| LSHFT	
		| RSHFT	
		| "+"		
		| "-"		
		| "*"		
		| STAR		
		| "/"		
		| "%"		
		| POW		
		| "~"		
		| UPLUS	
		| UMINUS	
		| AREF		
		| ASET		
		| "`"		
		;

reswords	: LINE | K__FILE__  | LBEGIN | LEND
		| ALIAS | AND | BEGIN | BREAK | CASE | CLASS | DEF
		| DEFINED | DO | ELSE | ELSIF | END | ENSURE | FALSE
		| FOR | IN | MODULE | NEXT | NIL | NOT
		| OR | REDO | RESCUE | RETRY | RETURN | SELF | SUPER
		| THEN | TRUE | UNDEF | WHEN | YIELD
		| IF_MOD | UNLESS_MOD | WHILE_MOD | UNTIL_MOD | RESCUE_MOD
		;

arg		: (lhs "=" arg | lhs "=" arg RESCUE_MOD arg | var_lhs OP_ASGN arg | primary_value "[" aref_args "]" OP_ASGN arg | primary_value "." IDENTIFIER OP_ASGN arg | primary_value "." CONSTANT OP_ASGN arg | primary_value COLON2 IDENTIFIER OP_ASGN arg | primary_value COLON2 CONSTANT OP_ASGN arg | COLON3 CONSTANT OP_ASGN arg | backref OP_ASGN arg | UMINUS_NUM INTEGER POW arg | UMINUS_NUM FLOAT POW arg | UPLUS arg | UMINUS arg | "!" arg | "~" arg | DEFINED opt_nl  arg | primary) (DOT2 arg | DOT3 arg | "+" arg | "-" arg | "*" arg | "/" arg | "%" arg | POW arg | "|" arg | "^" arg | "&" arg | CMP arg | ">" arg | GEQ arg | "<" arg | LEQ arg | EQ arg | EQQ arg | NEQ arg | MATCH arg | NMATCH arg | LSHFT arg | RSHFT arg | ANDOP arg | OROP arg | "?" arg ":" arg)*
		;

arg_value	: arg
		;

aref_args
    : command opt_nl
    | args trailer
    | args "," STAR arg opt_nl
    | assocs trailer
    | STAR arg opt_nl
	|	    
    ;

paren_args	: "(" ")"
		    
		| "(" call_args opt_nl ")"
		    
		| "(" block_call opt_nl ")"
		    
		| "(" args "," block_call opt_nl ")"
		    
		;

opt_paren_args
	: paren_args
    | 
    ;

call_args	: command
		    
		| args opt_block_arg
		    
		| args "," STAR arg_value opt_block_arg
		    
		| assocs opt_block_arg
		    
		| assocs "," STAR arg_value opt_block_arg
		    
		| args "," assocs opt_block_arg
		    
		| args "," assocs "," STAR arg opt_block_arg
		    
		| STAR arg_value opt_block_arg
		    
		| block_arg
		;

call_args2	: arg_value "," args opt_block_arg
		    
		| arg_value "," block_arg
		    
		| arg_value "," STAR arg_value opt_block_arg
		    
		| arg_value "," args "," STAR arg_value opt_block_arg
		    
		| assocs opt_block_arg
		    
		| assocs "," STAR arg_value opt_block_arg
		    
		| arg_value "," assocs opt_block_arg
		    
		| arg_value "," args "," assocs opt_block_arg
		    
		| arg_value "," assocs "," STAR arg_value opt_block_arg
		    
		| arg_value "," args "," assocs "," STAR arg_value opt_block_arg
		    
		| STAR arg_value opt_block_arg
		    
		| block_arg
		;

command_args	:  
		  open_args
		    
		;

open_args	: call_args
		| LPAREN_ARG   ")"
		    
		| LPAREN_ARG call_args2  ")"
		    
		;

block_arg	: AMPER arg_value
		    
		;

opt_block_arg	: "," block_arg
		    
		|
		;

args 		: (arg_value) ("," arg_value)*

		;

mrhs		: args "," arg_value
		    
		| args "," STAR arg_value
		    
		| STAR arg_value
		    
		;

primary		: literal
		| strings
		| xstring
		| regexp
		| words
		| qwords
		| var_ref
		| backref
		| FID
		    
		| BEGIN
		    
		  bodystmt
		  END
		    
		| LPAREN_ARG expr  opt_nl ")"
		    
		| LPAREN compstmt ")"
		    
		| primary_value COLON2 CONSTANT
		    
		| COLON3 CONSTANT
		    
		| primary_value "[" aref_args "]"
		    
		| LBRACK aref_args "]"
		    
		| LBRACE assoc_list "}"
		    
		| RETURN
		    
		| YIELD "(" call_args ")"
		    
		| YIELD "(" ")"
		    
		| YIELD
		    
		| DEFINED opt_nl "("  expr ")"
		    
		| operation brace_block
		    
		| method_call
		| method_call brace_block
		    
		| IF expr_value then
		  compstmt
		  if_tail
		  END
		    
		| UNLESS expr_value then
		  compstmt
		  opt_else
		  END
		    
		| WHILE  expr_value do
		  compstmt
		  END
		    
		| UNTIL  expr_value do
		  compstmt
		  END
		    
		| CASE expr_value opt_terms
		  case_body
		  END
		    
		| CASE opt_terms case_body END
		    
		| CASE opt_terms ELSE compstmt END
		    
		| FOR block_var IN {COND_PUSH(1);} expr_value do {COND_POP();}
		  compstmt
		  END
		    
		| CLASS cpath superclass
		    
		  bodystmt
		  END
		    
		| CLASS LSHFT expr
		    
		  term
		    
		  bodystmt
		  END
		    
		| MODULE cpath
		    
		  bodystmt
		  END
		    
		| DEF fname
		    
		  f_arglist
		  bodystmt
		  END
		    
		| DEF singleton dot_or_colon  fname
		    
		  f_arglist
		  bodystmt
		  END
		    
		| BREAK
		    
		| NEXT
		    
		| REDO
		    
		| RETRY
		    
		;

primary_value 	: primary
		    
		;

then		: term
		| ":"
		| THEN
		| term THEN
		;

do		: term
		| ":"
		| DO_COND
		;

if_tail		: opt_else
		| ELSIF expr_value then
		  compstmt
		  if_tail
		    
		;

opt_else	:
		| ELSE compstmt
		    
		;

block_var	: lhs
		| mlhs
		;

opt_block_var	:
		| "|"  "|"
		    
		| OROP
		    
		| "|" block_var "|"
		    
		;

do_block	: DO_BLOCK
		    
		  opt_block_var 
		  compstmt
		  END
		    
		;

block_call	: (command do_block) ("." operation2 opt_paren_args | COLON2 operation2 opt_paren_args)*
		    
		;

method_call	: operation paren_args
		    
		| primary_value "." operation2 opt_paren_args
		| primary_value COLON2 operation2 paren_args
		| primary_value COLON2 operation3
		| SUPER paren_args

		| SUPER
		;

brace_block	: "{"
		  opt_block_var 
		  compstmt "}"
		| DO
		  opt_block_var 
		  compstmt END
		;

case_body	: WHEN when_args then
		  compstmt
		  cases
		;
when_args	: args
		| args "," STAR arg_value
		| STAR arg_value
		;

cases		: opt_else
		| case_body
		;

opt_rescue	: RESCUE exc_list exc_var then
		  compstmt
		  opt_rescue
		    
		|
		;

exc_list	: arg_value
		| mrhs
		|
		;

exc_var		: ASSOC lhs
		| 
		;

opt_ensure	: ENSURE compstmt
		    
		| 
		;

literal		: numeric
		| symbol
		    
		| dsym
		;

strings		: string
		    
		;

string		: (string1) (string1)*
		    
		;

string1		: STRING_BEG string_contents STRING_END
		    
		;

xstring		: XSTRING_BEG xstring_contents STRING_END
		    
		;

regexp		: REGEXP_BEG xstring_contents REGEXP_END
		    
		;

words		: WORDS_BEG " " STRING_END
		    
		| WORDS_BEG word_list STRING_END
		    
		;

word_list	:  (word " ")*
		    
		;

word		: (string_content) (string_content)*
		    
		;

qwords		: QWORDS_BEG " " STRING_END
		    
		| QWORDS_BEG qword_list STRING_END
		    
		;

qword_list	: (STRING_CONTENT " ")*
		    
		;

string_contents :  (string_content)*
		    
		;

xstring_contents: (string_content)*
		    
		;

string_content	: STRING_CONTENT
		| STRING_DVAR
		    
		  string_dvar
		    
		| STRING_DBEG
		    
		  compstmt "}"
		    
		;

string_dvar	: GVAR 
		| IVAR 
		| CVAR 
		| backref
		;

symbol		: SYMBEG sym
		    
		;

sym		: fname
		| IVAR
		| GVAR
		| CVAR
		;

dsym		: SYMBEG xstring_contents STRING_END
		    
		;

numeric		: INTEGER
		| FLOAT
		| UMINUS_NUM INTEGER
		    
		| UMINUS_NUM FLOAT
		    
		;

variable	: IDENTIFIER
		| IVAR
		| GVAR
		| CONSTANT
		| CVAR
		| NIL 
		| SELF 
		| TRUE 
		| FALSE 
		| K__FILE__ 
		| LINE 
		;

var_ref		: variable
		    
		;

var_lhs		: variable
		    
		;

backref		: NTH_REF
		| BACK_REF
		;

superclass	: term
		    
		| "<"
		    
		  expr_value term
		    
//		| error term 
		;

f_arglist	: "(" f_args opt_nl ")"
		    
		| f_args term
		    
		;

f_args		: f_arg "," f_optarg "," f_rest_arg opt_f_block_arg
		    
		| f_arg "," f_optarg opt_f_block_arg
		    
		| f_arg "," f_rest_arg opt_f_block_arg
		    
		| f_arg opt_f_block_arg
		    
		| f_optarg "," f_rest_arg opt_f_block_arg
		    
		| f_optarg opt_f_block_arg
		    
		| f_rest_arg opt_f_block_arg
		    
		| f_block_arg
		    
		|
		    
		;

f_norm_arg	: CONSTANT
		    {
			//yyerror("formal argument cannot be a constant");
		    }
                | IVAR
		    {
//              yyerror("formal argument cannot be an instance variable");
		    }
                | GVAR
	        {
//                yyerror("formal argument cannot be a global variable");
		    }
                | CVAR
		    {
         //      yyerror("formal argument cannot be a class variable");
		    }
		| IDENTIFIER

		;

f_arg		: (f_norm_arg) ("," f_norm_arg)*

		;

f_opt		: IDENTIFIER "=" arg_value
		    
		;

f_optarg	: (f_opt) ("," f_opt)*
		    
		;

restarg_mark	: "*"
		| STAR
		;

f_rest_arg	: restarg_mark IDENTIFIER
		 
		| restarg_mark
		 
		;

blkarg_mark	: "&"
		| AMPER
		;

f_block_arg	: blkarg_mark IDENTIFIER
		 
		;

opt_f_block_arg	: "," f_block_arg
		 
		|
		;

singleton	: var_ref
		 
		| "("  expr opt_nl ")"
		 
		;

assoc_list	:
		| assocs trailer
		 
		| args trailer
		 
		;

assocs		: (assoc) ("," assoc)*
		 
		;

assoc		: arg_value ASSOC arg_value
		 
		;

operation	: IDENTIFIER
		| CONSTANT
		| FID
		;

operation2	: IDENTIFIER
		| CONSTANT
		| FID
		| op
		;

operation3	: IDENTIFIER
		| FID
		| op
		;

dot_or_colon	: "."
		| COLON2
		;

opt_terms	:
		| terms
		;

opt_nl		:
		| "\n"
		;

trailer		:
		| "\n"
		| ","
		;

term		: ";" 
		| "\n"
		;

terms		: term (";")* 
		;
