%option noyywrap
%option nounput
%option noinput

%{
#include "5.h" // For the token types from bison.
%}

%%
[ \t]   /* no op */
[0-9]+  {yylval = atoi(yytext); return NUM;}
"("     return LPAR;
")"     return RPAR;
"+"     return PLUS;
"-"     return MINUS;
"*"     return STAR;
"/"     return SLASH;
<<EOF>> return EOF;
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          return(EXIT_FAILURE); }
