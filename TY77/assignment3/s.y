%{
#include <stdio.h>

int yyerror(char *str);
int yywrap();
int yylex();
%}

%token D ID C SC X E NL 

%%Stmt: S NL { printf("String is Valid\n");exit(0);}
     ;

S: D V SC
  ;
V: V C ID { printf("Declared Variable: %s\n", $3); }
	| ID E X { printf("Initialized Variable: %s = %d\n", $1, $3); }
	| ID
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

