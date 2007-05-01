// $ANTLR 3.0b3 .\\java.g 2006-07-23 01:51:29

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class JavaParserLexer extends Lexer {
    public static final int SR_ASSIGN=58;
    public static final int COMMA=48;
    public static final int MINUS=80;
    public static final int T152=152;
    public static final int T155=155;
    public static final int EXPR=28;
    public static final int CTOR_CALL=39;
    public static final int T129=129;
    public static final int T131=131;
    public static final int BOR=67;
    public static final int STATIC_INIT=12;
    public static final int DOT=44;
    public static final int POST_INC=25;
    public static final int SR=77;
    public static final int LCURLY=46;
    public static final int UNARY_MINUS=30;
    public static final int METHOD_CALL=27;
    public static final int T114=114;
    public static final int T132=132;
    public static final int T151=151;
    public static final int STRING_LITERAL=89;
    public static final int IMPLEMENTS_CLAUSE=19;
    public static final int LE=74;
    public static final int RPAREN=50;
    public static final int T118=118;
    public static final int STAR_ASSIGN=55;
    public static final int NUM_INT=87;
    public static final int PLUS=79;
    public static final int T117=117;
    public static final int SUPER_CTOR_CALL=38;
    public static final int LABELED_STAT=22;
    public static final int MINUS_ASSIGN=54;
    public static final int T113=113;
    public static final int INSTANCE_INIT=11;
    public static final int T109=109;
    public static final int T130=130;
    public static final int ARRAY_DECLARATOR=17;
    public static final int IDENT=43;
    public static final int DECIMAL_LITERAL=96;
    public static final int MOD_ASSIGN=57;
    public static final int T133=133;
    public static final int T120=120;
    public static final int T115=115;
    public static final int TYPECAST=23;
    public static final int WS=93;
    public static final int PARAMETERS=20;
    public static final int T142=142;
    public static final int BSR=78;
    public static final int LT=72;
    public static final int T121=121;
    public static final int SL_ASSIGN=60;
    public static final int T149=149;
    public static final int T145=145;
    public static final int T123=123;
    public static final int LAND=66;
    public static final int UNARY_PLUS=31;
    public static final int LBRACK=41;
    public static final int NUM_FLOAT=90;
    public static final int SEMI=40;
    public static final int GE=75;
    public static final int LNOT=86;
    public static final int EXTENDS_CLAUSE=18;
    public static final int T144=144;
    public static final int DIV_ASSIGN=56;
    public static final int UNICODE_CHAR=104;
    public static final int EQUAL=71;
    public static final int MODIFIERS=5;
    public static final int T154=154;
    public static final int T119=119;
    public static final int OCTAL_DIGIT=103;
    public static final int COLON=52;
    public static final int T148=148;
    public static final int SL=76;
    public static final int DIV=81;
    public static final int T136=136;
    public static final int T122=122;
    public static final int EXPONENT_PART=100;
    public static final int T135=135;
    public static final int METHOD_DEF=9;
    public static final int TYPE=13;
    public static final int ARRAY_INIT=29;
    public static final int T139=139;
    public static final int LOR=65;
    public static final int EMPTY_STAT=37;
    public static final int BNOT=85;
    public static final int INC=83;
    public static final int VARIABLE_DEF=10;
    public static final int NUM_DOUBLE=92;
    public static final int POST_DEC=26;
    public static final int T153=153;
    public static final int T107=107;
    public static final int MOD=82;
    public static final int OCTAL_LITERAL=98;
    public static final int PLUS_ASSIGN=53;
    public static final int QUESTION=64;
    public static final int HEX_LITERAL=97;
    public static final int BLOCK=4;
    public static final int T134=134;
    public static final int FLOAT_TYPE_SUFFIX=101;
    public static final int RCURLY=47;
    public static final int CTOR_DEF=8;
    public static final int T116=116;
    public static final int T127=127;
    public static final int T143=143;
    public static final int CHAR_LITERAL=88;
    public static final int BOR_ASSIGN=63;
    public static final int ASSIGN=51;
    public static final int FOR_ITERATOR=36;
    public static final int T137=137;
    public static final int LPAREN=49;
    public static final int T111=111;
    public static final int INDEX_OP=24;
    public static final int HEX_DIGIT=105;
    public static final int ML_COMMENT=95;
    public static final int CLASS_DEF=14;
    public static final int SL_COMMENT=94;
    public static final int T146=146;
    public static final int T138=138;
    public static final int BAND=69;
    public static final int T106=106;
    public static final int T112=112;
    public static final int ELIST=33;
    public static final int SLIST=7;
    public static final int NOT_EQUAL=70;
    public static final int FOR_CONDITION=35;
    public static final int BAND_ASSIGN=61;
    public static final int DIGITS=99;
    public static final int T141=141;
    public static final int PARAMETER_DEF=21;
    public static final int T110=110;
    public static final int NUM_LONG=91;
    public static final int T108=108;
    public static final int FOR_INIT=34;
    public static final int T140=140;
    public static final int BXOR_ASSIGN=62;
    public static final int GT=73;
    public static final int BSR_ASSIGN=59;
    public static final int T147=147;
    public static final int INTERFACE_DEF=15;
    public static final int T124=124;
    public static final int DEC=84;
    public static final int ESCAPE_SEQUENCE=102;
    public static final int T125=125;
    public static final int EOF=-1;
    public static final int T126=126;
    public static final int OBJBLOCK=6;
    public static final int Tokens=156;
    public static final int RBRACK=42;
    public static final int CASE_GROUP=32;
    public static final int BXOR=68;
    public static final int STAR=45;
    public static final int T128=128;
    public static final int T150=150;
    public static final int PACKAGE_DEF=16;
    public JavaParserLexer() {;} 
    public JavaParserLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return ".\\java.g"; }

    // $ANTLR start T106
    public void mT106() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T106;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:7:8: ( 'package' )
            // .\\java.g:7:8: 'package'
            {
            match("package"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T106

    // $ANTLR start T107
    public void mT107() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T107;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:8:8: ( 'import' )
            // .\\java.g:8:8: 'import'
            {
            match("import"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T107

    // $ANTLR start T108
    public void mT108() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T108;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:9:8: ( 'void' )
            // .\\java.g:9:8: 'void'
            {
            match("void"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T108

    // $ANTLR start T109
    public void mT109() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T109;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:10:8: ( 'boolean' )
            // .\\java.g:10:8: 'boolean'
            {
            match("boolean"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T109

    // $ANTLR start T110
    public void mT110() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T110;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:11:8: ( 'byte' )
            // .\\java.g:11:8: 'byte'
            {
            match("byte"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T110

    // $ANTLR start T111
    public void mT111() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T111;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:12:8: ( 'char' )
            // .\\java.g:12:8: 'char'
            {
            match("char"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T111

    // $ANTLR start T112
    public void mT112() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T112;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:13:8: ( 'short' )
            // .\\java.g:13:8: 'short'
            {
            match("short"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T112

    // $ANTLR start T113
    public void mT113() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T113;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:14:8: ( 'int' )
            // .\\java.g:14:8: 'int'
            {
            match("int"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T113

    // $ANTLR start T114
    public void mT114() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T114;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:15:8: ( 'float' )
            // .\\java.g:15:8: 'float'
            {
            match("float"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T114

    // $ANTLR start T115
    public void mT115() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T115;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:16:8: ( 'long' )
            // .\\java.g:16:8: 'long'
            {
            match("long"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T115

    // $ANTLR start T116
    public void mT116() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T116;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:17:8: ( 'double' )
            // .\\java.g:17:8: 'double'
            {
            match("double"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T116

    // $ANTLR start T117
    public void mT117() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T117;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:18:8: ( 'private' )
            // .\\java.g:18:8: 'private'
            {
            match("private"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T117

    // $ANTLR start T118
    public void mT118() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T118;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:19:8: ( 'public' )
            // .\\java.g:19:8: 'public'
            {
            match("public"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T118

    // $ANTLR start T119
    public void mT119() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T119;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:20:8: ( 'protected' )
            // .\\java.g:20:8: 'protected'
            {
            match("protected"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T119

    // $ANTLR start T120
    public void mT120() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T120;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:21:8: ( 'static' )
            // .\\java.g:21:8: 'static'
            {
            match("static"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T120

    // $ANTLR start T121
    public void mT121() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T121;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:22:8: ( 'transient' )
            // .\\java.g:22:8: 'transient'
            {
            match("transient"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T121

    // $ANTLR start T122
    public void mT122() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T122;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:23:8: ( 'final' )
            // .\\java.g:23:8: 'final'
            {
            match("final"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T122

    // $ANTLR start T123
    public void mT123() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T123;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:24:8: ( 'abstract' )
            // .\\java.g:24:8: 'abstract'
            {
            match("abstract"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T123

    // $ANTLR start T124
    public void mT124() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T124;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:25:8: ( 'native' )
            // .\\java.g:25:8: 'native'
            {
            match("native"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T124

    // $ANTLR start T125
    public void mT125() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T125;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:26:8: ( 'threadsafe' )
            // .\\java.g:26:8: 'threadsafe'
            {
            match("threadsafe"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T125

    // $ANTLR start T126
    public void mT126() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T126;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:27:8: ( 'synchronized' )
            // .\\java.g:27:8: 'synchronized'
            {
            match("synchronized"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T126

    // $ANTLR start T127
    public void mT127() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T127;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:28:8: ( 'volatile' )
            // .\\java.g:28:8: 'volatile'
            {
            match("volatile"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T127

    // $ANTLR start T128
    public void mT128() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T128;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:29:8: ( 'strictfp' )
            // .\\java.g:29:8: 'strictfp'
            {
            match("strictfp"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T128

    // $ANTLR start T129
    public void mT129() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T129;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:30:8: ( 'class' )
            // .\\java.g:30:8: 'class'
            {
            match("class"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T129

    // $ANTLR start T130
    public void mT130() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T130;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:31:8: ( 'extends' )
            // .\\java.g:31:8: 'extends'
            {
            match("extends"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T130

    // $ANTLR start T131
    public void mT131() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T131;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:32:8: ( 'interface' )
            // .\\java.g:32:8: 'interface'
            {
            match("interface"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T131

    // $ANTLR start T132
    public void mT132() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T132;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:33:8: ( 'implements' )
            // .\\java.g:33:8: 'implements'
            {
            match("implements"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T132

    // $ANTLR start T133
    public void mT133() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T133;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:34:8: ( 'this' )
            // .\\java.g:34:8: 'this'
            {
            match("this"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T133

    // $ANTLR start T134
    public void mT134() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T134;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:35:8: ( 'super' )
            // .\\java.g:35:8: 'super'
            {
            match("super"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T134

    // $ANTLR start T135
    public void mT135() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T135;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:36:8: ( 'throws' )
            // .\\java.g:36:8: 'throws'
            {
            match("throws"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T135

    // $ANTLR start T136
    public void mT136() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T136;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:37:8: ( 'if' )
            // .\\java.g:37:8: 'if'
            {
            match("if"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T136

    // $ANTLR start T137
    public void mT137() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T137;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:38:8: ( 'else' )
            // .\\java.g:38:8: 'else'
            {
            match("else"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T137

    // $ANTLR start T138
    public void mT138() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T138;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:39:8: ( 'for' )
            // .\\java.g:39:8: 'for'
            {
            match("for"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T138

    // $ANTLR start T139
    public void mT139() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T139;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:40:8: ( 'while' )
            // .\\java.g:40:8: 'while'
            {
            match("while"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T139

    // $ANTLR start T140
    public void mT140() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T140;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:41:8: ( 'do' )
            // .\\java.g:41:8: 'do'
            {
            match("do"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T140

    // $ANTLR start T141
    public void mT141() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T141;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:42:8: ( 'break' )
            // .\\java.g:42:8: 'break'
            {
            match("break"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T141

    // $ANTLR start T142
    public void mT142() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T142;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:43:8: ( 'continue' )
            // .\\java.g:43:8: 'continue'
            {
            match("continue"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T142

    // $ANTLR start T143
    public void mT143() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T143;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:44:8: ( 'return' )
            // .\\java.g:44:8: 'return'
            {
            match("return"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T143

    // $ANTLR start T144
    public void mT144() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T144;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:45:8: ( 'switch' )
            // .\\java.g:45:8: 'switch'
            {
            match("switch"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T144

    // $ANTLR start T145
    public void mT145() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T145;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:46:8: ( 'throw' )
            // .\\java.g:46:8: 'throw'
            {
            match("throw"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T145

    // $ANTLR start T146
    public void mT146() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T146;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:47:8: ( 'case' )
            // .\\java.g:47:8: 'case'
            {
            match("case"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T146

    // $ANTLR start T147
    public void mT147() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T147;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:48:8: ( 'default' )
            // .\\java.g:48:8: 'default'
            {
            match("default"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T147

    // $ANTLR start T148
    public void mT148() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T148;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:49:8: ( 'try' )
            // .\\java.g:49:8: 'try'
            {
            match("try"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T148

    // $ANTLR start T149
    public void mT149() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T149;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:50:8: ( 'finally' )
            // .\\java.g:50:8: 'finally'
            {
            match("finally"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T149

    // $ANTLR start T150
    public void mT150() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T150;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:51:8: ( 'catch' )
            // .\\java.g:51:8: 'catch'
            {
            match("catch"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T150

    // $ANTLR start T151
    public void mT151() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T151;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:52:8: ( 'instanceof' )
            // .\\java.g:52:8: 'instanceof'
            {
            match("instanceof"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T151

    // $ANTLR start T152
    public void mT152() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T152;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:53:8: ( 'true' )
            // .\\java.g:53:8: 'true'
            {
            match("true"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T152

    // $ANTLR start T153
    public void mT153() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T153;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:54:8: ( 'false' )
            // .\\java.g:54:8: 'false'
            {
            match("false"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T153

    // $ANTLR start T154
    public void mT154() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T154;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:55:8: ( 'null' )
            // .\\java.g:55:8: 'null'
            {
            match("null"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T154

    // $ANTLR start T155
    public void mT155() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T155;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:56:8: ( 'new' )
            // .\\java.g:56:8: 'new'
            {
            match("new"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T155

    // $ANTLR start QUESTION
    public void mQUESTION() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = QUESTION;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:838:13: ( '?' )
            // .\\java.g:838:13: '?'
            {
            match('?'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end QUESTION

    // $ANTLR start LPAREN
    public void mLPAREN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LPAREN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:841:12: ( '(' )
            // .\\java.g:841:12: '('
            {
            match('('); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LPAREN

    // $ANTLR start RPAREN
    public void mRPAREN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = RPAREN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:844:12: ( ')' )
            // .\\java.g:844:12: ')'
            {
            match(')'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end RPAREN

    // $ANTLR start LBRACK
    public void mLBRACK() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LBRACK;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:847:12: ( '[' )
            // .\\java.g:847:12: '['
            {
            match('['); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LBRACK

    // $ANTLR start RBRACK
    public void mRBRACK() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = RBRACK;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:850:12: ( ']' )
            // .\\java.g:850:12: ']'
            {
            match(']'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end RBRACK

    // $ANTLR start LCURLY
    public void mLCURLY() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LCURLY;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:853:12: ( '{' )
            // .\\java.g:853:12: '{'
            {
            match('{'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LCURLY

    // $ANTLR start RCURLY
    public void mRCURLY() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = RCURLY;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:856:12: ( '}' )
            // .\\java.g:856:12: '}'
            {
            match('}'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end RCURLY

    // $ANTLR start COLON
    public void mCOLON() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = COLON;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:859:11: ( ':' )
            // .\\java.g:859:11: ':'
            {
            match(':'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end COLON

    // $ANTLR start COMMA
    public void mCOMMA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = COMMA;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:862:11: ( ',' )
            // .\\java.g:862:11: ','
            {
            match(','); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end COMMA

    // $ANTLR start DOT
    public void mDOT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = DOT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:864:10: ( '.' )
            // .\\java.g:864:10: '.'
            {
            match('.'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DOT

    // $ANTLR start ASSIGN
    public void mASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:866:12: ( '=' )
            // .\\java.g:866:12: '='
            {
            match('='); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end ASSIGN

    // $ANTLR start EQUAL
    public void mEQUAL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = EQUAL;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:869:11: ( '==' )
            // .\\java.g:869:11: '=='
            {
            match("=="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end EQUAL

    // $ANTLR start LNOT
    public void mLNOT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LNOT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:872:10: ( '!' )
            // .\\java.g:872:10: '!'
            {
            match('!'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LNOT

    // $ANTLR start BNOT
    public void mBNOT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BNOT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:875:10: ( '~' )
            // .\\java.g:875:10: '~'
            {
            match('~'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BNOT

    // $ANTLR start NOT_EQUAL
    public void mNOT_EQUAL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NOT_EQUAL;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:878:14: ( '!=' )
            // .\\java.g:878:14: '!='
            {
            match("!="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NOT_EQUAL

    // $ANTLR start DIV
    public void mDIV() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = DIV;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:881:10: ( '/' )
            // .\\java.g:881:10: '/'
            {
            match('/'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DIV

    // $ANTLR start DIV_ASSIGN
    public void mDIV_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = DIV_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:884:15: ( '/=' )
            // .\\java.g:884:15: '/='
            {
            match("/="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DIV_ASSIGN

    // $ANTLR start PLUS
    public void mPLUS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = PLUS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:887:10: ( '+' )
            // .\\java.g:887:10: '+'
            {
            match('+'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end PLUS

    // $ANTLR start PLUS_ASSIGN
    public void mPLUS_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = PLUS_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:890:16: ( '+=' )
            // .\\java.g:890:16: '+='
            {
            match("+="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end PLUS_ASSIGN

    // $ANTLR start INC
    public void mINC() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = INC;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:893:10: ( '++' )
            // .\\java.g:893:10: '++'
            {
            match("++"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end INC

    // $ANTLR start MINUS
    public void mMINUS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MINUS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:896:11: ( '-' )
            // .\\java.g:896:11: '-'
            {
            match('-'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end MINUS

    // $ANTLR start MINUS_ASSIGN
    public void mMINUS_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MINUS_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:899:16: ( '-=' )
            // .\\java.g:899:16: '-='
            {
            match("-="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end MINUS_ASSIGN

    // $ANTLR start DEC
    public void mDEC() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = DEC;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:902:10: ( '--' )
            // .\\java.g:902:10: '--'
            {
            match("--"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DEC

    // $ANTLR start STAR
    public void mSTAR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = STAR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:905:10: ( '*' )
            // .\\java.g:905:10: '*'
            {
            match('*'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end STAR

    // $ANTLR start STAR_ASSIGN
    public void mSTAR_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = STAR_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:908:16: ( '*=' )
            // .\\java.g:908:16: '*='
            {
            match("*="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end STAR_ASSIGN

    // $ANTLR start MOD
    public void mMOD() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MOD;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:911:10: ( '%' )
            // .\\java.g:911:10: '%'
            {
            match('%'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end MOD

    // $ANTLR start MOD_ASSIGN
    public void mMOD_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MOD_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:914:15: ( '%=' )
            // .\\java.g:914:15: '%='
            {
            match("%="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end MOD_ASSIGN

    // $ANTLR start SR
    public void mSR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = SR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:917:9: ( '>>' )
            // .\\java.g:917:9: '>>'
            {
            match(">>"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SR

    // $ANTLR start SR_ASSIGN
    public void mSR_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = SR_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:920:14: ( '>>=' )
            // .\\java.g:920:14: '>>='
            {
            match(">>="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SR_ASSIGN

    // $ANTLR start BSR
    public void mBSR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BSR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:923:10: ( '>>>' )
            // .\\java.g:923:10: '>>>'
            {
            match(">>>"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BSR

    // $ANTLR start BSR_ASSIGN
    public void mBSR_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BSR_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:926:15: ( '>>>=' )
            // .\\java.g:926:15: '>>>='
            {
            match(">>>="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BSR_ASSIGN

    // $ANTLR start GE
    public void mGE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = GE;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:929:9: ( '>=' )
            // .\\java.g:929:9: '>='
            {
            match(">="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end GE

    // $ANTLR start GT
    public void mGT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = GT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:932:9: ( '>' )
            // .\\java.g:932:9: '>'
            {
            match('>'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end GT

    // $ANTLR start SL
    public void mSL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = SL;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:935:9: ( '<<' )
            // .\\java.g:935:9: '<<'
            {
            match("<<"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SL

    // $ANTLR start SL_ASSIGN
    public void mSL_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = SL_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:938:14: ( '<<=' )
            // .\\java.g:938:14: '<<='
            {
            match("<<="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SL_ASSIGN

    // $ANTLR start LE
    public void mLE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LE;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:941:9: ( '<=' )
            // .\\java.g:941:9: '<='
            {
            match("<="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LE

    // $ANTLR start LT
    public void mLT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:944:9: ( '<' )
            // .\\java.g:944:9: '<'
            {
            match('<'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LT

    // $ANTLR start BXOR
    public void mBXOR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BXOR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:947:10: ( '^' )
            // .\\java.g:947:10: '^'
            {
            match('^'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BXOR

    // $ANTLR start BXOR_ASSIGN
    public void mBXOR_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BXOR_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:950:16: ( '^=' )
            // .\\java.g:950:16: '^='
            {
            match("^="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BXOR_ASSIGN

    // $ANTLR start BOR
    public void mBOR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BOR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:953:10: ( '|' )
            // .\\java.g:953:10: '|'
            {
            match('|'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BOR

    // $ANTLR start BOR_ASSIGN
    public void mBOR_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BOR_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:956:15: ( '|=' )
            // .\\java.g:956:15: '|='
            {
            match("|="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BOR_ASSIGN

    // $ANTLR start LOR
    public void mLOR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LOR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:959:10: ( '||' )
            // .\\java.g:959:10: '||'
            {
            match("||"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LOR

    // $ANTLR start BAND
    public void mBAND() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BAND;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:962:10: ( '&' )
            // .\\java.g:962:10: '&'
            {
            match('&'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BAND

    // $ANTLR start BAND_ASSIGN
    public void mBAND_ASSIGN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = BAND_ASSIGN;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:965:16: ( '&=' )
            // .\\java.g:965:16: '&='
            {
            match("&="); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end BAND_ASSIGN

    // $ANTLR start LAND
    public void mLAND() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LAND;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:968:10: ( '&&' )
            // .\\java.g:968:10: '&&'
            {
            match("&&"); 

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LAND

    // $ANTLR start SEMI
    public void mSEMI() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = SEMI;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:971:10: ( ';' )
            // .\\java.g:971:10: ';'
            {
            match(';'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SEMI

    // $ANTLR start WS
    public void mWS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = WS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:977:6: ( ( ' ' | '\\t' | '\\f' | ( '\\r\\n' | '\\r' | '\\n' ) )+ )
            // .\\java.g:977:6: ( ' ' | '\\t' | '\\f' | ( '\\r\\n' | '\\r' | '\\n' ) )+
            {
            // .\\java.g:977:6: ( ' ' | '\\t' | '\\f' | ( '\\r\\n' | '\\r' | '\\n' ) )+
            int cnt2=0;
            loop2:
            do {
                int alt2=5;
                switch ( input.LA(1) ) {
                case ' ':
                    alt2=1;
                    break;
                case '\t':
                    alt2=2;
                    break;
                case '\f':
                    alt2=3;
                    break;
                case '\n':
                case '\r':
                    alt2=4;
                    break;
                
                }
            
                switch (alt2) {
            	case 1 :
            	    // .\\java.g:977:8: ' '
            	    {
            	    match(' '); 
            	    
            	    }
            	    break;
            	case 2 :
            	    // .\\java.g:978:5: '\\t'
            	    {
            	    match('\t'); 
            	    
            	    }
            	    break;
            	case 3 :
            	    // .\\java.g:979:5: '\\f'
            	    {
            	    match('\f'); 
            	    
            	    }
            	    break;
            	case 4 :
            	    // .\\java.g:981:5: ( '\\r\\n' | '\\r' | '\\n' )
            	    {
            	    // .\\java.g:981:5: ( '\\r\\n' | '\\r' | '\\n' )
            	    int alt1=3;
            	    int LA1_0 = input.LA(1);
            	    if ( (LA1_0=='\r') ) {
            	        int LA1_1 = input.LA(2);
            	        if ( (LA1_1=='\n') ) {
            	            alt1=1;
            	        }
            	        else {
            	            alt1=2;}
            	    }
            	    else if ( (LA1_0=='\n') ) {
            	        alt1=3;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("981:5: ( '\\r\\n' | '\\r' | '\\n' )", 1, 0, input);
            	    
            	        throw nvae;
            	    }
            	    switch (alt1) {
            	        case 1 :
            	            // .\\java.g:981:7: '\\r\\n'
            	            {
            	            match("\r\n"); 

            	            
            	            }
            	            break;
            	        case 2 :
            	            // .\\java.g:982:6: '\\r'
            	            {
            	            match('\r'); 
            	            
            	            }
            	            break;
            	        case 3 :
            	            // .\\java.g:983:6: '\\n'
            	            {
            	            match('\n'); 
            	            
            	            }
            	            break;
            	    
            	    }

            	    
            	    }
            	    break;
            
            	default :
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
            } while (true);

             channel=99; /*token = JavaParser.IGNORE_TOKEN;*/ 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end WS

    // $ANTLR start SL_COMMENT
    public void mSL_COMMENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = SL_COMMENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:993:4: ( '//' ( options {greedy=false; } : . )* ( '\\r' )? '\\n' )
            // .\\java.g:993:4: '//' ( options {greedy=false; } : . )* ( '\\r' )? '\\n'
            {
            match("//"); 

            // .\\java.g:993:9: ( options {greedy=false; } : . )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( (LA3_0=='\r') ) {
                    alt3=2;
                }
                else if ( (LA3_0=='\n') ) {
                    alt3=2;
                }
                else if ( ((LA3_0>='\u0000' && LA3_0<='\t')||(LA3_0>='\u000B' && LA3_0<='\f')||(LA3_0>='\u000E' && LA3_0<='\uFFFE')) ) {
                    alt3=1;
                }
                
            
                switch (alt3) {
            	case 1 :
            	    // .\\java.g:993:36: .
            	    {
            	    matchAny(); 
            	    
            	    }
            	    break;
            
            	default :
            	    break loop3;
                }
            } while (true);

            // .\\java.g:993:40: ( '\\r' )?
            int alt4=2;
            int LA4_0 = input.LA(1);
            if ( (LA4_0=='\r') ) {
                alt4=1;
            }
            switch (alt4) {
                case 1 :
                    // .\\java.g:993:41: '\\r'
                    {
                    match('\r'); 
                    
                    }
                    break;
            
            }

            match('\n'); 
            channel=99; /*token = JavaParser.IGNORE_TOKEN;*/
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SL_COMMENT

    // $ANTLR start ML_COMMENT
    public void mML_COMMENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = ML_COMMENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:1001:4: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // .\\java.g:1001:4: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // .\\java.g:1002:3: ( options {greedy=false; } : . )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( (LA5_0=='*') ) {
                    int LA5_1 = input.LA(2);
                    if ( (LA5_1=='/') ) {
                        alt5=2;
                    }
                    else if ( ((LA5_1>='\u0000' && LA5_1<='.')||(LA5_1>='0' && LA5_1<='\uFFFE')) ) {
                        alt5=1;
                    }
                    
                
                }
                else if ( ((LA5_0>='\u0000' && LA5_0<=')')||(LA5_0>='+' && LA5_0<='\uFFFE')) ) {
                    alt5=1;
                }
                
            
                switch (alt5) {
            	case 1 :
            	    // .\\java.g:1002:31: .
            	    {
            	    matchAny(); 
            	    
            	    }
            	    break;
            
            	default :
            	    break loop5;
                }
            } while (true);

            match("*/"); 

            channel=99;/*token = JavaParser.IGNORE_TOKEN;*/
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end ML_COMMENT

    // $ANTLR start IDENT
    public void mIDENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = IDENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:1008:4: ( ('a'..'z'|'A'..'Z'|'_'|'$') ( ('a'..'z'|'A'..'Z'|'_'|'0'..'9'|'$'))* )
            // .\\java.g:1008:4: ('a'..'z'|'A'..'Z'|'_'|'$') ( ('a'..'z'|'A'..'Z'|'_'|'0'..'9'|'$'))*
            {
            if ( input.LA(1)=='$'||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();
            
            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            // .\\java.g:1008:32: ( ('a'..'z'|'A'..'Z'|'_'|'0'..'9'|'$'))*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( (LA6_0=='$'||(LA6_0>='0' && LA6_0<='9')||(LA6_0>='A' && LA6_0<='Z')||LA6_0=='_'||(LA6_0>='a' && LA6_0<='z')) ) {
                    alt6=1;
                }
                
            
                switch (alt6) {
            	case 1 :
            	    // .\\java.g:1008:33: ('a'..'z'|'A'..'Z'|'_'|'0'..'9'|'$')
            	    {
            	    if ( input.LA(1)=='$'||(input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
            	        input.consume();
            	    
            	    }
            	    else {
            	        MismatchedSetException mse =
            	            new MismatchedSetException(null,input);
            	        recover(mse);    throw mse;
            	    }

            	    
            	    }
            	    break;
            
            	default :
            	    break loop6;
                }
            } while (true);

            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end IDENT

    // $ANTLR start NUM_INT
    public void mNUM_INT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NUM_INT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:1014:7: ( DECIMAL_LITERAL | HEX_LITERAL | OCTAL_LITERAL )
            int alt7=3;
            int LA7_0 = input.LA(1);
            if ( ((LA7_0>='1' && LA7_0<='9')) ) {
                alt7=1;
            }
            else if ( (LA7_0=='0') ) {
                int LA7_2 = input.LA(2);
                if ( (LA7_2=='X'||LA7_2=='x') ) {
                    alt7=2;
                }
                else {
                    alt7=3;}
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("1013:1: NUM_INT : ( DECIMAL_LITERAL | HEX_LITERAL | OCTAL_LITERAL );", 7, 0, input);
            
                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // .\\java.g:1014:7: DECIMAL_LITERAL
                    {
                    mDECIMAL_LITERAL(); 
                    
                    }
                    break;
                case 2 :
                    // .\\java.g:1015:7: HEX_LITERAL
                    {
                    mHEX_LITERAL(); 
                    
                    }
                    break;
                case 3 :
                    // .\\java.g:1016:7: OCTAL_LITERAL
                    {
                    mOCTAL_LITERAL(); 
                    
                    }
                    break;
            
            }
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NUM_INT

    // $ANTLR start DECIMAL_LITERAL
    public void mDECIMAL_LITERAL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1020:18: ( '1' .. '9' ( '0' .. '9' )* ( ('l'|'L'))? )
            // .\\java.g:1020:18: '1' .. '9' ( '0' .. '9' )* ( ('l'|'L'))?
            {
            matchRange('1','9'); 
            // .\\java.g:1020:27: ( '0' .. '9' )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);
                if ( ((LA8_0>='0' && LA8_0<='9')) ) {
                    alt8=1;
                }
                
            
                switch (alt8) {
            	case 1 :
            	    // .\\java.g:1020:28: '0' .. '9'
            	    {
            	    matchRange('0','9'); 
            	    
            	    }
            	    break;
            
            	default :
            	    break loop8;
                }
            } while (true);

            // .\\java.g:1020:39: ( ('l'|'L'))?
            int alt9=2;
            int LA9_0 = input.LA(1);
            if ( (LA9_0=='L'||LA9_0=='l') ) {
                alt9=1;
            }
            switch (alt9) {
                case 1 :
                    // .\\java.g:1020:40: ('l'|'L')
                    {
                    if ( input.LA(1)=='L'||input.LA(1)=='l' ) {
                        input.consume();
                    
                    }
                    else {
                        MismatchedSetException mse =
                            new MismatchedSetException(null,input);
                        recover(mse);    throw mse;
                    }

                    
                    }
                    break;
            
            }

            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DECIMAL_LITERAL

    // $ANTLR start HEX_LITERAL
    public void mHEX_LITERAL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1023:14: ( '0' ('x'|'X') ( ('0'..'9'|'a'..'f'|'A'..'F'))+ ( ('l'|'L'))? )
            // .\\java.g:1023:14: '0' ('x'|'X') ( ('0'..'9'|'a'..'f'|'A'..'F'))+ ( ('l'|'L'))?
            {
            match('0'); 
            if ( input.LA(1)=='X'||input.LA(1)=='x' ) {
                input.consume();
            
            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            // .\\java.g:1023:28: ( ('0'..'9'|'a'..'f'|'A'..'F'))+
            int cnt10=0;
            loop10:
            do {
                int alt10=2;
                int LA10_0 = input.LA(1);
                if ( ((LA10_0>='0' && LA10_0<='9')||(LA10_0>='A' && LA10_0<='F')||(LA10_0>='a' && LA10_0<='f')) ) {
                    alt10=1;
                }
                
            
                switch (alt10) {
            	case 1 :
            	    // .\\java.g:1023:29: ('0'..'9'|'a'..'f'|'A'..'F')
            	    {
            	    if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='F')||(input.LA(1)>='a' && input.LA(1)<='f') ) {
            	        input.consume();
            	    
            	    }
            	    else {
            	        MismatchedSetException mse =
            	            new MismatchedSetException(null,input);
            	        recover(mse);    throw mse;
            	    }

            	    
            	    }
            	    break;
            
            	default :
            	    if ( cnt10 >= 1 ) break loop10;
                        EarlyExitException eee =
                            new EarlyExitException(10, input);
                        throw eee;
                }
                cnt10++;
            } while (true);

            // .\\java.g:1023:58: ( ('l'|'L'))?
            int alt11=2;
            int LA11_0 = input.LA(1);
            if ( (LA11_0=='L'||LA11_0=='l') ) {
                alt11=1;
            }
            switch (alt11) {
                case 1 :
                    // .\\java.g:1023:59: ('l'|'L')
                    {
                    if ( input.LA(1)=='L'||input.LA(1)=='l' ) {
                        input.consume();
                    
                    }
                    else {
                        MismatchedSetException mse =
                            new MismatchedSetException(null,input);
                        recover(mse);    throw mse;
                    }

                    
                    }
                    break;
            
            }

            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end HEX_LITERAL

    // $ANTLR start OCTAL_LITERAL
    public void mOCTAL_LITERAL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1026:16: ( '0' ( '0' .. '7' )* ( ('l'|'L'))? )
            // .\\java.g:1026:16: '0' ( '0' .. '7' )* ( ('l'|'L'))?
            {
            match('0'); 
            // .\\java.g:1026:20: ( '0' .. '7' )*
            loop12:
            do {
                int alt12=2;
                int LA12_0 = input.LA(1);
                if ( ((LA12_0>='0' && LA12_0<='7')) ) {
                    alt12=1;
                }
                
            
                switch (alt12) {
            	case 1 :
            	    // .\\java.g:1026:21: '0' .. '7'
            	    {
            	    matchRange('0','7'); 
            	    
            	    }
            	    break;
            
            	default :
            	    break loop12;
                }
            } while (true);

            // .\\java.g:1026:32: ( ('l'|'L'))?
            int alt13=2;
            int LA13_0 = input.LA(1);
            if ( (LA13_0=='L'||LA13_0=='l') ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // .\\java.g:1026:33: ('l'|'L')
                    {
                    if ( input.LA(1)=='L'||input.LA(1)=='l' ) {
                        input.consume();
                    
                    }
                    else {
                        MismatchedSetException mse =
                            new MismatchedSetException(null,input);
                        recover(mse);    throw mse;
                    }

                    
                    }
                    break;
            
            }

            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end OCTAL_LITERAL

    // $ANTLR start NUM_FLOAT
    public void mNUM_FLOAT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NUM_FLOAT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:1029:11: ( DIGITS '.' ( DIGITS )? ( EXPONENT_PART )? ( FLOAT_TYPE_SUFFIX )? | '.' DIGITS ( EXPONENT_PART )? ( FLOAT_TYPE_SUFFIX )? | DIGITS EXPONENT_PART FLOAT_TYPE_SUFFIX | DIGITS EXPONENT_PART | DIGITS FLOAT_TYPE_SUFFIX )
            int alt19=5;
            alt19 = dfa19.predict(input);
            switch (alt19) {
                case 1 :
                    // .\\java.g:1029:11: DIGITS '.' ( DIGITS )? ( EXPONENT_PART )? ( FLOAT_TYPE_SUFFIX )?
                    {
                    mDIGITS(); 
                    match('.'); 
                    // .\\java.g:1029:22: ( DIGITS )?
                    int alt14=2;
                    int LA14_0 = input.LA(1);
                    if ( ((LA14_0>='0' && LA14_0<='9')) ) {
                        alt14=1;
                    }
                    switch (alt14) {
                        case 1 :
                            // .\\java.g:1029:23: DIGITS
                            {
                            mDIGITS(); 
                            
                            }
                            break;
                    
                    }

                    // .\\java.g:1029:32: ( EXPONENT_PART )?
                    int alt15=2;
                    int LA15_0 = input.LA(1);
                    if ( (LA15_0=='E'||LA15_0=='e') ) {
                        alt15=1;
                    }
                    switch (alt15) {
                        case 1 :
                            // .\\java.g:1029:33: EXPONENT_PART
                            {
                            mEXPONENT_PART(); 
                            
                            }
                            break;
                    
                    }

                    // .\\java.g:1029:49: ( FLOAT_TYPE_SUFFIX )?
                    int alt16=2;
                    int LA16_0 = input.LA(1);
                    if ( (LA16_0=='D'||LA16_0=='F'||LA16_0=='d'||LA16_0=='f') ) {
                        alt16=1;
                    }
                    switch (alt16) {
                        case 1 :
                            // .\\java.g:1029:50: FLOAT_TYPE_SUFFIX
                            {
                            mFLOAT_TYPE_SUFFIX(); 
                            
                            }
                            break;
                    
                    }

                    
                    }
                    break;
                case 2 :
                    // .\\java.g:1030:7: '.' DIGITS ( EXPONENT_PART )? ( FLOAT_TYPE_SUFFIX )?
                    {
                    match('.'); 
                    mDIGITS(); 
                    // .\\java.g:1030:18: ( EXPONENT_PART )?
                    int alt17=2;
                    int LA17_0 = input.LA(1);
                    if ( (LA17_0=='E'||LA17_0=='e') ) {
                        alt17=1;
                    }
                    switch (alt17) {
                        case 1 :
                            // .\\java.g:1030:19: EXPONENT_PART
                            {
                            mEXPONENT_PART(); 
                            
                            }
                            break;
                    
                    }

                    // .\\java.g:1030:35: ( FLOAT_TYPE_SUFFIX )?
                    int alt18=2;
                    int LA18_0 = input.LA(1);
                    if ( (LA18_0=='D'||LA18_0=='F'||LA18_0=='d'||LA18_0=='f') ) {
                        alt18=1;
                    }
                    switch (alt18) {
                        case 1 :
                            // .\\java.g:1030:36: FLOAT_TYPE_SUFFIX
                            {
                            mFLOAT_TYPE_SUFFIX(); 
                            
                            }
                            break;
                    
                    }

                    
                    }
                    break;
                case 3 :
                    // .\\java.g:1031:11: DIGITS EXPONENT_PART FLOAT_TYPE_SUFFIX
                    {
                    mDIGITS(); 
                    mEXPONENT_PART(); 
                    mFLOAT_TYPE_SUFFIX(); 
                    
                    }
                    break;
                case 4 :
                    // .\\java.g:1032:11: DIGITS EXPONENT_PART
                    {
                    mDIGITS(); 
                    mEXPONENT_PART(); 
                    
                    }
                    break;
                case 5 :
                    // .\\java.g:1033:11: DIGITS FLOAT_TYPE_SUFFIX
                    {
                    mDIGITS(); 
                    mFLOAT_TYPE_SUFFIX(); 
                    
                    }
                    break;
            
            }
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NUM_FLOAT

    // $ANTLR start DIGITS
    public void mDIGITS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1037:10: ( ( '0' .. '9' )+ )
            // .\\java.g:1037:10: ( '0' .. '9' )+
            {
            // .\\java.g:1037:10: ( '0' .. '9' )+
            int cnt20=0;
            loop20:
            do {
                int alt20=2;
                int LA20_0 = input.LA(1);
                if ( ((LA20_0>='0' && LA20_0<='9')) ) {
                    alt20=1;
                }
                
            
                switch (alt20) {
            	case 1 :
            	    // .\\java.g:1037:11: '0' .. '9'
            	    {
            	    matchRange('0','9'); 
            	    
            	    }
            	    break;
            
            	default :
            	    if ( cnt20 >= 1 ) break loop20;
                        EarlyExitException eee =
                            new EarlyExitException(20, input);
                        throw eee;
                }
                cnt20++;
            } while (true);

            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DIGITS

    // $ANTLR start EXPONENT_PART
    public void mEXPONENT_PART() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1045:16: ( ('e'|'E') ( ('+'|'-'))? DIGITS )
            // .\\java.g:1045:16: ('e'|'E') ( ('+'|'-'))? DIGITS
            {
            if ( input.LA(1)=='E'||input.LA(1)=='e' ) {
                input.consume();
            
            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            // .\\java.g:1045:26: ( ('+'|'-'))?
            int alt21=2;
            int LA21_0 = input.LA(1);
            if ( (LA21_0=='+'||LA21_0=='-') ) {
                alt21=1;
            }
            switch (alt21) {
                case 1 :
                    // .\\java.g:1045:27: ('+'|'-')
                    {
                    if ( input.LA(1)=='+'||input.LA(1)=='-' ) {
                        input.consume();
                    
                    }
                    else {
                        MismatchedSetException mse =
                            new MismatchedSetException(null,input);
                        recover(mse);    throw mse;
                    }

                    
                    }
                    break;
            
            }

            mDIGITS(); 
            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end EXPONENT_PART

    // $ANTLR start FLOAT_TYPE_SUFFIX
    public void mFLOAT_TYPE_SUFFIX() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1048:23: ( ('f'|'F'|'d'|'D'))
            // .\\java.g:1048:23: ('f'|'F'|'d'|'D')
            {
            if ( input.LA(1)=='D'||input.LA(1)=='F'||input.LA(1)=='d'||input.LA(1)=='f' ) {
                input.consume();
            
            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end FLOAT_TYPE_SUFFIX

    // $ANTLR start CHAR_LITERAL
    public void mCHAR_LITERAL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = CHAR_LITERAL;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:1052:7: ( '\\'' (~ ('\\''|'\\\\') | ESCAPE_SEQUENCE ) '\\'' )
            // .\\java.g:1052:7: '\\'' (~ ('\\''|'\\\\') | ESCAPE_SEQUENCE ) '\\''
            {
            match('\''); 
            // .\\java.g:1053:7: (~ ('\\''|'\\\\') | ESCAPE_SEQUENCE )
            int alt22=2;
            int LA22_0 = input.LA(1);
            if ( ((LA22_0>='\u0000' && LA22_0<='&')||(LA22_0>='(' && LA22_0<='[')||(LA22_0>=']' && LA22_0<='\uFFFE')) ) {
                alt22=1;
            }
            else if ( (LA22_0=='\\') ) {
                alt22=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("1053:7: (~ ('\\''|'\\\\') | ESCAPE_SEQUENCE )", 22, 0, input);
            
                throw nvae;
            }
            switch (alt22) {
                case 1 :
                    // .\\java.g:1053:9: ~ ('\\''|'\\\\')
                    {
                    if ( (input.LA(1)>='\u0000' && input.LA(1)<='&')||(input.LA(1)>='(' && input.LA(1)<='[')||(input.LA(1)>=']' && input.LA(1)<='\uFFFE') ) {
                        input.consume();
                    
                    }
                    else {
                        MismatchedSetException mse =
                            new MismatchedSetException(null,input);
                        recover(mse);    throw mse;
                    }

                    
                    }
                    break;
                case 2 :
                    // .\\java.g:1054:9: ESCAPE_SEQUENCE
                    {
                    mESCAPE_SEQUENCE(); 
                    
                    }
                    break;
            
            }

            match('\''); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end CHAR_LITERAL

    // $ANTLR start STRING_LITERAL
    public void mSTRING_LITERAL() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = STRING_LITERAL;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // .\\java.g:1061:7: ( '\\\"' (~ ('\\\"'|'\\\\') | ESCAPE_SEQUENCE )* '\\\"' )
            // .\\java.g:1061:7: '\\\"' (~ ('\\\"'|'\\\\') | ESCAPE_SEQUENCE )* '\\\"'
            {
            match('\"'); 
            // .\\java.g:1062:7: (~ ('\\\"'|'\\\\') | ESCAPE_SEQUENCE )*
            loop23:
            do {
                int alt23=3;
                int LA23_0 = input.LA(1);
                if ( ((LA23_0>='\u0000' && LA23_0<='!')||(LA23_0>='#' && LA23_0<='[')||(LA23_0>=']' && LA23_0<='\uFFFE')) ) {
                    alt23=1;
                }
                else if ( (LA23_0=='\\') ) {
                    alt23=2;
                }
                
            
                switch (alt23) {
            	case 1 :
            	    // .\\java.g:1062:9: ~ ('\\\"'|'\\\\')
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='!')||(input.LA(1)>='#' && input.LA(1)<='[')||(input.LA(1)>=']' && input.LA(1)<='\uFFFE') ) {
            	        input.consume();
            	    
            	    }
            	    else {
            	        MismatchedSetException mse =
            	            new MismatchedSetException(null,input);
            	        recover(mse);    throw mse;
            	    }

            	    
            	    }
            	    break;
            	case 2 :
            	    // .\\java.g:1063:9: ESCAPE_SEQUENCE
            	    {
            	    mESCAPE_SEQUENCE(); 
            	    
            	    }
            	    break;
            
            	default :
            	    break loop23;
                }
            } while (true);

            match('\"'); 
            
            }
    
    
            
                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }
            
                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end STRING_LITERAL

    // $ANTLR start ESCAPE_SEQUENCE
    public void mESCAPE_SEQUENCE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1070:7: ( '\\\\' 'b' | '\\\\' 't' | '\\\\' 'n' | '\\\\' 'f' | '\\\\' 'r' | '\\\\' '\\\"' | '\\\\' '\\'' | '\\\\' '\\\\' | '\\\\' '0' .. '3' OCTAL_DIGIT OCTAL_DIGIT | '\\\\' OCTAL_DIGIT OCTAL_DIGIT | '\\\\' OCTAL_DIGIT | UNICODE_CHAR )
            int alt24=12;
            int LA24_0 = input.LA(1);
            if ( (LA24_0=='\\') ) {
                switch ( input.LA(2) ) {
                case 'b':
                    alt24=1;
                    break;
                case 't':
                    alt24=2;
                    break;
                case 'n':
                    alt24=3;
                    break;
                case 'u':
                    alt24=12;
                    break;
                case '\"':
                    alt24=6;
                    break;
                case '0':
                case '1':
                case '2':
                case '3':
                    int LA24_7 = input.LA(3);
                    if ( ((LA24_7>='0' && LA24_7<='7')) ) {
                        int LA24_14 = input.LA(4);
                        if ( ((LA24_14>='0' && LA24_14<='7')) ) {
                            alt24=9;
                        }
                        else {
                            alt24=10;}
                    }
                    else {
                        alt24=11;}
                    break;
                case '\\':
                    alt24=8;
                    break;
                case 'r':
                    alt24=5;
                    break;
                case '\'':
                    alt24=7;
                    break;
                case 'f':
                    alt24=4;
                    break;
                case '4':
                case '5':
                case '6':
                case '7':
                    int LA24_12 = input.LA(3);
                    if ( ((LA24_12>='0' && LA24_12<='7')) ) {
                        alt24=10;
                    }
                    else {
                        alt24=11;}
                    break;
                default:
                    NoViableAltException nvae =
                        new NoViableAltException("1068:1: fragment ESCAPE_SEQUENCE : ( '\\\\' 'b' | '\\\\' 't' | '\\\\' 'n' | '\\\\' 'f' | '\\\\' 'r' | '\\\\' '\\\"' | '\\\\' '\\'' | '\\\\' '\\\\' | '\\\\' '0' .. '3' OCTAL_DIGIT OCTAL_DIGIT | '\\\\' OCTAL_DIGIT OCTAL_DIGIT | '\\\\' OCTAL_DIGIT | UNICODE_CHAR );", 24, 1, input);
                
                    throw nvae;
                }
            
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("1068:1: fragment ESCAPE_SEQUENCE : ( '\\\\' 'b' | '\\\\' 't' | '\\\\' 'n' | '\\\\' 'f' | '\\\\' 'r' | '\\\\' '\\\"' | '\\\\' '\\'' | '\\\\' '\\\\' | '\\\\' '0' .. '3' OCTAL_DIGIT OCTAL_DIGIT | '\\\\' OCTAL_DIGIT OCTAL_DIGIT | '\\\\' OCTAL_DIGIT | UNICODE_CHAR );", 24, 0, input);
            
                throw nvae;
            }
            switch (alt24) {
                case 1 :
                    // .\\java.g:1070:7: '\\\\' 'b'
                    {
                    match('\\'); 
                    match('b'); 
                    
                    }
                    break;
                case 2 :
                    // .\\java.g:1071:9: '\\\\' 't'
                    {
                    match('\\'); 
                    match('t'); 
                    
                    }
                    break;
                case 3 :
                    // .\\java.g:1072:9: '\\\\' 'n'
                    {
                    match('\\'); 
                    match('n'); 
                    
                    }
                    break;
                case 4 :
                    // .\\java.g:1073:9: '\\\\' 'f'
                    {
                    match('\\'); 
                    match('f'); 
                    
                    }
                    break;
                case 5 :
                    // .\\java.g:1074:9: '\\\\' 'r'
                    {
                    match('\\'); 
                    match('r'); 
                    
                    }
                    break;
                case 6 :
                    // .\\java.g:1075:9: '\\\\' '\\\"'
                    {
                    match('\\'); 
                    match('\"'); 
                    
                    }
                    break;
                case 7 :
                    // .\\java.g:1076:9: '\\\\' '\\''
                    {
                    match('\\'); 
                    match('\''); 
                    
                    }
                    break;
                case 8 :
                    // .\\java.g:1077:9: '\\\\' '\\\\'
                    {
                    match('\\'); 
                    match('\\'); 
                    
                    }
                    break;
                case 9 :
                    // .\\java.g:1078:7: '\\\\' '0' .. '3' OCTAL_DIGIT OCTAL_DIGIT
                    {
                    match('\\'); 
                    matchRange('0','3'); 
                    mOCTAL_DIGIT(); 
                    mOCTAL_DIGIT(); 
                    
                    }
                    break;
                case 10 :
                    // .\\java.g:1079:9: '\\\\' OCTAL_DIGIT OCTAL_DIGIT
                    {
                    match('\\'); 
                    mOCTAL_DIGIT(); 
                    mOCTAL_DIGIT(); 
                    
                    }
                    break;
                case 11 :
                    // .\\java.g:1080:9: '\\\\' OCTAL_DIGIT
                    {
                    match('\\'); 
                    mOCTAL_DIGIT(); 
                    
                    }
                    break;
                case 12 :
                    // .\\java.g:1081:4: UNICODE_CHAR
                    {
                    mUNICODE_CHAR(); 
                    
                    }
                    break;
            
            }
        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end ESCAPE_SEQUENCE

    // $ANTLR start UNICODE_CHAR
    public void mUNICODE_CHAR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1086:4: ( '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT )
            // .\\java.g:1086:4: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
            {
            match('\\'); 
            match('u'); 
            mHEX_DIGIT(); 
            mHEX_DIGIT(); 
            mHEX_DIGIT(); 
            mHEX_DIGIT(); 
            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end UNICODE_CHAR

    // $ANTLR start HEX_DIGIT
    public void mHEX_DIGIT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1091:2: ( ('0'..'9'|'a'..'f'|'A'..'F'))
            // .\\java.g:1091:4: ('0'..'9'|'a'..'f'|'A'..'F')
            {
            if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='F')||(input.LA(1)>='a' && input.LA(1)<='f') ) {
                input.consume();
            
            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end HEX_DIGIT

    // $ANTLR start OCTAL_DIGIT
    public void mOCTAL_DIGIT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // .\\java.g:1096:4: ( '0' .. '7' )
            // .\\java.g:1096:4: '0' .. '7'
            {
            matchRange('0','7'); 
            
            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end OCTAL_DIGIT

    public void mTokens() throws RecognitionException {
        // .\\java.g:1:10: ( T106 | T107 | T108 | T109 | T110 | T111 | T112 | T113 | T114 | T115 | T116 | T117 | T118 | T119 | T120 | T121 | T122 | T123 | T124 | T125 | T126 | T127 | T128 | T129 | T130 | T131 | T132 | T133 | T134 | T135 | T136 | T137 | T138 | T139 | T140 | T141 | T142 | T143 | T144 | T145 | T146 | T147 | T148 | T149 | T150 | T151 | T152 | T153 | T154 | T155 | QUESTION | LPAREN | RPAREN | LBRACK | RBRACK | LCURLY | RCURLY | COLON | COMMA | DOT | ASSIGN | EQUAL | LNOT | BNOT | NOT_EQUAL | DIV | DIV_ASSIGN | PLUS | PLUS_ASSIGN | INC | MINUS | MINUS_ASSIGN | DEC | STAR | STAR_ASSIGN | MOD | MOD_ASSIGN | SR | SR_ASSIGN | BSR | BSR_ASSIGN | GE | GT | SL | SL_ASSIGN | LE | LT | BXOR | BXOR_ASSIGN | BOR | BOR_ASSIGN | LOR | BAND | BAND_ASSIGN | LAND | SEMI | WS | SL_COMMENT | ML_COMMENT | IDENT | NUM_INT | NUM_FLOAT | CHAR_LITERAL | STRING_LITERAL )
        int alt25=104;
        alt25 = dfa25.predict(input);
        switch (alt25) {
            case 1 :
                // .\\java.g:1:10: T106
                {
                mT106(); 
                
                }
                break;
            case 2 :
                // .\\java.g:1:15: T107
                {
                mT107(); 
                
                }
                break;
            case 3 :
                // .\\java.g:1:20: T108
                {
                mT108(); 
                
                }
                break;
            case 4 :
                // .\\java.g:1:25: T109
                {
                mT109(); 
                
                }
                break;
            case 5 :
                // .\\java.g:1:30: T110
                {
                mT110(); 
                
                }
                break;
            case 6 :
                // .\\java.g:1:35: T111
                {
                mT111(); 
                
                }
                break;
            case 7 :
                // .\\java.g:1:40: T112
                {
                mT112(); 
                
                }
                break;
            case 8 :
                // .\\java.g:1:45: T113
                {
                mT113(); 
                
                }
                break;
            case 9 :
                // .\\java.g:1:50: T114
                {
                mT114(); 
                
                }
                break;
            case 10 :
                // .\\java.g:1:55: T115
                {
                mT115(); 
                
                }
                break;
            case 11 :
                // .\\java.g:1:60: T116
                {
                mT116(); 
                
                }
                break;
            case 12 :
                // .\\java.g:1:65: T117
                {
                mT117(); 
                
                }
                break;
            case 13 :
                // .\\java.g:1:70: T118
                {
                mT118(); 
                
                }
                break;
            case 14 :
                // .\\java.g:1:75: T119
                {
                mT119(); 
                
                }
                break;
            case 15 :
                // .\\java.g:1:80: T120
                {
                mT120(); 
                
                }
                break;
            case 16 :
                // .\\java.g:1:85: T121
                {
                mT121(); 
                
                }
                break;
            case 17 :
                // .\\java.g:1:90: T122
                {
                mT122(); 
                
                }
                break;
            case 18 :
                // .\\java.g:1:95: T123
                {
                mT123(); 
                
                }
                break;
            case 19 :
                // .\\java.g:1:100: T124
                {
                mT124(); 
                
                }
                break;
            case 20 :
                // .\\java.g:1:105: T125
                {
                mT125(); 
                
                }
                break;
            case 21 :
                // .\\java.g:1:110: T126
                {
                mT126(); 
                
                }
                break;
            case 22 :
                // .\\java.g:1:115: T127
                {
                mT127(); 
                
                }
                break;
            case 23 :
                // .\\java.g:1:120: T128
                {
                mT128(); 
                
                }
                break;
            case 24 :
                // .\\java.g:1:125: T129
                {
                mT129(); 
                
                }
                break;
            case 25 :
                // .\\java.g:1:130: T130
                {
                mT130(); 
                
                }
                break;
            case 26 :
                // .\\java.g:1:135: T131
                {
                mT131(); 
                
                }
                break;
            case 27 :
                // .\\java.g:1:140: T132
                {
                mT132(); 
                
                }
                break;
            case 28 :
                // .\\java.g:1:145: T133
                {
                mT133(); 
                
                }
                break;
            case 29 :
                // .\\java.g:1:150: T134
                {
                mT134(); 
                
                }
                break;
            case 30 :
                // .\\java.g:1:155: T135
                {
                mT135(); 
                
                }
                break;
            case 31 :
                // .\\java.g:1:160: T136
                {
                mT136(); 
                
                }
                break;
            case 32 :
                // .\\java.g:1:165: T137
                {
                mT137(); 
                
                }
                break;
            case 33 :
                // .\\java.g:1:170: T138
                {
                mT138(); 
                
                }
                break;
            case 34 :
                // .\\java.g:1:175: T139
                {
                mT139(); 
                
                }
                break;
            case 35 :
                // .\\java.g:1:180: T140
                {
                mT140(); 
                
                }
                break;
            case 36 :
                // .\\java.g:1:185: T141
                {
                mT141(); 
                
                }
                break;
            case 37 :
                // .\\java.g:1:190: T142
                {
                mT142(); 
                
                }
                break;
            case 38 :
                // .\\java.g:1:195: T143
                {
                mT143(); 
                
                }
                break;
            case 39 :
                // .\\java.g:1:200: T144
                {
                mT144(); 
                
                }
                break;
            case 40 :
                // .\\java.g:1:205: T145
                {
                mT145(); 
                
                }
                break;
            case 41 :
                // .\\java.g:1:210: T146
                {
                mT146(); 
                
                }
                break;
            case 42 :
                // .\\java.g:1:215: T147
                {
                mT147(); 
                
                }
                break;
            case 43 :
                // .\\java.g:1:220: T148
                {
                mT148(); 
                
                }
                break;
            case 44 :
                // .\\java.g:1:225: T149
                {
                mT149(); 
                
                }
                break;
            case 45 :
                // .\\java.g:1:230: T150
                {
                mT150(); 
                
                }
                break;
            case 46 :
                // .\\java.g:1:235: T151
                {
                mT151(); 
                
                }
                break;
            case 47 :
                // .\\java.g:1:240: T152
                {
                mT152(); 
                
                }
                break;
            case 48 :
                // .\\java.g:1:245: T153
                {
                mT153(); 
                
                }
                break;
            case 49 :
                // .\\java.g:1:250: T154
                {
                mT154(); 
                
                }
                break;
            case 50 :
                // .\\java.g:1:255: T155
                {
                mT155(); 
                
                }
                break;
            case 51 :
                // .\\java.g:1:260: QUESTION
                {
                mQUESTION(); 
                
                }
                break;
            case 52 :
                // .\\java.g:1:269: LPAREN
                {
                mLPAREN(); 
                
                }
                break;
            case 53 :
                // .\\java.g:1:276: RPAREN
                {
                mRPAREN(); 
                
                }
                break;
            case 54 :
                // .\\java.g:1:283: LBRACK
                {
                mLBRACK(); 
                
                }
                break;
            case 55 :
                // .\\java.g:1:290: RBRACK
                {
                mRBRACK(); 
                
                }
                break;
            case 56 :
                // .\\java.g:1:297: LCURLY
                {
                mLCURLY(); 
                
                }
                break;
            case 57 :
                // .\\java.g:1:304: RCURLY
                {
                mRCURLY(); 
                
                }
                break;
            case 58 :
                // .\\java.g:1:311: COLON
                {
                mCOLON(); 
                
                }
                break;
            case 59 :
                // .\\java.g:1:317: COMMA
                {
                mCOMMA(); 
                
                }
                break;
            case 60 :
                // .\\java.g:1:323: DOT
                {
                mDOT(); 
                
                }
                break;
            case 61 :
                // .\\java.g:1:327: ASSIGN
                {
                mASSIGN(); 
                
                }
                break;
            case 62 :
                // .\\java.g:1:334: EQUAL
                {
                mEQUAL(); 
                
                }
                break;
            case 63 :
                // .\\java.g:1:340: LNOT
                {
                mLNOT(); 
                
                }
                break;
            case 64 :
                // .\\java.g:1:345: BNOT
                {
                mBNOT(); 
                
                }
                break;
            case 65 :
                // .\\java.g:1:350: NOT_EQUAL
                {
                mNOT_EQUAL(); 
                
                }
                break;
            case 66 :
                // .\\java.g:1:360: DIV
                {
                mDIV(); 
                
                }
                break;
            case 67 :
                // .\\java.g:1:364: DIV_ASSIGN
                {
                mDIV_ASSIGN(); 
                
                }
                break;
            case 68 :
                // .\\java.g:1:375: PLUS
                {
                mPLUS(); 
                
                }
                break;
            case 69 :
                // .\\java.g:1:380: PLUS_ASSIGN
                {
                mPLUS_ASSIGN(); 
                
                }
                break;
            case 70 :
                // .\\java.g:1:392: INC
                {
                mINC(); 
                
                }
                break;
            case 71 :
                // .\\java.g:1:396: MINUS
                {
                mMINUS(); 
                
                }
                break;
            case 72 :
                // .\\java.g:1:402: MINUS_ASSIGN
                {
                mMINUS_ASSIGN(); 
                
                }
                break;
            case 73 :
                // .\\java.g:1:415: DEC
                {
                mDEC(); 
                
                }
                break;
            case 74 :
                // .\\java.g:1:419: STAR
                {
                mSTAR(); 
                
                }
                break;
            case 75 :
                // .\\java.g:1:424: STAR_ASSIGN
                {
                mSTAR_ASSIGN(); 
                
                }
                break;
            case 76 :
                // .\\java.g:1:436: MOD
                {
                mMOD(); 
                
                }
                break;
            case 77 :
                // .\\java.g:1:440: MOD_ASSIGN
                {
                mMOD_ASSIGN(); 
                
                }
                break;
            case 78 :
                // .\\java.g:1:451: SR
                {
                mSR(); 
                
                }
                break;
            case 79 :
                // .\\java.g:1:454: SR_ASSIGN
                {
                mSR_ASSIGN(); 
                
                }
                break;
            case 80 :
                // .\\java.g:1:464: BSR
                {
                mBSR(); 
                
                }
                break;
            case 81 :
                // .\\java.g:1:468: BSR_ASSIGN
                {
                mBSR_ASSIGN(); 
                
                }
                break;
            case 82 :
                // .\\java.g:1:479: GE
                {
                mGE(); 
                
                }
                break;
            case 83 :
                // .\\java.g:1:482: GT
                {
                mGT(); 
                
                }
                break;
            case 84 :
                // .\\java.g:1:485: SL
                {
                mSL(); 
                
                }
                break;
            case 85 :
                // .\\java.g:1:488: SL_ASSIGN
                {
                mSL_ASSIGN(); 
                
                }
                break;
            case 86 :
                // .\\java.g:1:498: LE
                {
                mLE(); 
                
                }
                break;
            case 87 :
                // .\\java.g:1:501: LT
                {
                mLT(); 
                
                }
                break;
            case 88 :
                // .\\java.g:1:504: BXOR
                {
                mBXOR(); 
                
                }
                break;
            case 89 :
                // .\\java.g:1:509: BXOR_ASSIGN
                {
                mBXOR_ASSIGN(); 
                
                }
                break;
            case 90 :
                // .\\java.g:1:521: BOR
                {
                mBOR(); 
                
                }
                break;
            case 91 :
                // .\\java.g:1:525: BOR_ASSIGN
                {
                mBOR_ASSIGN(); 
                
                }
                break;
            case 92 :
                // .\\java.g:1:536: LOR
                {
                mLOR(); 
                
                }
                break;
            case 93 :
                // .\\java.g:1:540: BAND
                {
                mBAND(); 
                
                }
                break;
            case 94 :
                // .\\java.g:1:545: BAND_ASSIGN
                {
                mBAND_ASSIGN(); 
                
                }
                break;
            case 95 :
                // .\\java.g:1:557: LAND
                {
                mLAND(); 
                
                }
                break;
            case 96 :
                // .\\java.g:1:562: SEMI
                {
                mSEMI(); 
                
                }
                break;
            case 97 :
                // .\\java.g:1:567: WS
                {
                mWS(); 
                
                }
                break;
            case 98 :
                // .\\java.g:1:570: SL_COMMENT
                {
                mSL_COMMENT(); 
                
                }
                break;
            case 99 :
                // .\\java.g:1:581: ML_COMMENT
                {
                mML_COMMENT(); 
                
                }
                break;
            case 100 :
                // .\\java.g:1:592: IDENT
                {
                mIDENT(); 
                
                }
                break;
            case 101 :
                // .\\java.g:1:598: NUM_INT
                {
                mNUM_INT(); 
                
                }
                break;
            case 102 :
                // .\\java.g:1:606: NUM_FLOAT
                {
                mNUM_FLOAT(); 
                
                }
                break;
            case 103 :
                // .\\java.g:1:616: CHAR_LITERAL
                {
                mCHAR_LITERAL(); 
                
                }
                break;
            case 104 :
                // .\\java.g:1:629: STRING_LITERAL
                {
                mSTRING_LITERAL(); 
                
                }
                break;
        
        }
    
    }


    protected DFA19 dfa19 = new DFA19(this);
    protected DFA25 dfa25 = new DFA25(this);
    public static final String DFA19_eotS =
        "\7\uffff\1\10\2\uffff";
    public static final String DFA19_eofS =
        "\12\uffff";
    public static final String DFA19_minS =
        "\2\56\2\uffff\1\53\1\uffff\2\60\2\uffff";
    public static final String DFA19_maxS =
        "\1\71\1\146\2\uffff\1\71\1\uffff\1\71\1\146\2\uffff";
    public static final String DFA19_acceptS =
        "\2\uffff\1\2\1\5\1\uffff\1\1\2\uffff\1\4\1\3";
    public static final String DFA19_specialS =
        "\12\uffff}>";
    public static final String[] DFA19_transition = {
        "\1\2\1\uffff\12\1",
        "\1\5\1\uffff\12\1\12\uffff\1\3\1\4\1\3\35\uffff\1\3\1\4\1\3",
        "",
        "",
        "\1\6\1\uffff\1\6\2\uffff\12\7",
        "",
        "\12\7",
        "\12\7\12\uffff\1\11\1\uffff\1\11\35\uffff\1\11\1\uffff\1\11",
        "",
        ""
    };
    
    class DFA19 extends DFA {
        public DFA19(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 19;
            this.eot = DFA.unpackEncodedString(DFA19_eotS);
            this.eof = DFA.unpackEncodedString(DFA19_eofS);
            this.min = DFA.unpackEncodedStringToUnsignedChars(DFA19_minS);
            this.max = DFA.unpackEncodedStringToUnsignedChars(DFA19_maxS);
            this.accept = DFA.unpackEncodedString(DFA19_acceptS);
            this.special = DFA.unpackEncodedString(DFA19_specialS);
            int numStates = DFA19_transition.length;
            this.transition = new short[numStates][];
            for (int i=0; i<numStates; i++) {
                transition[i] = DFA.unpackEncodedString(DFA19_transition[i]);
            }
        }
        public String getDescription() {
            return "1028:1: NUM_FLOAT : ( DIGITS '.' ( DIGITS )? ( EXPONENT_PART )? ( FLOAT_TYPE_SUFFIX )? | '.' DIGITS ( EXPONENT_PART )? ( FLOAT_TYPE_SUFFIX )? | DIGITS EXPONENT_PART FLOAT_TYPE_SUFFIX | DIGITS EXPONENT_PART | DIGITS FLOAT_TYPE_SUFFIX );";
        }
    }
    public static final String DFA25_eotS =
        "\1\uffff\17\51\11\uffff\1\123\1\125\1\127\1\uffff\1\133\1\136\1"+
        "\141\1\143\1\145\1\150\1\153\1\155\1\160\1\163\3\uffff\2\164\2\uffff"+
        "\5\51\1\176\23\51\1\u0096\12\51\25\uffff\1\u00a6\1\uffff\1\u00a8"+
        "\13\uffff\2\164\6\51\1\u00b1\1\uffff\22\51\1\u00c4\4\51\1\uffff"+
        "\2\51\1\u00cc\4\51\1\u00d1\5\51\1\u00d8\4\uffff\10\51\1\uffff\1"+
        "\u00e1\2\51\1\u00e4\2\51\1\u00e7\1\u00e8\12\51\1\uffff\1\51\1\u00f4"+
        "\2\51\1\u00f7\2\51\1\uffff\1\u00fa\3\51\1\uffff\1\u00fe\1\u00ff"+
        "\3\51\2\uffff\10\51\1\uffff\2\51\1\uffff\1\u010d\1\u010e\2\uffff"+
        "\1\51\1\u0110\3\51\1\u0114\1\51\1\u0116\1\u0118\1\u0119\1\u011a"+
        "\1\uffff\2\51\1\uffff\1\u011e\1\51\1\uffff\3\51\2\uffff\1\51\1\u0124"+
        "\4\51\1\u0129\1\51\1\u012b\4\51\2\uffff\1\51\1\uffff\1\51\1\u0132"+
        "\1\51\1\uffff\1\u0134\1\uffff\1\51\3\uffff\1\51\1\u0137\1\u0138"+
        "\1\uffff\3\51\1\u013c\1\51\1\uffff\1\u013e\1\u013f\1\51\1\u0141"+
        "\1\uffff\1\51\1\uffff\3\51\1\u0146\2\51\1\uffff\1\51\1\uffff\1\u014a"+
        "\1\u014b\2\uffff\3\51\1\uffff\1\u014f\2\uffff\1\51\1\uffff\3\51"+
        "\1\u0154\1\uffff\1\u0155\1\u0156\1\51\2\uffff\2\51\1\u015a\1\uffff"+
        "\1\u015b\2\51\1\u015e\3\uffff\2\51\1\u0161\2\uffff\1\u0162\1\u0163"+
        "\1\uffff\1\51\1\u0165\3\uffff\1\51\1\uffff\1\u0167\1\uffff";
    public static final String DFA25_eofS =
        "\u0168\uffff";
    public static final String DFA25_minS =
        "\1\11\1\141\1\146\2\157\1\141\1\150\1\141\1\157\1\145\1\150\1\142"+
        "\1\141\1\154\1\150\1\145\11\uffff\1\60\2\75\1\uffff\1\52\1\53\1"+
        "\55\3\75\1\74\2\75\1\46\3\uffff\2\56\2\uffff\1\151\1\143\1\142\1"+
        "\160\1\163\1\44\1\151\1\157\1\164\1\145\1\163\1\141\1\156\2\141"+
        "\1\156\1\160\1\151\1\157\1\156\1\157\1\162\1\154\1\156\1\146\1\44"+
        "\1\151\1\141\1\163\1\164\1\167\1\154\1\163\1\164\1\151\1\164\25"+
        "\uffff\1\75\1\uffff\1\75\13\uffff\2\56\1\166\1\164\1\153\2\154\1"+
        "\164\1\44\1\uffff\1\144\1\141\1\154\1\145\1\141\1\143\1\145\1\162"+
        "\1\164\1\163\1\151\1\164\1\143\1\145\1\164\1\162\2\141\1\44\1\163"+
        "\1\147\1\141\1\142\1\uffff\1\163\1\145\1\44\1\145\1\156\1\164\1"+
        "\151\1\44\1\154\2\145\1\154\1\165\1\75\4\uffff\1\141\1\145\1\141"+
        "\1\151\1\145\1\162\1\141\1\162\1\uffff\1\44\1\164\1\145\1\44\1\153"+
        "\1\150\2\44\1\151\1\163\1\143\1\151\1\150\1\162\1\143\1\164\1\154"+
        "\1\164\1\uffff\1\145\1\44\1\165\1\154\1\44\1\167\1\141\1\uffff\1"+
        "\44\1\163\1\162\1\166\1\uffff\2\44\1\156\1\145\1\162\2\uffff\1\164"+
        "\1\143\1\147\1\143\1\155\1\164\1\156\1\146\1\uffff\1\151\1\141\1"+
        "\uffff\2\44\2\uffff\1\156\1\44\1\164\1\143\1\162\1\44\1\150\4\44"+
        "\1\uffff\1\154\1\145\1\uffff\1\44\1\144\1\uffff\1\151\1\141\1\145"+
        "\2\uffff\1\144\1\44\1\156\1\145\1\164\1\145\1\44\1\145\1\44\1\143"+
        "\1\141\1\154\1\156\2\uffff\1\165\1\uffff\1\146\1\44\1\157\1\uffff"+
        "\1\44\1\uffff\1\171\3\uffff\1\164\2\44\1\uffff\1\163\1\145\1\143"+
        "\1\44\1\163\1\uffff\2\44\1\145\1\44\1\uffff\1\156\1\uffff\1\145"+
        "\1\143\1\145\1\44\1\145\1\160\1\uffff\1\156\1\uffff\2\44\2\uffff"+
        "\1\141\1\156\1\164\1\uffff\1\44\2\uffff\1\144\1\uffff\1\164\1\157"+
        "\1\145\1\44\1\uffff\2\44\1\151\2\uffff\1\146\1\164\1\44\1\uffff"+
        "\1\44\1\163\1\146\1\44\3\uffff\1\172\1\145\1\44\2\uffff\2\44\1\uffff"+
        "\1\145\1\44\3\uffff\1\144\1\uffff\1\44\1\uffff";
    public static final String DFA25_maxS =
        "\1\176\1\165\1\156\1\157\1\171\1\157\1\171\3\157\1\162\1\142\1\165"+
        "\1\170\1\150\1\145\11\uffff\1\71\2\75\1\uffff\5\75\1\76\2\75\1\174"+
        "\1\75\3\uffff\2\146\2\uffff\1\157\1\143\1\142\1\160\1\164\1\172"+
        "\1\154\1\157\1\164\1\145\1\164\1\141\1\156\1\141\1\162\1\156\1\160"+
        "\1\151\1\157\1\156\1\157\1\162\1\154\1\156\1\146\1\172\1\162\1\171"+
        "\1\163\1\164\1\167\1\154\1\163\1\164\1\151\1\164\25\uffff\1\76\1"+
        "\uffff\1\75\13\uffff\2\146\1\166\1\164\1\153\1\154\1\157\1\164\1"+
        "\172\1\uffff\1\144\1\141\1\154\1\145\1\141\1\143\1\145\1\162\1\164"+
        "\1\163\1\151\1\164\1\143\1\145\1\164\1\162\2\141\1\172\1\163\1\147"+
        "\1\141\1\142\1\uffff\1\163\1\157\1\172\1\145\1\156\1\164\1\151\1"+
        "\172\1\154\2\145\1\154\1\165\1\75\4\uffff\1\141\1\145\1\141\1\151"+
        "\1\145\1\162\1\141\1\162\1\uffff\1\172\1\164\1\145\1\172\1\153\1"+
        "\150\2\172\1\151\1\163\1\143\1\151\1\150\1\162\1\143\1\164\1\154"+
        "\1\164\1\uffff\1\145\1\172\1\165\1\154\1\172\1\167\1\141\1\uffff"+
        "\1\172\1\163\1\162\1\166\1\uffff\2\172\1\156\1\145\1\162\2\uffff"+
        "\1\164\1\143\1\147\1\143\1\155\1\164\1\156\1\146\1\uffff\1\151\1"+
        "\141\1\uffff\2\172\2\uffff\1\156\1\172\1\164\1\143\1\162\1\172\1"+
        "\150\4\172\1\uffff\1\154\1\145\1\uffff\1\172\1\144\1\uffff\1\151"+
        "\1\141\1\145\2\uffff\1\144\1\172\1\156\1\145\1\164\1\145\1\172\1"+
        "\145\1\172\1\143\1\141\1\154\1\156\2\uffff\1\165\1\uffff\1\146\1"+
        "\172\1\157\1\uffff\1\172\1\uffff\1\171\3\uffff\1\164\2\172\1\uffff"+
        "\1\163\1\145\1\143\1\172\1\163\1\uffff\2\172\1\145\1\172\1\uffff"+
        "\1\156\1\uffff\1\145\1\143\1\145\1\172\1\145\1\160\1\uffff\1\156"+
        "\1\uffff\2\172\2\uffff\1\141\1\156\1\164\1\uffff\1\172\2\uffff\1"+
        "\144\1\uffff\1\164\1\157\1\145\1\172\1\uffff\2\172\1\151\2\uffff"+
        "\1\146\1\164\1\172\1\uffff\1\172\1\163\1\146\1\172\3\uffff\1\172"+
        "\1\145\1\172\2\uffff\2\172\1\uffff\1\145\1\172\3\uffff\1\144\1\uffff"+
        "\1\172\1\uffff";
    public static final String DFA25_acceptS =
        "\20\uffff\1\63\1\64\1\65\1\66\1\67\1\70\1\71\1\72\1\73\3\uffff\1"+
        "\100\12\uffff\1\140\1\141\1\144\2\uffff\1\147\1\150\44\uffff\1\146"+
        "\1\74\1\76\1\75\1\101\1\77\1\142\1\143\1\103\1\102\1\106\1\105\1"+
        "\104\1\111\1\110\1\107\1\113\1\112\1\115\1\114\1\122\1\uffff\1\123"+
        "\1\uffff\1\126\1\127\1\131\1\130\1\134\1\133\1\132\1\137\1\136\1"+
        "\135\1\145\11\uffff\1\37\27\uffff\1\43\16\uffff\1\117\1\116\1\125"+
        "\1\124\10\uffff\1\10\22\uffff\1\41\7\uffff\1\53\4\uffff\1\62\5\uffff"+
        "\1\121\1\120\10\uffff\1\3\2\uffff\1\5\2\uffff\1\51\1\6\13\uffff"+
        "\1\12\2\uffff\1\34\2\uffff\1\57\3\uffff\1\61\1\40\15\uffff\1\44"+
        "\1\55\1\uffff\1\30\3\uffff\1\35\1\uffff\1\7\1\uffff\1\21\1\11\1"+
        "\60\3\uffff\1\50\5\uffff\1\42\4\uffff\1\15\1\uffff\1\2\6\uffff\1"+
        "\17\1\uffff\1\47\2\uffff\1\13\1\36\3\uffff\1\23\1\uffff\1\46\1\14"+
        "\1\uffff\1\1\4\uffff\1\4\3\uffff\1\54\1\52\3\uffff\1\31\4\uffff"+
        "\1\26\1\45\1\27\3\uffff\1\22\1\16\2\uffff\1\32\2\uffff\1\20\1\33"+
        "\1\56\1\uffff\1\24\1\uffff\1\25";
    public static final String DFA25_specialS =
        "\u0168\uffff}>";
    public static final String[] DFA25_transition = {
        "\2\50\1\uffff\2\50\22\uffff\1\50\1\33\1\55\1\uffff\1\51\1\41\1\46"+
        "\1\54\1\21\1\22\1\40\1\36\1\30\1\37\1\31\1\35\1\53\11\52\1\27\1"+
        "\47\1\43\1\32\1\42\1\20\1\uffff\32\51\1\23\1\uffff\1\24\1\44\1\51"+
        "\1\uffff\1\13\1\4\1\5\1\11\1\15\1\7\2\51\1\2\2\51\1\10\1\51\1\14"+
        "\1\51\1\1\1\51\1\17\1\6\1\12\1\51\1\3\1\16\3\51\1\25\1\45\1\26\1"+
        "\34",
        "\1\57\20\uffff\1\56\2\uffff\1\60",
        "\1\63\6\uffff\1\61\1\62",
        "\1\64",
        "\1\65\2\uffff\1\67\6\uffff\1\66",
        "\1\70\6\uffff\1\71\3\uffff\1\73\2\uffff\1\72",
        "\1\100\13\uffff\1\74\1\76\1\uffff\1\77\1\uffff\1\75",
        "\1\104\7\uffff\1\101\2\uffff\1\102\2\uffff\1\103",
        "\1\105",
        "\1\106\11\uffff\1\107",
        "\1\110\11\uffff\1\111",
        "\1\112",
        "\1\113\3\uffff\1\114\17\uffff\1\115",
        "\1\116\13\uffff\1\117",
        "\1\120",
        "\1\121",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "\12\122",
        "\1\124",
        "\1\126",
        "",
        "\1\131\4\uffff\1\130\15\uffff\1\132",
        "\1\134\21\uffff\1\135",
        "\1\137\17\uffff\1\140",
        "\1\142",
        "\1\144",
        "\1\146\1\147",
        "\1\151\1\152",
        "\1\154",
        "\1\157\76\uffff\1\156",
        "\1\161\26\uffff\1\162",
        "",
        "",
        "",
        "\1\122\1\uffff\12\165\12\uffff\3\122\35\uffff\3\122",
        "\1\122\1\uffff\10\166\2\122\12\uffff\3\122\35\uffff\3\122",
        "",
        "",
        "\1\167\5\uffff\1\170",
        "\1\171",
        "\1\172",
        "\1\173",
        "\1\174\1\175",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\177\2\uffff\1\u0080",
        "\1\u0081",
        "\1\u0082",
        "\1\u0083",
        "\1\u0085\1\u0084",
        "\1\u0086",
        "\1\u0087",
        "\1\u0088",
        "\1\u008a\20\uffff\1\u0089",
        "\1\u008b",
        "\1\u008c",
        "\1\u008d",
        "\1\u008e",
        "\1\u008f",
        "\1\u0090",
        "\1\u0091",
        "\1\u0092",
        "\1\u0093",
        "\1\u0094",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\24\51\1"+
        "\u0095\5\51",
        "\1\u0097\10\uffff\1\u0098",
        "\1\u009b\23\uffff\1\u009a\3\uffff\1\u0099",
        "\1\u009c",
        "\1\u009d",
        "\1\u009e",
        "\1\u009f",
        "\1\u00a0",
        "\1\u00a1",
        "\1\u00a2",
        "\1\u00a3",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "\1\u00a5\1\u00a4",
        "",
        "\1\u00a7",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "\1\122\1\uffff\12\165\12\uffff\3\122\35\uffff\3\122",
        "\1\122\1\uffff\10\166\2\122\12\uffff\3\122\35\uffff\3\122",
        "\1\u00a9",
        "\1\u00aa",
        "\1\u00ab",
        "\1\u00ac",
        "\1\u00ad\2\uffff\1\u00ae",
        "\1\u00af",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\4\51\1\u00b0"+
        "\25\51",
        "",
        "\1\u00b2",
        "\1\u00b3",
        "\1\u00b4",
        "\1\u00b5",
        "\1\u00b6",
        "\1\u00b7",
        "\1\u00b8",
        "\1\u00b9",
        "\1\u00ba",
        "\1\u00bb",
        "\1\u00bc",
        "\1\u00bd",
        "\1\u00be",
        "\1\u00bf",
        "\1\u00c0",
        "\1\u00c1",
        "\1\u00c2",
        "\1\u00c3",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00c5",
        "\1\u00c6",
        "\1\u00c7",
        "\1\u00c8",
        "",
        "\1\u00c9",
        "\1\u00cb\11\uffff\1\u00ca",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00cd",
        "\1\u00ce",
        "\1\u00cf",
        "\1\u00d0",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00d2",
        "\1\u00d3",
        "\1\u00d4",
        "\1\u00d5",
        "\1\u00d6",
        "\1\u00d7",
        "",
        "",
        "",
        "",
        "\1\u00d9",
        "\1\u00da",
        "\1\u00db",
        "\1\u00dc",
        "\1\u00dd",
        "\1\u00de",
        "\1\u00df",
        "\1\u00e0",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00e2",
        "\1\u00e3",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00e5",
        "\1\u00e6",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00e9",
        "\1\u00ea",
        "\1\u00eb",
        "\1\u00ec",
        "\1\u00ed",
        "\1\u00ee",
        "\1\u00ef",
        "\1\u00f0",
        "\1\u00f1",
        "\1\u00f2",
        "",
        "\1\u00f3",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00f5",
        "\1\u00f6",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00f8",
        "\1\u00f9",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u00fb",
        "\1\u00fc",
        "\1\u00fd",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0100",
        "\1\u0101",
        "\1\u0102",
        "",
        "",
        "\1\u0103",
        "\1\u0104",
        "\1\u0105",
        "\1\u0106",
        "\1\u0107",
        "\1\u0108",
        "\1\u0109",
        "\1\u010a",
        "",
        "\1\u010b",
        "\1\u010c",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "",
        "\1\u010f",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0111",
        "\1\u0112",
        "\1\u0113",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0115",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\13\51\1"+
        "\u0117\16\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "\1\u011b",
        "\1\u011c",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\22\51\1"+
        "\u011d\7\51",
        "\1\u011f",
        "",
        "\1\u0120",
        "\1\u0121",
        "\1\u0122",
        "",
        "",
        "\1\u0123",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0125",
        "\1\u0126",
        "\1\u0127",
        "\1\u0128",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u012a",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u012c",
        "\1\u012d",
        "\1\u012e",
        "\1\u012f",
        "",
        "",
        "\1\u0130",
        "",
        "\1\u0131",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0133",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "\1\u0135",
        "",
        "",
        "",
        "\1\u0136",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "\1\u0139",
        "\1\u013a",
        "\1\u013b",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u013d",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0140",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "\1\u0142",
        "",
        "\1\u0143",
        "\1\u0144",
        "\1\u0145",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0147",
        "\1\u0148",
        "",
        "\1\u0149",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "",
        "\1\u014c",
        "\1\u014d",
        "\1\u014e",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "",
        "\1\u0150",
        "",
        "\1\u0151",
        "\1\u0152",
        "\1\u0153",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u0157",
        "",
        "",
        "\1\u0158",
        "\1\u0159",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\u015c",
        "\1\u015d",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "",
        "",
        "\1\u015f",
        "\1\u0160",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "\1\u0164",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        "",
        "",
        "",
        "\1\u0166",
        "",
        "\1\51\13\uffff\12\51\7\uffff\32\51\4\uffff\1\51\1\uffff\32\51",
        ""
    };
    
    class DFA25 extends DFA {
        public DFA25(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 25;
            this.eot = DFA.unpackEncodedString(DFA25_eotS);
            this.eof = DFA.unpackEncodedString(DFA25_eofS);
            this.min = DFA.unpackEncodedStringToUnsignedChars(DFA25_minS);
            this.max = DFA.unpackEncodedStringToUnsignedChars(DFA25_maxS);
            this.accept = DFA.unpackEncodedString(DFA25_acceptS);
            this.special = DFA.unpackEncodedString(DFA25_specialS);
            int numStates = DFA25_transition.length;
            this.transition = new short[numStates][];
            for (int i=0; i<numStates; i++) {
                transition[i] = DFA.unpackEncodedString(DFA25_transition[i]);
            }
        }
        public String getDescription() {
            return "1:1: Tokens : ( T106 | T107 | T108 | T109 | T110 | T111 | T112 | T113 | T114 | T115 | T116 | T117 | T118 | T119 | T120 | T121 | T122 | T123 | T124 | T125 | T126 | T127 | T128 | T129 | T130 | T131 | T132 | T133 | T134 | T135 | T136 | T137 | T138 | T139 | T140 | T141 | T142 | T143 | T144 | T145 | T146 | T147 | T148 | T149 | T150 | T151 | T152 | T153 | T154 | T155 | QUESTION | LPAREN | RPAREN | LBRACK | RBRACK | LCURLY | RCURLY | COLON | COMMA | DOT | ASSIGN | EQUAL | LNOT | BNOT | NOT_EQUAL | DIV | DIV_ASSIGN | PLUS | PLUS_ASSIGN | INC | MINUS | MINUS_ASSIGN | DEC | STAR | STAR_ASSIGN | MOD | MOD_ASSIGN | SR | SR_ASSIGN | BSR | BSR_ASSIGN | GE | GT | SL | SL_ASSIGN | LE | LT | BXOR | BXOR_ASSIGN | BOR | BOR_ASSIGN | LOR | BAND | BAND_ASSIGN | LAND | SEMI | WS | SL_COMMENT | ML_COMMENT | IDENT | NUM_INT | NUM_FLOAT | CHAR_LITERAL | STRING_LITERAL );";
        }
    }
 

}