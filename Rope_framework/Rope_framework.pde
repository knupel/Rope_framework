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
* v 0.0.2
*
* based on Lode Vandevenne algorithm
* https://lodev.org/cgtutor/randomnoise.html
*
* methods
*
* matrice_marble(int w, int h);
* float [][] generate_matrice_2D(int w, int h, float min, float max): // the min and max value must be normal [0,1]
*
* PGraphics pattern_marble(int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
*
* PGraphics pattern_marble(float [][] matrix, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
* PGraphics pattern_marble_xyz(vec3 [][] matrix, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
*
* PGraphics pattern_marble_rgb(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
* PGraphics pattern_marble_hsb(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
*
* PGraphics pattern_marble_red(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
* PGraphics pattern_marble_green(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
* PGraphics pattern_marble_blue(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
*
* PGraphics pattern_marble_hue(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
* PGraphics pattern_marble_saturation(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
* PGraphics pattern_marble_brightness(PImage src, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);

*/


PGraphics pattern_marble;
PImage img_src;
// x_period and y_period together define the angle of the lines
// x_period and y_period both 0 ==> it becomes a normal clouds or turbulence pattern
float x_period = 5.0; //defines repetition of marble lines in x direction
float y_period = 10.0; //defines repetition of marble lines in y direction

// turb_power = 0 ==> it becomes a normal sine pattern
float turb_power = 5.0; //makes twists
float turb_size = 32.0; //initial size of the turbulence

int turbulence = 2;
float scale = 3.0;

void setup() {
	size(800,512,P2D);
	colorMode(HSB,360,100,100,100);
	rope_version();
	img_src = loadImage("jpg file/small_dame_hermine.jpg");
	surface.setSize(img_src.width, img_src.height);
	pattern_marble = pattern_marble(img_src, width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	image(pattern_marble);
}

void draw() {}

void mousePressed() {
	x_period = random(0,10);
	y_period = random(0,10);
	turb_power = random(0,10.0);
	turb_size = random(0,64.0);
	turbulence = int(random(20));
	scale = random(10);

	float which_one = random(1);
	if(which_one < 0.3) {
		println("pattern_marble is brightness mode");
		pattern_marble = pattern_marble_brightness(img_src, width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	} else if(which_one >=0.3 && which_one < 0.6) {
		println("pattern_marble is RGB mode");
		pattern_marble = pattern_marble_rgb(img_src, width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	} else {
		println("pattern_marble is HSB mode");
		pattern_marble = pattern_marble_hsb(img_src, width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	}
	image(pattern_marble);
}
