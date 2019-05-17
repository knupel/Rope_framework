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
PImage img_a;
PImage img_b;
PImage img_c;
PImage result;
PGraphics mask;
PGraphics pattern;

void setup() {
	size(640,480,P2D);
	mask = createGraphics(width,height,get_renderer());
	pattern = createGraphics(width,height,get_renderer());

	create_mask();
	//mask.loadPixels();
	// select_input();
	img_a = loadImage("jpg file/small_dame_hermine.jpg");
	img_b = loadImage("jpg file/petite_joconde.jpg");
	// img_c = loadImage("jpg file/petite_joconde.jpg");
	// println(img_a.width,img_a.height);
	surface.setSize(img_a.width,img_a.height);
	mask.setSize(img_a.width,img_a.height);
	pattern = pattern_noise(img_a.width,img_a.height,0.01);

}


void draw() {
	background(r.PINK);
	/*
	if(img_c != null) {
		// background(img_c,SCREEN);
		background(r.PINK);
	} else {
		background(r.PINK);
	}
	*/

	if(img_a != null) {
		render_mask(mask);
		// result = fx_mask(img_a,pattern,false);
		//result = fx_mask(img_a,mask,false);
		boolean on_g = false;
		boolean filter_is = true;
		result = fx_mask(img_a,img_b,on_g,filter_is);
		// result = fx_mask(img_b,img_a,false);
		// image(temp);
		image(result);
		// image(pattern);
	}

	//println("alpha",alpha(result.get(25,25)));



  if(input() != null && img_c == null) { 
  	img_c = loadImage(input());
  	if(img_a.width != width && img_a.height != height) {
			surface.setSize(img_a.width,img_a.height);
			mask.setSize(img_a.width,img_a.height);
		}
 	}
}



void keyPressed() {
	if(key == 'n') {
		create_mask();
		pattern.clear();
		pattern = pattern_noise(img_a.width,img_a.height,0.01);
	}
}







vec2 [] coord ;
void create_mask() {
	coord = new vec2[3];
	for(int i = 0 ; i < coord.length ; i++) {
		coord[i] = vec2().rand(vec2(0,width),vec2(0,height));
	}
}

void render_mask(PGraphics pg) {
	pg.beginDraw();
	pg.clear();
	// shape
	// vec3 fill = abs(vec3().sin_wave(frameCount,.01)).mult(256);
	float value = map(mouseX,0,width,0,256);
	vec3 fill = vec3(value);
	pg.fill(fill.red(),fill.gre(),fill.blu());
	// pg.fill(r.BLOOD);
	//pg.fill(r.WHITE);
	pg.noStroke();
	pg.beginShape();
	for(vec2 v : coord) {
		pg.vertex(v.x(),v.y());
	}
	pg.vertex(coord[0].x(),coord[0].y());
	pg.endShape();
	//
	pg.endDraw();
}

