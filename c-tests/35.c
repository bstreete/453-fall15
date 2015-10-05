/* 1 

Tests invalid characters in string constants

Should error */

void main (int bac_on) { 
	char x[5]; 

	x = "1\"2"; 

	char y[99];

	y = "\n";

	char xy[100]; 	
	xy = "asdfasdfafsd\n";
	xy = "diqweroqiucvn \t \nasd\fasdfa";
}