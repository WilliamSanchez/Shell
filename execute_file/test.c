#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>

static void sig_handler(int sig_num)
{
   printf("End simulation\n");
   exit(EXIT_SUCCESS);
}

int main()
{

   signal(SIGINT,sig_handler);

   int cont = 0;
   
   while(1)
   {
       printf("[%d] Hi how are you\n", cont++);
       sleep(1);
   }

    exit(EXIT_SUCCESS);
}
