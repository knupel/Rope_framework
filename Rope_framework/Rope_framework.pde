/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

/**
* pattern marble example
* 2021-2021
* v 0.0.1
*
* from Lode Vandevenne algorithm
* https://lodev.org/cgtutor/randomnoise.html
*
* methods
*
* void marble_detail(int detail);
* PGraphics pattern_marble(int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
*/


PGraphics pattern_marble;
// x_period and y_period together define the angle of the lines
// x_period and y_period both 0 ==> it becomes a normal clouds or turbulence pattern
float x_period = 5.0; //defines repetition of marble lines in x direction
float y_period = 10.0; //defines repetition of marble lines in y direction

// turb_power = 0 ==> it becomes a normal sine pattern
float turb_power = 5.0; //makes twists
float turb_size = 32.0; //initial size of the turbulence

int turbulence = 2;
float scale = 3.0;

int detail = 3;


void setup() {
	size(800,512,P2D);
	colorMode(HSB,360,100,100,100);
	rope_version();
	background(r.RED);
	marble_detail(2);
	pattern_marble = pattern_marble(width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	image(pattern_marble);
}

void draw() {}

void mousePressed() {
	background(r.RED);
	x_period = random(0,10);
	y_period = random(0,10);
	turb_power = random(0,10.0);
	turb_size = random(0,64.0);
	turbulence = int(random(20));
	scale = random(10);
	
	detail = (int)random(1,15);
	marble_detail(detail);
	pattern_marble = pattern_marble(width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	image(pattern_marble);
}
