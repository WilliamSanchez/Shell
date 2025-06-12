#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/wait.h>
#include <stdbool.h>
#include <stdarg.h>

bool do_exec(int count, ...)
{
    va_list args;
    va_start(args, count);
    char * command[count+1];
    int i;
    for(i=0; i<count; i++)
    {
        command[i] = va_arg(args, char *);
    }
    command[count] = NULL;
    command[count] = command[count];

/*
 * TODO:
 *   Execute a system command by calling fork, execv(),
 *   and wait instead of system (see LSP page 161).
 *   Use the command[0] as the full path to the command to execute
 *   (first argument to execv), and use the remaining arguments
 *   as second argument to the execv() command.
 *
*/

    printf("\n\n======== Starting process do_exec ========\n");    
        		
    printf("\n\nCommand :%s\n",command[0]);
    for(int i=1; i<count;i++)
   	printf("Arg[%d] :%s\n",i,command[i]);
    printf("\n");
    	
    #define pdebug(...)	
    //fd[0] -> read
    //fd[1] -> write
    //int result=0;      
     
    pid_t pid1 = fork(); 
    switch(pid1)
    {
    	case -1: /*Error*/
    		return false;
    	case 0: /*Child*/
    		printf("Child\n"); 
    		if(execv(command[0],command) == -1)
    			return false;
    	default: /*Parent*/    	  	     		
    		if(waitpid(pid1,NULL,0) == -1)
    			return false;
    		printf("Parent\n"); 
    		pdebug("Parent\n");
    		va_end(args);
    		return true; 		    		
    }  
}

int main(){
    
    if(do_exec(2, "echo", "Testing execv implementation with echo") == true)
        printf("\n[MAIN]    return true\n");
    else
        printf("\n[MAIN]    return false\n");

    if(do_exec(3, "/usr/bin/test","-f","echo") == true)
        printf("\n[MAIN]    return true\n");
    else
        printf("\n[MAIN]    return false\n");
/*
    if(do_exec(3, "/usr/bin/test","-f","/bin/echo") == true)
        printf("\n[MAIN]    return true\n");
    else
        printf("\n[MAIN]    return false\n");
*/
   return 0;
}

/*

    printf("Running tests at %s : function %s\n",__FILE__,__func__);
    TEST_ASSERT_FALSE_MESSAGE(do_exec(2, "echo", "Testing execv implementation with echo"),
             "The exec() function should have returned false since echo was not specified"
             " with absolute path as a command and PATH expansion is not performed.");
    TEST_ASSERT_FALSE_MESSAGE(do_exec(3, "/usr/bin/test","-f","echo"),
             "The exec() function should have returned false since echo was not specified"
             " with absolute path in argument to the test executable.");
    TEST_ASSERT_TRUE_MESSAGE(do_exec(3, "/usr/bin/test","-f","/bin/echo"),
             "The function should return true since /bin/echo represents the echo command"
             " and test -f verifies this is a valid file");

*/
