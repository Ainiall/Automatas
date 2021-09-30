// Template for training Reg. Exp.

import java.lang.System;
class Scanner {
public static void main(String argv[])
        throws java.io.IOException {
            Yylex yy = new Yylex(System.in);
            while (yy.yylex() != null){}
        }
}

class Yytoken {Yytoken () {}}

%%

LETRA=([a-zA-Z]) //letra de a-z
DIGITO=([0-9]) //digitos de 0-9
UO=([Uu][Oo][0-9][0-9][0-9][0-9][0-9]?[0-9]?) 
ALFANUMERICO=({LETRA}|{DIGITO}) //puede ser letra o digito
COMENTARIO=("#"{ALFANUMERICO}*) //comentario alfanumerico

NATURALES=({DIGITO}+) //1 o mas digitos
ENTERO=((("-")?{NATURALES})) //1 o mas digitos con posible signo negativo
TIPO1=({ENTERO}(".")?{NATURALES}?[eE]["+"|"-"]?{NATURALES})
TIPO2=({ENTERO}?"."{NATURALES}) // .3
TIPO3=({ENTERO}"."{NATURALES}?) //  3.
REALES=({TIPO1}|{TIPO2}|{TIPO3})

UNIOVI=("@uniovi."("es"|"com")) 
CORREO=({LETRA}({ALFANUMERICO}|"."{ALFANUMERICO})*)
EMAIL=({CORREO}{UNIOVI})

IDENT=([a-z]({ALFANUMERICO}|"_"*{ALFANUMERICO})*)

%%
{LETRA}        {System.out.println("SCANNER:: LETRA("+yytext()+")");}
{UO}           {System.out.println("SCANNER:: UO("+yytext()+")");}
{COMENTARIO}   {System.out.println("SCANNER:: COMENTARIO("+yytext()+")");}
{REALES}       {System.out.println("SCANNER:: REALES("+yytext()+")");}
{EMAIL}        {System.out.println("SCANNER:: EMAIL("+yytext()+")");}
{IDENT}        {System.out.println("SCANNER:: IDENT("+yytext()+")");}
\t|\n|" ")     {}
.*             {System.out.println("SCANNER:: LEXICAL ERROR("+yytext()+")");}
