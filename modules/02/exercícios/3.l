%option noyywrap
%option nounput
%option noinput

%{
#include "3.h" // For the token types from bison.
%}

%%
[ \t]   /* no op */
[0-1]+  return expr;
"("     return '(';
")"     return ')';
"if"    return if_token;
"other" return other;
"else"  return else_token;

<<EOF>> return EOF;
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          return(EXIT_FAILURE); }
