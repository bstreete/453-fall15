/* 0

Tests for basic syntax

	Should recognize a handful of global variable declarations before
	a simple function that takes no arguments. 

	Should not error	*/

int x;
extern int y;
char ch;
extern char ch2 ;

int func (void) {
	return;
}