%{
#include <stdio.h>
#include "soma.tab.h"

extern int yylval;
%}

%%
add			return (ADD);
sub			return (SUB);
mult			return (MULT);
div			return (DIV);
[0-9]+			{yylval = atoi(yytext); return NUMERO;};
0x[0-9a-fA-F]+		{sscanf(yytext, "%x", &yylval); return NUMERO;};
\(			return (ABRE_PARENTESIS);
\)			return (FECHA_PARENTESIS);
\n			return (FIM_LINHA);
.			;
%%
