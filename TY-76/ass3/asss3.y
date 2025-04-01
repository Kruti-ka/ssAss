%{
#include <stdio.h>
int yyerror(char *str);
int yywrap();
int yylex();
%}

%token D ID C SC X E NL 

%%
Stmt: S NL               { printf(": Declaration is valid\n"); exit(0);}
;

S: D V SC NL
;

V: V C ID       { printf("Declared variable: %s\n", $3); }
  | ID E X { printf("Initialized variable: %s = %d\n",$1,$3);}
  | ID
;

%%
int yyerror(char *str)
{
    printf(": Invalid Declaration\n");
    return 0;
}

int main() {
    printf("Enter The Declaration : ");
    yyparse();
    return 0;
}

