%{
    int numIDs = 0;
    int numPalRes = 0;
    int numNumeros = 0;
    int numLiterales = 0;
    int numParAbier = 0;
    int numParCerr = 0;
    int numCuadAbier = 0;
    int numCuadCerr = 0;
    int numCorchAbier = 0;
    int numCorchCerr = 0;
    int numOperArit = 0;
    int numOperRel = 0;
%}

%option noyywrap

/* definiciones regulares */

letra [A-Za-z]

digito [0-9]

id ^{letra}({letra}|{digito})*

keyword "else"|"then"|"if"

numero {digito}+(\.{digito}+)?([Ee][+-]?{digito}+)?

literal ^\".*\"$

operArit \*|\/|\+|\-

%%

"fin"	{
			    fprintf (yyout,"Se han reconocido %d identificadores\n", numIDs);
          fprintf (yyout,"Se han reconocido %d palabras reservadas\n", numPalRes);
          fprintf (yyout,"Se han reconocido %d números\n", numNumeros);
          fprintf (yyout,"Se han reconocido %d literales\n", numLiterales);
          fprintf (yyout,"Se han reconocido %d parentesis abiertos\n", numParAbier);
          fprintf (yyout,"Se han reconocido %d parentesis cerrados\n", numParCerr);
          fprintf (yyout,"Se han reconocido %d parentesis cuadrados abiertos\n", numCuadAbier);
          fprintf (yyout,"Se han reconocido %d parentesis cuadrados cerrados\n", numCuadCerr);
          fprintf (yyout,"Se han reconocido %d corchetes abiertos\n", numCorchAbier);
          fprintf (yyout,"Se han reconocido %d corchetes cerrados\n", numCorchCerr);
			    return 0;
		  }

{keyword} {
              fprintf (yyout,"%s es una palabra reservada\n", yytext);
              numPalRes++;
          }

{id}  {
          fprintf (yyout,"%s es un identificador\n", yytext);
          numIDs++;
      }

{numero}  {
          fprintf (yyout,"%s es un número\n", yytext);
          numNumeros++;
      }

{literal}  {
          fprintf (yyout,"%s es un literal\n", yytext);
          numLiterales++;
      }

\(  {
          fprintf (yyout,"%s es un parentesis abierto\n", yytext);
          numParAbier++;
    }

\)  {
          fprintf (yyout,"%s es un parentesis cerrado\n", yytext);
          numParCerr++;
    }

\[  {
          fprintf (yyout,"%s es un parentesis cuadrado abierto\n", yytext);
          numCuadAbier++;
    }

\]  {
          fprintf (yyout,"%s es un parentesis cuadrado cerrado\n", yytext);
          numCuadCerr++;
    }

\{  {
          fprintf (yyout,"%s es un corchete abierto\n", yytext);
          numCorchAbier++;
    }

\}  {
          fprintf (yyout,"%s es un corchete cerrado\n", yytext);
          numCorchCerr++;
    }


.* {/*No hace nada*/}

%%

int main (int argc, char** argv)
{
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
