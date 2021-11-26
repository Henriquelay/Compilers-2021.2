/*** Sample EZ Lang code - computes factorial
 program fact;
 var
     int x;
     int fact;
 begin
     read x; { input an integer }
     if 0 < x then { don’t compute if x <= 0 }
         fact := 1;
         repeat
             fact := fact * x;
             x := x - 1;
         until x = 0
         write fact; { output factorial of x }
     end
 end ***/

/*** Palavras reservadas:
begin
bool
else
end
false
if
int
program
read
real
repeat
string
then
true
until
var
write
Símbolos especiais:
:=
=
<
+
-
*
/
(
)
;
Constantes numericas e strings (exemplos):
42
4.2
"abc" ***/

/* Alem dos tokens, EZLang segue as convenções lexicas a seguir. Comentarios sao cercados por chaves e nao podem ser aninhados. O formato do cadigo e livre, isto é, nao existem colunas ou posições específicas para uma dada operaçao. Espaços sao formados por branco, tabulações e quebras de linhas. */
%option noyywrap
%option yylineno
%option nounput
%option noinput

%{
#include "tarefa2.h"
%}

ignore              [ \t\n\r]+
comments            "{"[^}]*"}"

real                [0-9]*\.[0-9]+
int                 [0-9]+
str                 \"[^\"]*\"

id                  [a-zA-Z😀-🔲][a-zA-Z0-9😀-🔲]*

%%
 /* Any C comment is acceptable as a comment anywhere in a program in both Yacc and Lex, BUT: */
 /*   When using Lex or Yacc whitespace is important, so / * comment * / written into your program touching the LHS of your text will NOT WORK! */
 /*       to make it work, you must add a tab or space to the beginning of the line, to shove it to C code, and not Lex or Yacc code. */
 /* https://stackoverflow.com/a/37284796/12921102 */

{ignore}       /* Ignorar espaços e quebras, nao sao elementos lexicos */
{comments}     /* Comentários */

 /* Palavras reservadas */
"begin"             return BEGIN_TOK;
"bool"              return BOOL;
"else"              return ELSE;
"end"               return END;
"false"             return FALSE;
"if"                return IF;
"int"               return INT;
"program"           return PROGRAM;
"read"              return READ;
"real"              return REAL;
"repeat"            return REPEAT;
"string"            return STRING;
"then"              return THEN;
"true"              return TRUE;
"until"             return UNTIL;
"var"               return VAR;
"write"             return WRITE;

 /* Operadores */
":="                return ASSIGN;
"="                 return EQ;
"<"                 return LT;
"+"                 return PLUS;
"-"                 return MINUS;
"*"                 return TIMES;
"/"                 return OVER;
"("                 return LPAR;
")"                 return RPAR;
";"                 return SEMI;

 /* Valores estáticos esqueci o nome chique */
{real}              return REAL_VAL;
{int}               return INT_VAL;
{str}               return STR_VAL;

{id}                return ID; /* Identificadores (variaveis) */

.                   {printf("LEXICAL ERROR (%d): Unknown symbol %s", yylineno, yytext);
                     exit(EXIT_FAILURE);}                     
