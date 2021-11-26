%defines "7.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);

int resultBuf = 0;
%}

%token NUM LPAR RPAR UMINUS
%left PLUS MINUS
%left STAR SLASH
%precedence UMINUS
%right POW

%%

expr: NUM
    | LPAR expr LPAR
    | expr PLUS expr
    | expr MINUS expr
    | expr STAR expr
    | expr SLASH expr
    | MINUS expr %prec UMINUS
    | expr POW expr

%%

int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL! Result = %d\n", resultBuf);
    else                printf("PARSE FAILED!\n");
    return 0;
}
