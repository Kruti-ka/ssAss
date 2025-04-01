%{
#include<stdio.h>
%}
%%
# {printf("\n Preproccessor Directive=:%s",yytext);}
include|void|main|int|printf  {printf("\nKeywords =:%s",yytext);}
"<"|">"|"("|")"|"{"|"}"|";"|","|"." {printf("\n Panctuation=:%s",yytext);}
[a-z]+[.][h]  {printf("\n Headers Files=:%s",yytext);}
[a-zA-Z][a-zA-Z0-9_]+ {printf("\n Identifier=:%s",yytext);}
[0-9]+  {printf("\n Interger No=:%s",yytext);}
["].*["] {printf("\nLiterals=:%s",yytext);}
"+"|"-"|"*"|"/" {printf("\n Operators=:%s",yytext);}
[/][/].* {printf("\n Comments=:%s",yytext);}
[[/*].*[*/]] {printf("\n MultiLine Comments=:%s",yytext);}
[/][/].* {printf("\n Single Line Comment+:%s",yytext);}
"/*"[^*]*"*/"  {printf("\n Multiline Line Comment+:%s",yytext);}
[0-9]+(\.[0-9]+) {printf("\n Decimal Number:%s",yytext);}

%%
int yywrap()
{
return 1;
}
int main()
{
yyin = fopen("program.c","r");
yylex();
return 0;
}
