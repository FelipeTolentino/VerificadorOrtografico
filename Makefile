CFLAGS=-O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wno-unused-but-set-variable -Wshadow
LIBS=-lm
EXECUTAVEL=EP3

all: $(EXECUTAVEL)

$(EXECUTAVEL): main.o Util.o Arvore.o Fila.o
	gcc main.o Util.o Arvore.o Fila.o $(LIBS) -o $(EXECUTAVEL)

main.o: main.c
	gcc $(CFLAGS) -c main.c

Util.o: Util.c
	gcc $(CFLAGS) -c Util.c

Arvore.o: Arvore.c
	gcc $(CFLAGS) -c Arvore.c

Fila.o: Fila.c
	gcc $(CFLAGS) -c Fila.c

clean: 
	rm -rf *.o $(EXECUTAVEL)

memcheck: $(EXECUTAVEL)
	valgrind --tool=memcheck --leak-check=full ./$(EXECUTAVEL) -d Dicionario.txt -t TextoExemplo.txt
	
run: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d Dicionario.txt -t TextoExemplo.txt

runavl: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d Dicionario.txt -t TextoExemplo.txt -avl

randrun: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d RandDicionario.txt -t TextoExemplo.txt

sortrun: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d SortDicionario.txt -t TextoExemplo.txt
	
testrun: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d DicionarioTeste.txt -t TextoExemplo.txt
	

run2: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d Dicionario2.txt -t TextoExemplo2.txt

runavl2: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d Dicionario2.txt -t TextoExemplo2.txt -avl

randrun2: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d RandDicionario2.txt -t TextoExemplo2.txt
	
testrun2: $(EXECUTAVEL) 
	./$(EXECUTAVEL) -d DicionarioTeste2.txt -t TextoExemplo2.txt
	
	
