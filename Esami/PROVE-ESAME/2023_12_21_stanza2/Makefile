CFLAGS=-ansi -Wpedantic -Wall -D_REENTRANT -D_THREAD_SAFE -D_POSIX_C_SOURCE=200112L -D_DEFAULT_SOURCE 

LIBRARIES=-lpthread

all:	due.exe

due.exe:	due.o DBGpthread.o
	gcc -o due.exe due.o DBGpthread.o ${LIBRARIES}

due.o:	due.c DBGpthread.h printerror.h
	gcc -c ${CFLAGS} due.c

DBGpthread.o:	DBGpthread.c printerror.h
	gcc ${CFLAGS} -c DBGpthread.c

.PHONY:	clean

clean:
	-rm -f due.o DBGpthread.o due.exe
