/** Derived from Yukihiro Matsumoto's parse.y Ruby grammar by Terence Parr.
 *  Still working on it...
 */
grammar RubyParser;


program		:  
		  compstmt
;

bodystmt	: compstmt
		  opt_rescue
		  opt_else
		  opt_ensure
		    
		;

compstmt	: stmts opt_terms
		    
		;

stmts		: none
		| stmt
		    
		| stmts terms stmt
		    
		| error stmt
		    
		;

stmt		: ALIAS fitem  fitem
		    
		| ALIAS tGVAR tGVAR
		    
		| ALIAS tGVAR tBACK_REF
		    
		| ALIAS tGVAR tNTH_REF
		    
		| kUNDEF undef_list
		    
		| stmt kIF_MOD expr_value
		    
		| stmt kUNLESS_MOD expr_value
		    
		| stmt kWHILE_MOD expr_value
		    
		| stmt kUNTIL_MOD expr_value
		    
		| stmt kRESCUE_MOD stmt
		    
		| LBEGIN
		    
		  "{" compstmt "}"
		    
		| LEND "{" compstmt "}"
		    
		| lhs "=" command_call
		    
		| mlhs "=" command_call
		    
		| var_lhs tOP_ASGN command_call
		    
		| primary_value "[" aref_args "]" tOP_ASGN command_call
		    
		| primary_value "." tIDENTIFIER tOP_ASGN command_call
		    
		| primary_value "." tCONSTANT tOP_ASGN command_call
		    
		| primary_value tCOLON2 tIDENTIFIER tOP_ASGN command_call
		    
		| backref tOP_ASGN command_call
		    
		| lhs "=" mrhs
		    
		| mlhs "=" arg_value
		    
		| mlhs "=" mrhs
		    
		| expr
		;

expr		: command_call
		| expr AND expr
		    
		| expr kOR expr
		    
		| kNOT expr
		    
		| "!" command_call
		    
		| arg
		;

expr_value	: expr
		    
		;

command_call	: command
		| block_command
		| kRETURN call_args
		    
		| BREAK call_args
		    
		| kNEXT call_args
		    
		;

block_command	: block_call
		| block_call "." operation2 command_args
		    
		| block_call tCOLON2 operation2 command_args
		    
		;

cmd_brace_block	: tLBRACE_ARG
		    
		  opt_block_var 
		  compstmt
		  "}"
		    
		;

command		: operation command_args
		    
		| operation command_args cmd_brace_block
		    
		| primary_value "." operation2 command_args
		    
		| primary_value "." operation2 command_args cmd_brace_block
		    
		| primary_value tCOLON2 operation2 command_args
		    
		| primary_value tCOLON2 operation2 command_args cmd_brace_block
		    
		| kSUPER command_args
		    
		| kYIELD command_args
		    
		;

mlhs		: mlhs_basic
		| tLPAREN mlhs_entry ")"
		    
		;

mlhs_entry	: mlhs_basic
		| tLPAREN mlhs_entry ")"
		    
		;

mlhs_basic	: mlhs_head
		    
		| mlhs_head mlhs_item
		    
		| mlhs_head tSTAR mlhs_node
		    
		| mlhs_head tSTAR
		| tSTAR mlhs_node
		| tSTAR
		;

mlhs_item	: mlhs_node
		| tLPAREN mlhs_entry ")"
		;

mlhs_head	: mlhs_item ","
		| mlhs_head mlhs_item ","
		;

mlhs_node	: variable
		| primary_value "[" aref_args "]"
		| primary_value "." tIDENTIFIER
		| primary_value tCOLON2 tIDENTIFIER

		| primary_value "." tCONSTANT
		| primary_value tCOLON2 tCONSTANT

		| tCOLON3 tCONSTANT

		| backref
		;

lhs		: variable
		| primary_value "[" aref_args "]"
		| primary_value "." tIDENTIFIER
		| primary_value tCOLON2 tIDENTIFIER
		| primary_value "." tCONSTANT
		| primary_value tCOLON2 tCONSTANT
		| tCOLON3 tCONSTANT

		| backref
		;

cname		: tIDENTIFIER
		    {
			//yyerror("class/module name must be CONSTANT");
		    }
		| tCONSTANT
		;

cpath		: tCOLON3 cname
		| cname
		| primary_value tCOLON2 cname
		;

fname		: tIDENTIFIER
		| tCONSTANT
		| tFID
		| op
		| reswords
		;

fitem		: fname
		| symbol
		;

undef_list	: fitem
		| undef_list ","  fitem
		;

op		: "|"		
		| "^"		
		| "&"		
		| tCMP		
		| tEQ		
		| tEQQ		
		| tMATCH	
		| ">"		
		| tGEQ		
		| "<"		
		| tLEQ		
		| tLSHFT	
		| tRSHFT	
		| "+"		
		| "-"		
		| "*"		
		| tSTAR		
		| "/"		
		| "%"		
		| tPOW		
		| "~"		
		| tUPLUS	
		| tUMINUS	
		| tAREF		
		| tASET		
		| "`"		
		;

reswords	: LINE | k__FILE__  | LBEGIN | LEND
		| ALIAS | AND | BEGIN | BREAK | CASE | kCLASS | kDEF
		| kDEFINED | kDO | kELSE | kELSIF | kEND | kENSURE | kFALSE
		| kFOR | kIN | kMODULE | kNEXT | kNIL | kNOT
		| kOR | kREDO | kRESCUE | kRETRY | kRETURN | kSELF | kSUPER
		| kTHEN | kTRUE | kUNDEF | kWHEN | kYIELD
		| kIF_MOD | kUNLESS_MOD | kWHILE_MOD | kUNTIL_MOD | kRESCUE_MOD
		;

arg		: lhs "=" arg
		| lhs "=" arg kRESCUE_MOD arg
		| var_lhs tOP_ASGN arg
		| primary_value "[" aref_args "]" tOP_ASGN arg
		    
		| primary_value "." tIDENTIFIER tOP_ASGN arg
		    
		| primary_value "." tCONSTANT tOP_ASGN arg
		    
		| primary_value tCOLON2 tIDENTIFIER tOP_ASGN arg
		    
		| primary_value tCOLON2 tCONSTANT tOP_ASGN arg
		    
		| tCOLON3 tCONSTANT tOP_ASGN arg
		    
		| backref tOP_ASGN arg
		    
		| arg tDOT2 arg
		    
		| arg tDOT3 arg
		    
		| arg "+" arg
		    
		| arg "-" arg
		    
		| arg "*" arg
		    
		| arg "/" arg
		| arg "%" arg
		| arg tPOW arg
		| tUMINUS_NUM tINTEGER tPOW arg
		| tUMINUS_NUM tFLOAT tPOW arg
		| tUPLUS arg
		| tUMINUS arg
		| arg "|" arg
		| arg "^" arg
		| arg "&" arg
		| arg tCMP arg
		| arg ">" arg
		| arg tGEQ arg
		| arg "<" arg
		| arg tLEQ arg
		| arg tEQ arg
		| arg tEQQ arg
		| arg tNEQ arg
		| arg tMATCH arg
		| arg tNMATCH arg
		| "!" arg
		| "~" arg
		| arg tLSHFT arg
		| arg tRSHFT arg
		| arg tANDOP arg
		| arg tOROP arg
		| kDEFINED opt_nl  arg
		| arg "?" arg ":" arg
		| primary
		;

arg_value	: arg
		;

aref_args	: none
		| command opt_nl
		| args trailer
		| args "," tSTAR arg opt_nl
		| assocs trailer
		    
		| tSTAR arg opt_nl
		    
		;

paren_args	: "(" none ")"
		    
		| "(" call_args opt_nl ")"
		    
		| "(" block_call opt_nl ")"
		    
		| "(" args "," block_call opt_nl ")"
		    
		;

opt_paren_args	: none
		| paren_args
		;

call_args	: command
		    
		| args opt_block_arg
		    
		| args "," tSTAR arg_value opt_block_arg
		    
		| assocs opt_block_arg
		    
		| assocs "," tSTAR arg_value opt_block_arg
		    
		| args "," assocs opt_block_arg
		    
		| args "," assocs "," tSTAR arg opt_block_arg
		    
		| tSTAR arg_value opt_block_arg
		    
		| block_arg
		;

call_args2	: arg_value "," args opt_block_arg
		    
		| arg_value "," block_arg
		    
		| arg_value "," tSTAR arg_value opt_block_arg
		    
		| arg_value "," args "," tSTAR arg_value opt_block_arg
		    
		| assocs opt_block_arg
		    
		| assocs "," tSTAR arg_value opt_block_arg
		    
		| arg_value "," assocs opt_block_arg
		    
		| arg_value "," args "," assocs opt_block_arg
		    
		| arg_value "," assocs "," tSTAR arg_value opt_block_arg
		    
		| arg_value "," args "," assocs "," tSTAR arg_value opt_block_arg
		    
		| tSTAR arg_value opt_block_arg
		    
		| block_arg
		;

command_args	:  
		  open_args
		    
		;

open_args	: call_args
		| tLPAREN_ARG   ")"
		    
		| tLPAREN_ARG call_args2  ")"
		    
		;

block_arg	: tAMPER arg_value
		    
		;

opt_block_arg	: "," block_arg
		    
		| none
		;

args 		: arg_value
		    
		| args "," arg_value

		;

mrhs		: args "," arg_value
		    
		| args "," tSTAR arg_value
		    
		| tSTAR arg_value
		    
		;

primary		: literal
		| strings
		| xstring
		| regexp
		| words
		| qwords
		| var_ref
		| backref
		| tFID
		    
		| BEGIN
		    
		  bodystmt
		  kEND
		    
		| tLPAREN_ARG expr  opt_nl ")"
		    
		| tLPAREN compstmt ")"
		    
		| primary_value tCOLON2 tCONSTANT
		    
		| tCOLON3 tCONSTANT
		    
		| primary_value "[" aref_args "]"
		    
		| tLBRACK aref_args "]"
		    
		| tLBRACE assoc_list "}"
		    
		| kRETURN
		    
		| kYIELD "(" call_args ")"
		    
		| kYIELD "(" ")"
		    
		| kYIELD
		    
		| kDEFINED opt_nl "("  expr ")"
		    
		| operation brace_block
		    
		| method_call
		| method_call brace_block
		    
		| kIF expr_value then
		  compstmt
		  if_tail
		  kEND
		    
		| kUNLESS expr_value then
		  compstmt
		  opt_else
		  kEND
		    
		| kWHILE  expr_value do
		  compstmt
		  kEND
		    
		| kUNTIL  expr_value do
		  compstmt
		  kEND
		    
		| CASE expr_value opt_terms
		  case_body
		  kEND
		    
		| CASE opt_terms case_body kEND
		    
		| CASE opt_terms kELSE compstmt kEND
		    
		| kFOR block_var kIN {COND_PUSH(1);} expr_value do {COND_POP();}
		  compstmt
		  kEND
		    
		| kCLASS cpath superclass
		    
		  bodystmt
		  kEND
		    
		| kCLASS tLSHFT expr
		    
		  term
		    
		  bodystmt
		  kEND
		    
		| kMODULE cpath
		    
		  bodystmt
		  kEND
		    
		| kDEF fname
		    
		  f_arglist
		  bodystmt
		  kEND
		    
		| kDEF singleton dot_or_colon  fname
		    
		  f_arglist
		  bodystmt
		  kEND
		    
		| BREAK
		    
		| kNEXT
		    
		| kREDO
		    
		| kRETRY
		    
		;

primary_value 	: primary
		    
		;

then		: term
		| ":"
		| kTHEN
		| term kTHEN
		;

do		: term
		| ":"
		| kDO_COND
		;

if_tail		: opt_else
		| kELSIF expr_value then
		  compstmt
		  if_tail
		    
		;

opt_else	: none
		| kELSE compstmt
		    
		;

block_var	: lhs
		| mlhs
		;

opt_block_var	: none
		| "|" /* none */ "|"
		    
		| tOROP
		    
		| "|" block_var "|"
		    
		;

do_block	: kDO_BLOCK
		    
		  opt_block_var 
		  compstmt
		  kEND
		    
		;

block_call	: command do_block
		    
		| block_call "." operation2 opt_paren_args
		    
		| block_call tCOLON2 operation2 opt_paren_args
		    
		;

method_call	: operation paren_args
		    
		| primary_value "." operation2 opt_paren_args
		| primary_value tCOLON2 operation2 paren_args
		| primary_value tCOLON2 operation3
		| kSUPER paren_args

		| kSUPER
		;

brace_block	: "{"
		  opt_block_var 
		  compstmt "}"
		| kDO
		  opt_block_var 
		  compstmt kEND
		;

case_body	: kWHEN when_args then
		  compstmt
		  cases
		;
when_args	: args
		| args "," tSTAR arg_value
		| tSTAR arg_value
		;

cases		: opt_else
		| case_body
		;

opt_rescue	: kRESCUE exc_list exc_var then
		  compstmt
		  opt_rescue
		    
		| none
		;

exc_list	: arg_value
		    
		| mrhs
		| none
		;

exc_var		: tASSOC lhs
		    
		| none
		;

opt_ensure	: kENSURE compstmt
		    
		| none
		;

literal		: numeric
		| symbol
		    
		| dsym
		;

strings		: string
		    
		;

string		: string1
		| string string1
		    
		;

string1		: tSTRING_BEG string_contents tSTRING_END
		    
		;

xstring		: tXSTRING_BEG xstring_contents tSTRING_END
		    
		;

regexp		: tREGEXP_BEG xstring_contents tREGEXP_END
		    
		;

words		: tWORDS_BEG " " tSTRING_END
		    
		| tWORDS_BEG word_list tSTRING_END
		    
		;

word_list	: /* none */
		    
		| word_list word " "
		    
		;

word		: string_content
		| word string_content
		    
		;

qwords		: tQWORDS_BEG " " tSTRING_END
		    
		| tQWORDS_BEG qword_list tSTRING_END
		    
		;

qword_list	: /* none */
		    
		| qword_list tSTRING_CONTENT " "
		    
		;

string_contents : /* none */
		    
		| string_contents string_content
		    
		;

xstring_contents: /* none */
		    
		| xstring_contents string_content
		    
		;

string_content	: tSTRING_CONTENT
		| tSTRING_DVAR
		    
		  string_dvar
		    
		| tSTRING_DBEG
		    
		  compstmt "}"
		    
		;

string_dvar	: tGVAR 
		| tIVAR 
		| tCVAR 
		| backref
		;

symbol		: tSYMBEG sym
		    
		;

sym		: fname
		| tIVAR
		| tGVAR
		| tCVAR
		;

dsym		: tSYMBEG xstring_contents tSTRING_END
		    
		;

numeric		: tINTEGER
		| tFLOAT
		| tUMINUS_NUM tINTEGER
		    
		| tUMINUS_NUM tFLOAT
		    
		;

variable	: tIDENTIFIER
		| tIVAR
		| tGVAR
		| tCONSTANT
		| tCVAR
		| kNIL 
		| kSELF 
		| kTRUE 
		| kFALSE 
		| k__FILE__ 
		| LINE 
		;

var_ref		: variable
		    
		;

var_lhs		: variable
		    
		;

backref		: tNTH_REF
		| tBACK_REF
		;

superclass	: term
		    
		| "<"
		    
		  expr_value term
		    
		| error term 
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
		    
		| /* none */
		    
		;

f_norm_arg	: tCONSTANT
		    {
			//yyerror("formal argument cannot be a constant");
		    }
                | tIVAR
		    {
//              yyerror("formal argument cannot be an instance variable");
		    }
                | tGVAR
	        {
//                yyerror("formal argument cannot be a global variable");
		    }
                | tCVAR
		    {
         //      yyerror("formal argument cannot be a class variable");
		    }
		| tIDENTIFIER

		;

f_arg		: f_norm_arg
		| f_arg "," f_norm_arg

		;

f_opt		: tIDENTIFIER "=" arg_value
		    
		;

f_optarg	: f_opt
		    
		| f_optarg "," f_opt
		    
		;

restarg_mark	: "*"
		| tSTAR
		;

f_rest_arg	: restarg_mark tIDENTIFIER
		 
		| restarg_mark
		 
		;

blkarg_mark	: "&"
		| tAMPER
		;

f_block_arg	: blkarg_mark tIDENTIFIER
		 
		;

opt_f_block_arg	: "," f_block_arg
		 
		| none
		;

singleton	: var_ref
		 
		| "("  expr opt_nl ")"
		 
		;

assoc_list	: none
		| assocs trailer
		 
		| args trailer
		 
		;

assocs		: assoc
		| assocs "," assoc
		 
		;

assoc		: arg_value tASSOC arg_value
		 
		;

operation	: tIDENTIFIER
		| tCONSTANT
		| tFID
		;

operation2	: tIDENTIFIER
		| tCONSTANT
		| tFID
		| op
		;

operation3	: tIDENTIFIER
		| tFID
		| op
		;

dot_or_colon	: "."
		| tCOLON2
		;

opt_terms	: /* none */
		| terms
		;

opt_nl		: /* none */
		| "\n"
		;

trailer		: /* none */
		| "\n"
		| ","
		;

term		: ";" 
		| "\n"
		;

terms		: term
		| terms ";" 
		;

none		: /* none */ 
		;
