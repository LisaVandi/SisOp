/* file:  es2_banche.c */


#include <unistd.h> 
#include <stdlib.h> 
#include <stdio.h> 
#include <stdint.h>	/* uint64_t intptr_t */
#include <inttypes.h>	/* uint64_t  PRIiPTR */
#include <sys/time.h>	/* gettimeofday()    struct timeval */
#include <time.h>	/* nanosleep()    struct timespec */
#include <pthread.h> 

#include "printerror.h"

#define NUMBANCHE 2
#define NUMDEPOSITIPERBANCA 3
#define NUMPRELIEVIPERBANCA 2

typedef struct struttura {
	int indicebanca;
	int indicethread;
} STRUTTURA;

/* variabili da proteggere */
double T[NUMBANCHE];
int    N[NUMBANCHE];

/* variabili per la sincronizzazione */
pthread_mutex_t mutex[NUMBANCHE];

void *Depositi (void *arg) 
{ 
	char Clabel[128];
	int indicebanca;
	int indicethread;

	indicebanca=((STRUTTURA*)arg)->indicebanca;
	indicethread=((STRUTTURA*)arg)->indicethread;
	sprintf(Clabel,"D%iB%i" , indicethread, indicebanca);

	free(arg);

	while(1) 
	{
		int rc;
                struct timespec ts={0, 400000000L }; /* 4/10 sec */

		sleep(1);

		/* DEVO ENTRARE IN SEZIONE CRITICA */
		/* AGGIUNGERE CODICE PER ENTRARE IN SEZIONE CRITICA */
		rc=pthread_mutex_lock(&mutex[indicebanca]); 
		if (rc) PrintERROR_andExit(rc, "pthread_mutex_lock has failed"); 
		/* FINE AGGIUNTA */


		/* MODIFICO TOTALE DI BANCA E STAMPO VALORI */ 
		T[indicebanca] += 10.0;
		N[indicebanca] ++;
		printf("Deposito %s: N %d  T %f \n", Clabel, N[indicebanca], T[indicebanca] );
		fflush(stdout);
		nanosleep(&ts,NULL);

		/* ESCO DALLA SEZIONE CRITICA */
		/* AGGIUNGERE CODICE PER USCIRE DALLA SEZIONE CRITICA */
		rc=pthread_mutex_unlock(&mutex[indicebanca]); 
		if (rc) PrintERROR_andExit(rc, "pthread_mutex_unlock has failed"); 
		/* FINE AGGIUNTA */

	}
	pthread_exit(NULL); 
} 

void *Prelievi (void *arg) 
{ 
	char Clabel[128];
	int indicebanca;
	int indicethread;

	indicebanca=((STRUTTURA*)arg)->indicebanca;
	indicethread=((STRUTTURA*)arg)->indicethread;
	sprintf(Clabel,"P%iB%i" , indicethread, indicebanca);

	free(arg);

	while(1) 
	{
		int rc;
        struct timespec ts={0, 400000000L }; /* 4/10 sec */

		sleep(1);

		/* DEVO ENTRARE IN SEZIONE CRITICA */
		/* AGGIUNGERE CODICE PER ENTRARE IN SEZIONE CRITICA */
		rc= pthread_mutex_lock(&mutex[indicebanca]);
		if(rc) PrintERROR_andExit(rc, "pthread_mutex_lock has failed"); 
		/* FINE AGGIUNTA */

		/* MODIFICO TOTALE DI BANCA E STAMPO VALORI */ 
		T[indicebanca] -=9.0 ;
		N[indicebanca] ++;
		printf("Prelievo %s: N %d  T %f \n", Clabel, N[indicebanca], T[indicebanca] );
		fflush(stdout);
		nanosleep(&ts,NULL);

		/* ESCO DALLA SEZIONE CRITICA */
		/* AGGIUNGERE CODICE PER USCIRE DALLA SEZIONE CRITICA */
		rc=pthread_mutex_unlock(&mutex[indicebanca]);
		if (rc) PrintERROR_andExit(rc, "pthread_mutex_unlock has failed");  
		/* FINE AGGIUNTA */

	}
	pthread_exit(NULL); 
} 

void *BancadItalia (void *arg) 
{ 
	char Clabel[128];

	sprintf(Clabel,"BancadItalia" );

	while(1) 
	{
		int rc;
		int i;  int Num=0; double sum=0.0;

		/* DEVO ENTRARE IN SEZIONE CRITICA */
		/* AGGIUNGERE CODICE PER ENTRARE IN SEZIONE CRITICA */
		for (i=0; i<NUMBANCHE; i++) {
			rc = pthread_mutex_lock(&mutex[i]); 
			if (rc) PrintERROR_andExit(rc, "pthread_mutex_lock has failed"); 
		}
		/* FINE AGGIUNTA */


		/* CALCOLO LA SOMMA DEI DEPOSITI DI TUTTE LE BANCHE
		   e la metto in var locali 
		*/
		for( i=0; i<NUMBANCHE; i++ ) {
			Num += N[i];
			sum += T[i];
		}

		/* ESCO DALLA SEZIONE CRITICA */
		/* AGGIUNGERE CODICE PER USCIRE DALLA SEZIONE CRITICA */
		for (i = NUMBANCHE -1 ; i >= 0; i--) {
			rc = pthread_mutex_unlock(&mutex[i]); 
			if (rc) PrintERROR_andExit(rc, "pthread_mutex_unlock has failed"); 
		}
		/* FINE AGGIUNTA */


		/* STAMPO SOMMA CALCOLATA */ 
		printf("Report BancaDItalia: Num %d  sum %f \n", Num, sum);
		fflush(stdout);

		sleep(30);
	}
	pthread_exit(NULL); 
} 

int main (int argc, char* argv[] ) 
{ 
	pthread_t   th; 
	int  rc;
	int i,k;
	STRUTTURA *ptr;

	/* INIZIALIZZO VAR MUTEX */
	for( i=0; i<NUMBANCHE; i++ ) {
		rc = pthread_mutex_init( &mutex[i], NULL); 
		if( rc ) PrintERROR_andExit(rc,"pthread_mutex_init failed");
	}

	/* INIZIALIZZO VAR Totale e Contatori operazioni */
	for( i=0; i<NUMBANCHE; i++ ) {
		T[i]=0.0;
		N[i]=0;
	}


	/* FACCIO PARTIRE pthread  */
	for(i=0;i<NUMBANCHE;i++) {
		/* lancio  thread Depositi */
		for(k=0;k<NUMDEPOSITIPERBANCA;k++) {
			ptr=malloc( sizeof(STRUTTURA) );
			if( !ptr ) 
				{ printf("malloc failed\n");fflush(stdout);exit(9); }
			ptr->indicebanca=i;
			ptr->indicethread=k;
			rc=pthread_create( &th, NULL,Depositi,(void*)ptr); 
			if(rc) PrintERROR_andExit(rc,"pthread_create failed");
		}
		/* lancio  thread Prelievi */
		for(k=0;k<NUMPRELIEVIPERBANCA;k++) {
			ptr=malloc( sizeof(STRUTTURA) );
			if( !ptr ) 
				{ printf("malloc failed\n");fflush(stdout);exit(9); }
			ptr->indicebanca=i;
			ptr->indicethread=k;
			rc=pthread_create( &th, NULL,Prelievi,(void*)ptr); 
			if(rc) PrintERROR_andExit(rc,"pthread_create failed");
		}
	}

	/* lancio thread BancadItalia */
	/* BancadItalia((void*)NULL); */
	rc=pthread_create( &th, NULL,BancadItalia,(void*)NULL ); 
	if(rc) PrintERROR_andExit(rc,"pthread_create failed");

	pthread_exit(NULL); 

	return(0); 
}