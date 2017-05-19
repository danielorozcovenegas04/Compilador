%{
	/*Comentarios*/
	int nums = 0;
	int strs = 0;
%}

%option noyywrap

NUM		[0-9]

%%
"fin"	{
			printf ("NUMS: %d\nSTRS: %d", nums, strs);
			return 0;
		}
{NUM}+	{
			printf ("%s es NUM\n", yytext);
			nums++;
		}
[a-z]+  {
			printf ("%s es STR\n", yytext);
			strs++;
		}
%%

int main (void) {
	yylex();
}
