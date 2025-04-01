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
