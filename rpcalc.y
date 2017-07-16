	/* Calculadora com notacao polonesa */

%{
/* abaixo definimos que o tipo do valor semantico tanto de terminais quanto nao terminais e double. O default seria int */
#define YYSTYPE double
#include <stdio.h>
#include <math.h>
double transforma_em_num();
%}

%token NUM
%token FIMLINHA

%%
input:	/* empty */
	|line input
;

line:	FIMLINHA
	|exp FIMLINHA {printf ("resultado = %f\n", $1);}
;

exp:	NUM {$$ = transforma_em_num();}
	|exp exp '+' {$$ = $1 + $2;}
	|exp exp '-' {$$ = $1 - $2;}
	|exp exp '*' {$$ = $1 * $2;}
	|exp exp '/' {$$ = $1 / $2;}
	|exp exp '^' {$$ = pow ($1, $2);}
;

%%

#include "lex.yy.c"
main(){
	yyparse();
}

/* rotina chamada por yyparse quando encontra erro */
yyerror (char *s){
	printf("%s\n", s);
}

double transforma_em_num(){
	return(atof(yytext));
}

