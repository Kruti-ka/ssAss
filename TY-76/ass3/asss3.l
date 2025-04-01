%{
#include "y.tab.h"
%}

%%
char|int|double|float   { return D; }
[a-zA-Z][a-zA-Z0-9_]*   { return ID; }
[,]                     { return C; }
[;]                     { return SC; }
[0-9]+                  {return X; }
[=]                     {return E;}
"\n"                    {return NL; }
.                       { }

%%
int yywrap()
{
    return 1;
}

