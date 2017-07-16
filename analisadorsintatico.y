%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
#define YYSTYPE double
void yyerror(char *);
int yylex(void);

%}



%union{
	double real;
	int id;
}

%token  <id> INTEIRO
%type   <real>    exp


%right   '='
%left    '-'  '+'
%left    '*'  '/'
%left     NEG
%right  '^'



%%
input : |input line;
line : '\n' {printf("Entrada de linha em branco");} 
	|exp '\n' {printf("%s\n",$1);} | error '\n' {yyerror;} ;

exp : INTEIRO{$$ = $1;} 
 
     | exp '+' exp  {$$ = $1 + $3;}
     | exp '-' exp  {$$ = $1 - $3;}
     | exp '*' exp  {$$ = $1 * $3;} 
     | exp '/' exp  {$$ = $1 / $3;}
     | '-' exp %prec NEG  {$$ = -$2;} 
     | '(' exp ')' { $$=$2;}
	 
%%


int main(void){
	
	yyparse();
}

void yyerror(char *s){
fprintf(stderr,"erro: %s \n",s);
}