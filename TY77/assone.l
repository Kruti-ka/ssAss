%{
#include<stdio.h>
%}
%%
[/][/].* {printf("\n Single line comment1 : %s",yytext);}
"/*"[^*]*"*/" {printf("\n Multi line comment : %s",yytext);}
# {printf("\n Processing Directives : %s",yytext);}
include|printf|int|void|main {printf("\n Keywords : %s",yytext);}
"<"|">"|"("|")"|";"|","|"{"|"}" {printf("\n Punctuation : %s",yytext);}
[a-z]+[.][h] {printf("\n Header files : %s",yytext);}
["].*["] {printf("\n Litrels : %s",yytext);}
[a-zA-Z][a-zA-Z0-9_] {printf("\n Identifier : %s",yytext);}
[0-9]+ {printf("\n Integer Number : %s",yytext);}
[0-9]+(\.[0-9]+) {printf("\n Decimal Number : %s",yytext);}

"+"|"-"|"=" {printf("\n Operators : %s",yytext);}
%%
int yywrap()
{
return 1;
}
int main()
{
yyin=fopen("pro.c","r");
yylex();
return 0;
}
%{
#include <stdio.h>
#include <stdlib.h>

int yyerror(char *str);
int yywrap();
%}

%token N 
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

A: E { printf("Result is = %d\n", $$); };

E: E '+' E   { $$ = $1 + $3; }
 | E '-' E   { $$ = $1 - $3; }
 | E '*' E   { $$ = $1 * $3; }
 | E '/' E   { $$ = $1 / $3; }
 | E '%' E   { $$ = $1 % $3; }
 | '(' E ')' { $$ = $2; }
 | N         { $$ = $1; }


%%

int yyerror(char *str) {
    printf("Invalid Expression\n");
    return 0;
}

int main() {
    printf("Enter Arithmetic Expression: ");
    yyparse();
    return 0;
}

