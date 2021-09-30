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

%%
;			{System.out.println("SCANNER:: SEMICOLON");}
"+"      	     	{System.out.println("SCANNER:: PLUS");}
begin			{System.out.println("SCANNER:: BEGIN");}
(" "|\t|\n)+   		{}
(E|e)(N|n)(D|d)         {System.out.println("SCANNER:: END");}
. 	     		{System.out.println("SCANNER:: Unmatched String ("+yytext()+")");}
