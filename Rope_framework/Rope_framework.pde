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
* v 0.1.0
*
* based on Lode Vandevenne algorithm
* https://lodev.org/cgtutor/randomnoise.html
*
* methods
*
*
*/


PGraphics pattern;
PImage img_src;
// x_period and y_period together define the angle of the lines
// x_period and y_period both 0 ==> it becomes a normal clouds or turbulence pattern
float x_period = 5.0; //defines repetition of marble lines in x direction
float y_period = 10.0; //defines repetition of marble lines in y direction

// turb_power = 0 ==> it becomes a normal sine pattern
float turb_power = 5.0; //makes twists
float smooth = 32.0; //initial size of the turbulence

void setup() {
	size(800,512,P2D);
	colorMode(HSB,360,100,100,100);
	rope_version();
	img_src = loadImage("jpg file/small_dame_hermine.jpg");
	surface.setSize(img_src.width, img_src.height);
	// surface.setSize(int(img_src.width *1.5), int(img_src.height *0.5));
	pattern = pattern_marble_brightness(img_src, width, height);
	image(pattern);
}

void draw() {}

void mousePressed() {
	x_period = random(0,10);
	y_period = random(0,10);
	turb_power = random(0,10.0);
	smooth = random(0,64.0);
	float inc_x = random(1) / 10;
	float inc_y = random(1) / 10;
	float inc_z = random(1) / 10;
	float min_col = random(1);
	float max_col = random(min_col,1);
	float min_ang = -PI;
	float max_ang = PI;
	float angle_x = random(min_ang,max_ang);
	float angle_y = random(min_ang,max_ang);
	float angle_z = random(min_ang,max_ang);

	set_pattern_turbulence(turb_power); // pattern : marble
	set_pattern_smooth(smooth); // pattern : random, marble, noise
	set_pattern_period(x_period, y_period); // pattern : marble
	set_pattern_size(128, 128); // pattern : random, noise and marble when no PImage used
	set_pattern_range(0, 1); // pattern : random and marble when no PImage used
	set_pattern_increment(inc_x, inc_y, inc_z); // pattern : noise and marble when no PImage used

	// int which_one = floor(random(7));
	int which_one = floor(random(10));
	// int which_one = 6;
	if(which_one == 0) {
		println(ANSI_RED+"new MARBLE"+ANSI_WHITE);
		pattern = pattern_marble(width, height);
	} else if(which_one == 1) {
		println(ANSI_RED+"new IMAGE MARBLE BRIGHTNESS"+ANSI_WHITE);
		pattern = pattern_marble_brightness(img_src, width, height);
	} else if(which_one == 2) {
		println(ANSI_RED+"new IMAGE MARBLE RGB"+ANSI_WHITE);
		pattern = pattern_marble_rgb(img_src, width, height);
	} else  if(which_one == 3) {
		println(ANSI_RED+"new IMAGE MARBLE HSB"+ANSI_WHITE);
		pattern = pattern_marble_hsb(img_src, width, height);
	} else if(which_one == 4) {
		println(ANSI_GREEN+"new IMAGE"+ANSI_WHITE);
		pattern = pattern_img(img_src, width, height);
	} else if(which_one == 5) {
		println(ANSI_GREEN+"new RANDOM MONO"+ANSI_WHITE);
		pattern = pattern_rand(width, height);
	}  else if(which_one == 6) {
		println(ANSI_GREEN+"new RANDOM XYZ"+ANSI_WHITE);
		set_pattern_range(min_col, max_col);
		pattern = pattern_rand_xyz(width, height);
	} else if(which_one == 7) {
		println(ANSI_GREEN+"new NOISE MONO"+ANSI_WHITE);
		set_pattern_size(width, height);
		set_pattern_smooth(1);
		pattern = pattern_noise(width, height, 0.01, 0.03, 0.04);
	} else if(which_one == 8) {
		println(ANSI_GREEN+"new NOISE XYZ"+ANSI_WHITE);
		set_pattern_size(width, height);
		set_pattern_smooth(1);
		set_pattern_range(min_col, max_col);
		pattern = pattern_noise_xyz(width, height);
	} else if(which_one == 9) {
		println(ANSI_GREEN+"new NOISE XYZ ANGLE"+ANSI_WHITE);
		set_pattern_size(width, height);
		set_pattern_smooth(1);
		set_pattern_range(min_col, max_col);
		float min = -PI;
		float max = PI;
		set_pattern_angle(random(min,max),random(min,max),random(min,max));
		pattern = pattern_noise_xyz(width, height);
	} 
	
	println(ANSI_YELLOW+"x_period"+ANSI_WHITE, x_period);
	println(ANSI_YELLOW+"y_period"+ANSI_WHITE, y_period);
	println(ANSI_YELLOW+"turbulence"+ANSI_WHITE, turb_power);
	println(ANSI_YELLOW+"smooth"+ANSI_WHITE, smooth);
	println(ANSI_YELLOW+"noise incrementation"+ANSI_WHITE, inc_x,inc_y,inc_z);
	println(ANSI_YELLOW+"range color arguement"+ANSI_WHITE, min_col, max_col);
	println(ANSI_YELLOW+"angle color argument"+ANSI_WHITE, angle_x, angle_y, angle_z);
	image(pattern);
}
