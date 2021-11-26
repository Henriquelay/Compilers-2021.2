%option noyywrap
%option nounput
%option noinput

%{
#include "3.h" // For the token types from bison.
%}

%%
[ \t]   /* no op */
 /*[0-1]+  return expr;*/
0       return false_token;
1       return true_token;
"("     return '(';
")"     return ')';
"if"    return if_token;
"other" return other;
"else"  return else_token;

<<EOF>> return EOF;
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          return(EXIT_FAILURE); }
