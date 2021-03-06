%{
#include<stdio.h>
#include<stdlib.h>
#define INTEIRO
%}

BRANCO   [\n| |\t| \r] 
DIGITO   [0-9]  
LETRA    [a-zA-Z]
COMENT       \/\*{tudo}*\*\/
COMENT_LINHA  \/\/([^\n])*
id {LETRA}({LETRA}|{DIGITO})*  


%option noyywrap

%%
"--"                 {printf("   -Operador de Decremento:  %s \n",yytext);}
"++"                 {printf("   -Operador de Incremento:  %s \n",yytext);}
"+"                  {printf("   -Operador de Adi��o:  %s \n",yytext);}
"-"                  {printf("   -Operador de Subtra��o:  %s \n",yytext);}
"*"                  {printf("   -Operador de Multiplica��o:  %s \n",yytext);}
"/"                  {printf("   -Operador de Divis�o:  %s \n",yytext);}
">"                  {printf("   -Sinal de Maior:  %s \n",yytext);}
"<"                  {printf("   -Sinal de Menor:  %s \n",yytext);}
"!="                 {printf("   -Sinal de Diferente:  %s \n",yytext);} 
"("                  {printf("   -Inicio dos parametros:  %s \n",yytext);}
")"                  {printf("   -Fim dos parametros:  %s \n",yytext);} 
";"                  {printf("   -Fecha uma senten�a:  %s \n",yytext);}
"="                  {printf("   -Sinal de atribui��o:  %s \n",yytext);}
"=="                 {printf("   -Sinal de igualdade:  %s \n",yytext);}
"{"                  {printf("   -Inicio do metodo:  %s \n",yytext);}
"}"                  {printf("   -Fim do metodo:  %s \n",yytext);}
"int"                {printf("   -Tipo inteiro:  %s \n",yytext);} 
"float"              {printf("   -Tipo pomto flutuante:  %s \n",yytext);}
"char"               {printf("   -Tipo caractere:  %s \n",yytext);} 
"boolean"            {printf("   -Tipo booleano:  %s \n",yytext);}
"if"                 {printf("   -Estrutura condicional:  %s \n",yytext);} 
"for"                {printf("   -Estrutura iterativa for:  %s \n",yytext);}
"while"              {printf("   -Estrutura Iterativa:  %s \n",yytext);}
{BRANCO}+            {printf("    Espa�o vazio  %s \n",yytext);}
{LETRA}              {printf("   -Uma letra:  %s \n",yytext);}
{DIGITO}+            printf("    -Um n�mero:  %s \n",yytext);
{id}                 {printf("   -Um identificador: %s \n",yytext);return INTEIRO;}
"~"                  {printf("Final da analise!! %s \n",yytext); return 0;}


%%

 
int main(){
  printf("--------------------------------ANALISADOR LEXICO------------------------------\n");
  printf("OBSERVACAO- Para finalizar a analise digite:  ~   ");	
  printf("\n");
  printf("\n");
  printf(" Digite uma cadeia de caracteres:  ");		
  yylex();
}
