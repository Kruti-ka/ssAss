%{
#include "y.tab.h"
%}
%%
[aA] {return A;}
[bB] {return B;}
"\n" {return NL;}
%%
int yywrap()
{
 return 1;
}
