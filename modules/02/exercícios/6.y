%defines "6.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}
%token ZERO ONE LPAR RPAR OTHER IF ELSE
%precedence RPAR
%precedence ELSE
%%
statement:      if_statement | OTHER ;
bool:           ZERO | ONE ;
if_statement:   IF LPAR bool RPAR statement
              | IF LPAR bool RPAR statement ELSE statement ;
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
