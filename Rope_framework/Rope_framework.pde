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
	select_input();
	img_a = loadImage("jpg file/small_dame_hermine_2.jpg");
	img_b = loadImage("jpg file/petite_joconde.jpg");
	// img_c = loadImage("jpg file/petite_joconde.jpg");
	// println(img_a.width,img_a.height);
	
	pattern = pattern_noise(img_a.width,img_a.height,0.01);

}


void draw() {
	boolean on_g = false;
	boolean filter_is = true;
	if(width != img_a.width && height != img_b.height && input() != null) {
		resize(img_a);
	}

	
	if(img_c != null) {
		background(img_c,SCREEN);
		// background(r.PINK);
	} else {
		background(r.PINK);
	}

	if(img_a != null) {
		render_mask(mask);
		// result = fx_mask(img_a,pattern,on_g,filter_is);
		result = fx_mask(img_a,mask,on_g,filter_is);

		// result = fx_mask(img_a,img_b,on_g,filter_is);
		// result = fx_mask(img_b,img_a,on_g,filter_is);
		// result = fx_mask(img_a,img_b,on_g,filter_is);
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

void resize(PImage canvas) {
	surface.setSize(canvas.width,canvas.height);
	mask.setSize(canvas.width,canvas.height);
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
	int marge = 50;
	for(int i = 0 ; i < coord.length ; i++) {
		coord[i] = vec2().rand(vec2(-marge,width+marge),vec2(-marge,height+marge));
	}
}

void render_mask(PGraphics pg) {
	pg.beginDraw();
	if(mousePressed) pg.clear();
	// shape
	// vec3 fill = abs(vec3().sin_wave(frameCount,.01)).mult(256);
	float value = abs(sin(frameCount *0.02)*g.colorModeX);
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

