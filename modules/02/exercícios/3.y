%defines "3.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}
/* %token expr */
%token false_token
%token true_token
%token '('
%token ')'
%token other
%token if_token
%token else_token
%%
statement:      if-statement | other ;
if-statement:   if_token '(' bool ')' statement
              | if_token '(' bool ')' statement else_token statement
bool:   false_token | true_token ;

%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
