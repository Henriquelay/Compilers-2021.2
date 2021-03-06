%defines "2.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}
%token num
%token '('
%token ')'
%token '+'
%token '-'
%token '*'
%token '/'
%%
expr: num | '(' expr ')' | expr op expr ;
op: '+' | '-' | '*' | '/' ;
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
