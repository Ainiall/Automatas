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

LETRA=([a-zA-Z])
DIGITO=([0-9])
UO=([Uu][Oo][0-9][0-9][0-9][0-9][0-9]?[0-9]?)

%%
{UO}           {System.out.println("SCANNER:: UO("+yytext()+")");}
(\t|\n|" ")    {}
.+             {System.out.println("SCANNER:: LEXICAL ERROR("+yytext()+")");}
