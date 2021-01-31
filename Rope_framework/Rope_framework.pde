/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

/**
*
* plot method
* 2021-2021
* v 0.0.1
*/

/**
* void use_plot_x2(boolean is);
* void plot(int x, int y, int colour);
* void plot(int x, int y, int colour, PGraphics pg);
* void plot(int x, int y, int colour, float alpha);
* void plot(int x, int y, int colour, float alpha, PGraphics pg);

* plot is like processing set(int x, int y, int colour);
* but with plot you need to use loadPixels() and updatePixels()
* 
* you can growth the size by 2 if you use use_plot_x2(true);
* but don't forget to make false ig after that you want back to single pixel.
*/


void setup() {

	size(400,400,P2D);
	rope_version();
	background(r.GRAY[12]);
	int num = 5000;
	loadPixels();
	for(int i = 0 ; i < num ; i++) {
		int x = (int)random(0,width /3);
		int y = (int)random(height);
		plot(x, y, r.BLACK);
	}

	use_plot_x2(true);
	for(int i = 0 ; i < num ; i++) {
		int x = (int)random(width/3, width -(width/3));
		int y = (int)random(height);
		plot(x, y, r.BLACK);
	}

	use_plot_x2(false);
	for(int i = 0 ; i < num ; i++) {
		int x = (int)random( width -(width/3),width);
		int y = (int)random(height);
		plot(x, y, r.BLACK);
	}
	updatePixels();

}
