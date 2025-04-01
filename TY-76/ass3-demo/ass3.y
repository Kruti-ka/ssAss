%{
#include <stdio.h>
int yyerror(char *str);
int yywrap();
int yylex();
%}

%token A B NL

%%
Stmt: S NL {printf(": String is valid ");}
;
S: A S B|
;
%%
int yyerror(char *str)
{
printf(": Invalid String");
}

int main(){
printf("Enter The String :");
yyparse();
}

