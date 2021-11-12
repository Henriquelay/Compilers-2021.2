%%
[A-Z]   {printf("%c", yytext[0]+32);} /* Uppercase and Lowercase are offset by 32 in ASCII */

