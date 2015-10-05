/* 0

Tests syntax for calling other functions

Should not error */

void main (int bac_on) { 
	int x,y; 

	x = atoi("1");
	y = x + sizeof(x); 

	if (sizeof(y) > 16) 
		x = 1;

	return sizeof(sizeof(x));
}