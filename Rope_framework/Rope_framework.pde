/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

PGraphics pg_1;
PGraphics pg_2;

void setup() {
	size(400,400,P2D);
}

void draw() {
	println("sketchDisplay():",sketchDisplay());
	// println(get_sreen_size());
	println("curent screen", get_screen_size());
	println("screen 0", get_screen_size(0));
	println("screen 1", get_screen_size(1));
	println("screen 2", get_screen_size(2));
	println("sketch location", get_sketch_location());
}






