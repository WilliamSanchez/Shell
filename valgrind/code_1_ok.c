#include <stdlib.h>
#include <stdio.h>
int main()
{
	int *x = malloc(10 * sizeof(int));
	x[9] = 0;
	x[0] = 10;
	printf("Value position 10 = %d",x[9]);
	free(x);
	return 0;
}
