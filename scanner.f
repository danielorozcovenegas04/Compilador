%{
	#include <stdio.h>

	/*Comentarios*/
	int numNumeros = 0;
	int numIdentificadores = 0;
	int numKeywords = 0;
%}

%option noyywrap

DIGITO [0-9]
LETRA	[a-zA-Z]
KEYWORD "if"|"then"|"else"|"fi"
IDENTIFICADOR	^{LETRA}(({LETRA}|{DIGITO})*)$
NUMERO ^{DIGITO}+(\.{DIGITO}+)?([Ee][+-]?{DIGITO}+)?

%%
"fin"	{
			fprintf (yyout ,"Se reconocieron %d números\n", numNumeros);
			fprintf (yyout ,"Se reconocieron %d palabras reservadas\n", numKeywords);
			fprintf (yyout ,"Se reconocieron %d identificadores\n", numIdentificadores);
			return 0;
		}
{NUMERO}	{
			fprintf (yyout ,"%s es un número\n", yytext);
			numNumeros++;
		}
{KEYWORD}	{
			fprintf (yyout ,"%s es una palabra reservada\n", yytext);
			numKeywords++;
		}
{IDENTIFICADOR}  {
			fprintf (yyout ,"%s es un identificador\n", yytext);
			numIdentificadores++;
		}
.* {

		}
%%

int main (int argc, char** argv) {
	if(argc >= 1){
		yyin = fopen(argv[1], "r");
		if(argc == 3){
			yyout = fopen(argv[2], "w");
		}
		else{
			yyout = fopen("salida.txt", "w");
		}
		yylex();
	}
	else{
		printf("No se ingresaron los argumentos necesarios");
	}
}
