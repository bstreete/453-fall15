/* 0 
	 Valid tests from Piazza */
void stringStuff(void){
	string = "stuffinhere";
	string2 = "this other stuff";

	char1 = 'o';
	char2 = '[';

	result = ( char1 > char2 );
	result = string != string2;
}

void binop(void){
	int d, c, b, a;
	a = 1 + 2;
	b = 5 * 3;
	c = 234 - 1;
	d = 111/345;
	d = !d;
	a = -a;
	
	a = b[10];
	b[10] = b;
}

void relop(void){
	int r, t, y, g;
	r = 1;
	t = 0;

	result = r == 5;
	result = ( r == 5);
	result = r && t; 
	result = ( r == 5);
	result = r || t;	
	result = ( r >= 5);
	result = ( r <= 5);
	result = ( r < 5);
	result = ( r > 5);
	result = ( r != 5);
}
