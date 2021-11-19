%option noyywrap
%option nounput
%option noinput

%{
#include "2.h" // For the token types from bison.
%}

%%

[0-9]+  return num;
"("     return '(';
")"     return ')';
"+"     return '+';
"-"     return '-';
"*"     return '*';
"/"     return '/';
<<EOF>> return EOF;
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          return(EXIT_FAILURE); }
