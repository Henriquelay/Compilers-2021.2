# Feito por Henrique Layber <henriquelayber@gmail.com>], 12/11/2021 - Criação
# Livre uso, modificação e distribuição, desde que não remova cabeçalho
# Caso contrário, distribuição não autorizada
CC 		= cc
YACC 	= bison
LEX		= flex
CCFLAGS = -Wall
YACCFLAGS = -Wall -Wcounterexamples

clean:
	rm -f *.o *.output *.c *.h *.out *.h.gch

%.out: %.l.c %.h %.y.c
# @echo "bin @ is '$@' < is '$<' * is '$*' ? is '$?'"
	$(CC) $(CCFLAGS) $^ -ly -o $@
	@rm $*.y.c
	@echo "Done."

%.y.c %.h: %.y
# @echo "parser @ is '$@' < is '$<' * is '$*' ? is '$?'"
	$(YACC) $(YACCFLAGS) --output=$^.c $^

%.l.c: %.l
# @echo "scanner @ is '$@' < is '$<' * is '$*' ? is '$?'"
	$(LEX) --outfile=$<.c $<
