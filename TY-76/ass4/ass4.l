%{
#include "y.tab.h"
#include <math.h>
%}

%%
[0-9] {yylval =atoi(yytext); return Number;}
[/t]
"\n" {return 0;}
. {return yytext[0];}
sqrt {return sqrt;}
%%

int yywrap()
{
return 1;
}
