/* 0

	Basic Syntax Test

	Tests if statement syntax. 

	Should not error	*/

int func1 (void) {

	if (1 != 2) 
		return 1;

	else
		return 2; 
}

int func2 (void) {
	if (1)
		return;
}