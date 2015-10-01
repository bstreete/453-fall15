/* 0

	Basic Syntax Test

	Tests for loop statement syntax. 

	Should not error	*/

void func1 (void) {

	int x, y; 

	for (x = 0; x < 1; x = x + 1) 
		return x; 

	for (y = 1; y < 2; y = y - 1) 
		return y; 

	for (z = 0; z < 10; z = z + 2)
		for (a = 1; a < 3; a = a + 1)
			b[z] = a + z;
}