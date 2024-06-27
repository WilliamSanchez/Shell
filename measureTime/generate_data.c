#include <stdio.h>
#include <syslog.h>
#include <time.h>
#include <unistd.h>

int main(){

   syslog(LOG_INFO,"TESTE DE PROVA");
   int cont = 0; 
   while(cont <= 30){
        cont++;
   	syslog(LOG_INFO,"TAG: %d data = %d",cont, cont*cont - 2*cont-5);
   	sleep(1);
   }
   
   
   return 0;
}
