/* 0

	Basic Syntax Test

	Tests while statement syntax. 

	Should not error	*/

int func1 (void) {

	while (1 == 2)
		return 1;

	while (2 < 1) 
		while (3 > 1)
			return 2;
}