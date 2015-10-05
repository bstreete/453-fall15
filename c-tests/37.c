/* 1 

Tests invalid characters in identifiers

Should error many times*/

void main (int bac_on) { 
	char x, x!u; 
	x = 1; 
	x = 1 + 2; 

	int 1x;
	x = 1; 
	x = 1 + 2; 
	
	char _1x; 
	x = 1; 
	x = 1 + 2; 
	
	int y_$; 
	x = 1; 
	x = 1 + 2; 
	
	int y-1;
	x = 1; 
	x = 1 + 2; 
	
	char x@3; 
}