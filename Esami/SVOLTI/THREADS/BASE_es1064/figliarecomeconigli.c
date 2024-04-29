/* file:  figliarecomeconigli.c */

#ifndef _THREAD_SAFE
	#define _THREAD_SAFE
#endif
#ifndef _POSIX_C_SOURCE
	#define _POSIX_C_SOURCE 200112L
#endif

#include "printerror.h"

#include <unistd.h> 
#include <stdlib.h> 
#include <stdio.h> 
#include <stdint.h>
#include <inttypes.h>
#include <pthread.h> 

#include "DBGpthread.h"

#define MAXNUMTHREAD 5

pthread_attr_t attr;

/* dati da proteggere */
pthread_mutex_t  mutex;
intptr_t counter=0; 
int	numthreads=0;

void *figlio (void *arg) 
{ 
	pthread_t    th; 
	int  rc;
	char Plabel[128];
	intptr_t indice, newIndice;

	indice=(intptr_t)arg;
	sprintf(Plabel,"Th_%" PRIiPTR "",indice);

	/* stampo a video l'indice del thread e quanti threads ci sono */
	DBGpthread_mutex_lock(&mutex,Plabel); 
	printf("%s %i\n", Plabel, numthreads );
	fflush(stdout);
	DBGpthread_mutex_unlock(&mutex,Plabel); 

	while(1) {
		/* attendo un secondo prima di provare a creare un figlio */
		sleep(1);

		/* COMPLETARE DA QUI */
        DBGpthread_mutex_lock(&mutex, Plabel);
        if (numthreads < MAXNUMTHREAD) {
            newIndice=counter;
            counter++;
            numthreads++;

            rc=pthread_create(&th, &attr, figlio, (void*) newIndice);
            if(rc) PrintERROR_andExit(rc, "pthread_create has failed");
            DBGpthread_mutex_unlock(&mutex, Plabel);
        }
        else {
            numthreads--; /* perché il thread termina subito */
            DBGpthread_mutex_unlock(&mutex, Plabel);
            pthread_exit(NULL);
        }    
      

		/* se ci sono gia' piu' di 5 thread allora 
		   il mio thread termina subito,
		   altrimenti crea un figlio e ricomincia il loop
		*/

		/* COMPLETARE FINO A QUI */

	}
	pthread_exit(NULL); 
} 

int main ( int argc, char* argv[] ) 
{ 
	pthread_t    th; 
	int  rc;
	intptr_t newIndice;

	pthread_attr_init(&attr);
	pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_DETACHED);

	rc = pthread_mutex_init(&mutex, NULL); 
	if( rc ) PrintERROR_andExit(rc,"pthread_mutex_init failed");

	for(;;) {
		/* creo thread ogni 5 secondi */
		sleep(5);

		/* COMPLETARE DA QUI */
		DBGpthread_mutex_lock(&mutex, "main");
		/* COMPLETARE FINO A QUI */

		/* incremento di 1 il contatore globale che identifica i thread */
		newIndice=counter;
		counter++;
		/* incremento di 1 il contatore globale dei thread esistenti */
		numthreads++;
		/* creo il nuovo thread, 
		   attenti che creo infiniti thread e non faccio la join
		   percio' creo thread detached!
		*/
		rc=pthread_create(&th,&attr,figlio,(void*)newIndice); 
		if(rc) PrintERROR_andExit(rc,"pthread_create failed");

		/* COMPLETARE DA QUI */
        DBGpthread_mutex_unlock(&mutex, "main");
		/* COMPLETARE FINO A QUI */

	}

	pthread_exit(NULL);
	return(0); 
} 
  
