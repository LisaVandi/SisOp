CFLAGS=-ansi -Wpedantic -Wall -D_REENTRANT -D_THREAD_SAFE -D_POSIX_C_SOURCE=200112L -D_DEFAULT_SOURCE 
#questo flag serve per trovare gli header files che sono nella directory modules.
MODULES_DIR=./modules
LIBRARIES=-lpthread

all:	tre.exe

tre.exe:	tre.o ${MODULES_DIR}/DBGpthread.o
	gcc -o tre.exe tre.o DBGpthread.o ${LIBRARIES}

tre.o:	tre.c ${MODULES_DIR}/DBGpthread.h ${MODULES_DIR}/printerror.h
	gcc -c -I${MODULES_DIR} ${CFLAGS} tre.c

${MODULES_DIR}/DBGpthread.o:	${MODULES_DIR}/DBGpthread.c ${MODULES_DIR}/printerror.h
	gcc -c ${CFLAGS} -I${MODULES_DIR} ${MODULES_DIR}/DBGpthread.c

.PHONY:	clean

clean:
	-rm -f tre.o DBGpthread.o tre.exe
