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
boolean output =false;
%}

%cup
DIGIT=([0-9])
INTEGER=({DIGIT}+)
LETTER=([a-zA-Z])
BLANK=(" "|\t)
ALPHANUMERIC=({DIGIT}|{LETTER})
REAL=(({INTEGER}?"."{INTEGER}+)|({INTEGER}+"."{INTEGER}?))
COMMENT=("//"({LETTER}|{BLANK}|{DIGIT}|"_")*)
IDENT=({LETTER}({ALPHANUMERIC}|"_"*{ALPHANUMERIC})*)
%%
begin			{if (output) System.out.println("SCANNER:: BEGIN");
                         return new Symbol(sym.BEGIN);}
end			{if (output) System.out.println("SCANNER:: END");
                         return new Symbol(sym.END);}
print			{if (output) System.out.println("SCANNER:: PRINT");
                         return new Symbol(sym.PRINT);}
;			{if (output) System.out.println("SCANNER:: EOS");
                         return new Symbol(sym.EOS);}
">"			{if (output) System.out.println("SCANNER:: GT");
                         return new Symbol(sym.GT);}
"<"			{if (output) System.out.println("SCANNER:: LT");
                         return new Symbol(sym.LT);}
"("			{if (output) System.out.println("SCANNER:: LP");
                         return new Symbol(sym.LP);}
")"			{if (output) System.out.println("SCANNER:: RP");
                         return new Symbol(sym.RP);}
"="         		{if (output) System.out.println("SCANNER:: =");
                         return new Symbol(sym.SET);}
"+"      	     	{if (output) System.out.println("SCANNER:: PLUS");
			 return new Symbol(sym.PLUS);}
"-"      	     	{if (output) System.out.println("SCANNER:: MINUS");
			 return new Symbol(sym.MINUS);}
"/"      	     	{if (output) System.out.println("SCANNER:: DIV");
			 return new Symbol(sym.DIV);}
\*      	     	{if (output) System.out.println("SCANNER:: MULT");
			 return new Symbol(sym.MULT);}
"=="			{if (output) System.out.println("SCANNER:: EQ");
                         return new Symbol(sym.EQ);}
"OR"			{if (output) System.out.println("SCANNER:: OR");
                        return new Symbol(sym.OR);}

{INTEGER}|{REAL}  	{if (output) System.out.println("SCANNER:: NUMBER <"+yytext()+">");
			 return new Symbol(sym.NUMBER, new Double(yytext()));}
{COMMENT}    {if (output) System.out.println("COMMENT:: <"+yytext()+">");}
    
{IDENT}      {if (output) System.out.println("SCANNER:: IDENT <"+yytext()+">");
			 return new Symbol(sym.IDENT, yytext());}
(" "|\t|\n)+   		{}
.      			{if (output) System.out.println("SCANNER:: Unmatched input "+ yytext());}
