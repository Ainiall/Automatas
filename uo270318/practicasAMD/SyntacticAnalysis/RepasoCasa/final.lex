// Fichero MiniLan.lex
// Version para inicial para el Analisis Sintactico 
import java.lang.System;
import java_cup.runtime.Symbol;

%%

%{
// Esta variable determina si el scanner imprime
// mensajes por pantalla (true) o solo devuelve el token 
// al parser (false). Puedes cambiarlo según te interese
// ver o no lo que hace el scanner.
boolean output = true;
%}

%cup
DIGIT=([0-9])
LETTER = ([a-zA-Z])
INTEGER=({DIGIT}+)
REAL = (({DIGIT}+"."{DIGIT}*)|({DIGIT}*"."{DIGIT}+))
BLANK=(" "|\t)
ALPHANUMERIC=({DIGIT}|{LETTER})
IDENT=({LETTER}({ALPHANUMERIC}|"_"{ALPHANUMERIC})*)
//IDENT =({LETTER}(("_")|{DIGIT}|{LETTER})*)
COMMENT=("//"({BLANK}|{ALPHANUMERIC}|"_")*)
%%
begin			{if (output) System.out.println("SCANNER:: BEGIN");
                         return new Symbol(sym.BEGIN);}
end			{if (output) System.out.println("SCANNER:: END");
                         return new Symbol(sym.END);}
print			{if (output) System.out.println("SCANNER:: PRINT");
                         return new Symbol(sym.PRINT);}
;			{if (output) System.out.println("SCANNER:: EOS");
                         return new Symbol(sym.EOS);}
"("			{if (output) System.out.println("SCANNER:: LP");
                         return new Symbol(sym.LP);}
")"			{if (output) System.out.println("SCANNER:: RP");
                         return new Symbol(sym.RP);}
"+"      	     	{if (output) System.out.println("SCANNER:: PLUS");
			 return new Symbol(sym.PLUS);}
"-"      	     	{if (output) System.out.println("SCANNER:: MINUS");
			 return new Symbol(sym.MINUS);}
\*      	     	{if (output) System.out.println("SCANNER:: MULT");
			 return new Symbol(sym.MULT);}
"/"      	     	{if (output) System.out.println("SCANNER:: DIV");
			 return new Symbol(sym.DIV);}
"<"      	     	{if (output) System.out.println("SCANNER:: LT");
			 return new Symbol(sym.LT);}
">"      	     	{if (output) System.out.println("SCANNER:: GT");
			 return new Symbol(sym.GT);}
"=="      	     	{if (output) System.out.println("SCANNER:: EQ");
			 return new Symbol(sym.EQ);}
"+="      	     	{if (output) System.out.println("SCANNER:: PE");
			 return new Symbol(sym.PE);}
"*="      	     	{if (output) System.out.println("SCANNER:: ME");
			 return new Symbol(sym.ME);}
"="      	     	{if (output) System.out.println("SCANNER:: SET");
			 return new Symbol(sym.SET);}
"OR"      	     	{if (output) System.out.println("SCANNER:: OR");
			 return new Symbol(sym.OR);}
{INTEGER}|{REAL}    		{if (output) System.out.println("SCANNER:: NUMBER <"+yytext()+">");
			 return new Symbol(sym.NUMBER, new Double(yytext()));}
			 
{IDENT}			{if (output) System.out.println("SCANNER:: IDENT <"+yytext()+">");
			 return new Symbol(sym.IDENT, yytext());}
{COMMENT}    		{if (output) System.out.println("SCANNER:: COMMENT <"+yytext()+">");}
(" "|\t|\n)+   		{}
.      			{if (output) System.out.println("SCANNER:: Unmatched input "+ yytext());}
