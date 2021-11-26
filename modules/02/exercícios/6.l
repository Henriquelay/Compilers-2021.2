%option noyywrap
%option nounput
%option noinput

%{
#include "6.h" // For the token types from bison.
%}

%%
[ \t]   /* no op */
 /* [0-1]+  return expr; */
0       return ZERO;
1       return ONE;
"("     return LPAR;
")"     return RPAR;
"if"    return IF;
"other" return OTHER;
"else"  return ELSE;

[\n<<EOF>>] return EOF;
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          return(EXIT_FAILURE); }
