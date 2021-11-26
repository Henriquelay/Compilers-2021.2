%option noyywrap
%option nounput
%option noinput

%{
#include "1.h"
%}
%%
"("     return LPAR;
")"     return RPAR;
a       return A;
.       exit(EXIT_FAILURE);
