all: scattered.elf swa.elf wsa.elf plink.elf

scattered.elf:main.o weak.o strong.o
	gcc -o $@ $^

swa.elf: main.o libgreetings_sw.a
	gcc -o $@ $^

wsa.elf: main.o libgreetings_ws.a
	gcc -o $@ $^

plink.elf: main.o greetings.o
	gcc -o $@ $^

main.o:main.c

weak.o:weak.c

strong.o:strong.c

greetings.o: weak.o strong.o
	ld -r -o $@ $^

libgreetings_sw.a: strong.o weak.o
	ar qc $@ $^

libgreetings_ws.a: weak.o strong.o
	ar qc $@ $^

.PHONY:clean
clean:
	rm -f *.o *.elf *.a
