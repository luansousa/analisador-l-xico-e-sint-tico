%{
#include <stdio.h>
#include <stdlib.h>
%}
%start calc
%token FIM_LINHA ADD SUB MULT DIV ABRE_PARENTESIS FECHA_PARENTESIS NUMERO
%left '+' '-' '*' '/'
%%
calc 	:	expr FIM_LINHA
	{
		printf("Resposta é: %d\n", $1);
		exit(0);
	}
     	;
expr 	:	expr ADD expr 
	{
		$$ = $1 + $3;
	}
     	|	expr SUB expr
     	{
		$$ = $1 - $3;
	}
	|	expr MULT expr
     	{
		$$ = $1 * $3;
	}
	|	expr DIV expr
     	{
		$$ = $1 / $3;
	}
     	|	ABRE_PARENTESIS expr FECHA_PARENTESIS 
     	{
		$$ = $2;
	}
    	| 	NUMERO
     	;
%%
/* código do usuário */

int 
yyerror (char *mens)
{
	
	fprintf(stderr, "%s\n", mens);
	return (1);
}

int
main (int argc, char **argv)
{
	return (yyparse());
}
