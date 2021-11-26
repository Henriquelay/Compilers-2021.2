%defines "tarefa2.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
extern int yylineno;
/* Primitive error handling. */
void yyerror (char const *s) {
    printf("SYNTAX ERROR (%d): %s\n", yylineno, s);
    exit(EXIT_FAILURE);
}
%}

%token BEGIN_TOK BOOL ELSE END FALSE IF INT PROGRAM READ REAL REPEAT STRING THEN TRUE UNTIL VAR WRITE ASSIGN EQ LT LPAR RPAR SEMI REAL_VAL INT_VAL STR_VAL ID
%left LT EQ
%left PLUS MINUS
%left TIMES OVER
%precedence UMINUS

%%

program: PROGRAM ID SEMI vars-sect stmt-sect ;
vars-sect: VAR opt-var-decl ;
opt-var-decl: %empty | var-decl-list ;
var-decl-list: var-decl-list var-decl | var-decl ;
var-decl: type-spec ID SEMI ;
type-spec: BOOL | INT | REAL | STRING ;
stmt-sect: BEGIN_TOK stmt-list END ;
stmt-list: stmt-list stmt | stmt ;
stmt: if-stmt | repeat-stmt | assign-stmt | read-stmt | write-stmt ;
if-stmt: IF expr THEN stmt-list END ;
| IF expr THEN stmt-list ELSE stmt-list END ;
repeat-stmt: REPEAT stmt-list UNTIL expr ;
assign-stmt: ID ASSIGN expr SEMI ;
read-stmt: READ ID SEMI ;
write-stmt: WRITE expr SEMI ;
expr: expr LT expr 
    | expr EQ expr
    | expr PLUS expr
    | expr MINUS expr
    | MINUS expr %prec UMINUS
    | expr TIMES expr
    | expr OVER expr
    | LPAR expr RPAR
    | TRUE
    | FALSE
    | INT_VAL
    | REAL_VAL
    | STR_VAL
    | ID

%%

int main() {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
