CFLAGS=-ansi -Wpedantic -Wall -D_THREAD_SAFE -D_REENTRANT -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=200112L
LIBRARIES=-lpthread

all:	es0_premortem.exe 

es0_premortem.exe:	es0_premortem.o
	gcc -o es0_premortem.o ${LIBRARIES}

es0_premortem.o:	es0_premortem.c
	gcc -c ${CFLAGS} es0_premortem.c

.PHONY:	clean

clean:
	-rm -f es0_premortem.exe es0_premortem.o
