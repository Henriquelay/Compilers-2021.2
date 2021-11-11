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

%{
    #include <stdio.h>

    void printsToken(char* token) {
        printf("%d: %s -> %s\n", yylineno, yytext, token);
    }
%}

%option yylineno
%%
 /* Any C comment is acceptable as a comment anywhere in a program in both Yacc and Lex, BUT: */
 /*   When using Lex or Yacc whitespace is important, so \/* comment *\/ written into your program touching the LHS of your text will NOT WORK! */
 /*       to make it work, you must add a tab or space to the beginning of the line, to shove it to C code, and not Lex or Yacc code. */
 /* https://stackoverflow.com/a/37284796/12921102 */

[ \t\n]+        /* Ignorar espaços e quebras, nao sao elementos lexicos */
"{"[^}]*"}"     /* Comentários */

 /* Palavras reservadas */
begin               printsToken("BEGIN");
bool                printsToken("BOOL");
else                printsToken("ELSE");
end                 printsToken("END");
false               printsToken("FALSE");
if                  printsToken("IF");
int                 printsToken("INT");
program             printsToken("PROGRAM");
read                printsToken("READ");
real                printsToken("REAL");
repeat              printsToken("REPEAT");
string              printsToken("STRING");
then                printsToken("THEN");
true                printsToken("TRUE");
until               printsToken("UNTIL");
var                 printsToken("VAR");
write               printsToken("WRITE");

 /* Operadores */
":="                printsToken("ASSIGN");
"="                 printsToken("EQ");
"<"                 printsToken("LT");
"+"                 printsToken("PLUS");
"-"                 printsToken("MINUS");
"*"                 printsToken("TIMES");
"/"                 printsToken("OVER");
"("                 printsToken("LPAR");
")"                 printsToken("RPAR");
";"                 printsToken("SEMI");

 /* Valores estáticos esqueci o nome chique */
[0-9]*\.[0-9]+      printsToken("REAL_VAL");
[0-9]+              printsToken("INT_VAL");
\"[^\"]*\"          printsToken("STR_VAL");

[a-zA-Z😀-🔲][a-zA-Z0-9😀-🔲]*  printsToken("ID"); /* Identificadores (variaveis) */

.|\n|\r                {printf("LEXICAL ERROR (%d): Unknown symbol %s", yylineno, yytext); return(1);}

%%

int main() {
    yylex();
    return 0;
}

/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() {
    return 1;
}
