#include <stdlib.h>
int main()
{
	int *x = malloc(10 * sizeof(int));
	x[10] = 0;
	return 0;
}
