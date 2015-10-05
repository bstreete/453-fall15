/* 1 

Tests invalid characters in string constants

Should error */

void main (int bac_on) { 
	char x[5]; 

	x = "
		asdfasdf";
	x = "1 
	 2"; 
	char y[99];

	y = "\n";

	char xy[100]; 	
	xy = "asdfasd
						fafs
								d";
	xy = "diqweroqiucvn \t asd\fasdfa";
}