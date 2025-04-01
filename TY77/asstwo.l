%{
#include <stdio.h>
int wc = 0, lc = 0, cc = 0, dc = 0, vc = 0;
%}

%%

[aeiouAEIOU]+      { vc++; cc++; wc++;} 
[0-9]             { dc++; cc++; }  
\n                 { lc++; cc++; }  
[ \t]+             { cc += yyleng; } 
[^ \t\n]+          { wc++; cc += yyleng; } 
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("atwo.txt", "r");
    yylex();
    printf("Number of Lines : %d\n", lc);
    printf("Number of Words : %d\n", wc);
    printf("Number of Characters : %d\n", cc);
    printf("Number of Digits : %d\n", dc);
    printf("Number of Vowels : %d\n", vc);
    return 0;
}


