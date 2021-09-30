import java.lang.System;
class Scanner {
   public static void main(String argv[])
        throws java.io.IOException {
        Yylex yy = new Yylex(System.in);
        while (yy.yylex() != null){}
   }
}

class Yytoken {   Yytoken () {} }
%%

DIGIT=([0-9])
LETTER=([a-zA-Z])
BLANK=([\t|" "])
ALPHANUMERIC=({DIGIT}|{LETTER})
COMMENT=("//"({LETTER}|{BLANK}|{DIGIT})*)
INTEGER=({DIGIT}+) //1 o mas digitos
IDENT=({LETTER}({ALPHANUMERIC}|"_"*{ALPHANUMERIC})*)

ENTERO=({DIGIT}+) //1 o mas digitos
TIPO1=({ENTERO}?"."{ENTERO}) // .3
TIPO2=({ENTERO}"."{ENTERO}?) //  3.
REAL=({TIPO1}|{TIPO2})


%%

;			 {System.out.println("SCANNER:: found punctuation symbol SEMICOLON");}
"("          {System.out.println("SCANNER:: found Symbol LP");}
")"          {System.out.println("SCANNER:: found Symbol RP");}
"-"			 {System.out.println("SCANNER:: found Operator MINUS");}
"+"			 {System.out.println("SCANNER:: found Operator ADD");}
"*"          {System.out.println("SCANNER:: found Operator MULT");}
"/"          {System.out.println("SCANNER:: found Operator DIV");}
"<"          {System.out.println("SCANNER:: found Operator LT");}
">"          {System.out.println("SCANNER:: found Operator GT");}
"="          {System.out.println("SCANNER:: found Operator SET");}
"=="          {System.out.println("SCANNER:: found Operator EQ");}
print        {System.out.println("SCANNER:: found Reserved Word PRINT");}
begin		 {System.out.println("SCANNER:: found Reserved Word BEGIN");}
end			 {System.out.println("SCANNER:: found Reserved Word END");}
{IDENT}      {System.out.println("SCANNER:: found IDENT <"+ yytext() +">");}
[A-Za-Z]+    {System.out.println("SCANNER:: found Reserved Word IDENT");}
{COMMENT}    {System.out.println("SCANNER:: comment line <"+ yytext() +">");}
{REAL}       {System.out.println("SCANNER:: found REAL <"+ yytext() +">");}
{INTEGER}    {System.out.println("SCANNER:: found NUMBER <"+ yytext() +">");}
(\t|\n|" ")  {}
. 	         {System.out.println("SCANNER:: Unmatched input <"+ yytext() +">");}

 

