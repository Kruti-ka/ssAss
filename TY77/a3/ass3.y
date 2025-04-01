%{
#include <stdio.h>

int yyerror(char *str);
int yywrap();
%}

%token A B NL

%%
Stmt: S NL { printf("String is Valid\n"); }
     ;

S: A B S  { }    /* One A followed by one B, followed by more S */
  |             /* Empty string (epsilon), valid base case */
  ;

%%

int yyerror(char *str) {
    printf("Invalid String\n");
    return 0;
}

int main() {
    printf("Enter String: ");
    yyparse();
    return 0;
}

