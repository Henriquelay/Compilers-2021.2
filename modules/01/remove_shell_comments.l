%%
[^#] {ECHO;}
#.*\n {} /* nop */
%%

int yywrap() {
    return 1;
}
