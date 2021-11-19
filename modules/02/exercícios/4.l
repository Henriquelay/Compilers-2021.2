%option noyywrap
%option nounput
%option noinput

%{
#include "4.h" // For the token types from bison.
%}

%%
[ \t]   /* no op */
[0-9]+  {yylval = atoi(yytext); return NUM;}
"("     return LPAR;
")"     return RPAR;
"+"     {yylval = '+'; return PLUS;}
"-"     {yylval = '-'; return MINUS;}
"*"     {yylval = '*'; return STAR;}
"/"     {yylval = '/'; return SLASH;}
[<<EOF>>\n] return EOF;
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          return(EXIT_FAILURE); }
