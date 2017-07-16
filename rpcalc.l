%{
#include <math.h>
%}

%%

[0-9]+("."[0-9]+)?	{return(NUM);}
[ \t]+			{}
\n			{return(FIMLINHA);}
.			{return(yytext[0]);}

%%

