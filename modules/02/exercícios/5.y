%defines "5.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
void mathOperator(char op, int val);

int resultBuf = 0;
%}

%token NUM LPAR RPAR STAR SLASH
%left PLUS MINUS
%left STAR SLASH

%%

expr: NUM | LPAR expr RPAR
    | expr math_op expr ;
math_op: PLUS | MINUS | STAR | SLASH ;

%%

void mathOperator(char op, int val) {
  switch (op) {
    case '+':
      resultBuf += val;
    break;
    case '-':
      resultBuf -= val;
    break;
    case '*':
      resultBuf *= val;
    break;
    case '/':
      resultBuf /= val;
    break;
    default: puts("Operator not implemented!"); exit(1);
  }
}

int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL! Result = %d\n", resultBuf);
    else                printf("PARSE FAILED!\n");
    return 0;
}
