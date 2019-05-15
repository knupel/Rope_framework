/**
* Rope Framework
* v 1.1.0
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.7.1.25
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/

void setup() {
	size(640,480,P2D);
	create_mask();
	select_input();
}

PImage img;
void draw() {
	if(input() != null && img == null) {
		img = loadImage(input());
	}
	
	if(img != null) {
		background(img,SCREEN);
	}

	show_mask();
}

vec2 [] coord ;
void create_mask() {
	coord = new vec2[3];
	for(int i = 0 ; i < coord.length ; i++) {
		coord[i] = vec2().rand(vec2(0,width),vec2(0,height));
	}
}

void show_mask() {
	fill(r.VERMILLON);
	noStroke();
	beginShape();
	for(vec2 v : coord) {
		vertex(v);
	}
	vertex(coord[0]);
	endShape();
}

void keyPressed() {
	if(key == 'n') create_mask();
}