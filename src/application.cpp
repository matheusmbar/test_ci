
#include <stdio.h>
#include "application.h"

int func0 (void){
	printf ("Teste");
	return 0;
}

void func1 (void){
	return;
}

void func2 (uint8_t i){
	if (i > 10){
		return;
	}
	return;
}