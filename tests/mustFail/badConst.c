// kcc-assert-error(00035)
#include <stdio.h>

int bad(void){
	const int x = 0;
	x = 5;
	return x;
}

int main(void){
	bad();
	return 0;
}
