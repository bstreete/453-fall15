/* 0

	Basic Syntax Test

	Tests the different operators. 

	Should not error	*/

void func1 (void) {

	int x;

	x = 0; 

	/* Basic Binary Operators */
	x = x + 1; 
	x = x - 3; 
	x = x * 2; 
	x = x / 4; 

	/* Basic Relative Operators */
	if (x == y) 
		x = 5; 

	if (x != z)
		x = 4;

	if (x <= 2)
		x = 100; 

	if (x >= 5)
		x = 10; 

	if (x > 1) 
		x = 2;

	if (x < 5)
		x = 1;

	/* Logical Operators */
	if (x || 0)
		x = 2;

	if (x == 2 && x < 5)
		x = 3;

	/* Unary Operators */

	if (!(x == 1))
		x = -3 ;

	return;  
}