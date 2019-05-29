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
Costume costume;
PGraphics pg;

void setup() {
	size(500,500,P3D);
}




void draw() {
	pg = createGraphics(width,height,P3D);
	println((int)frameRate);
	if(pg != null)  {
		background(255,0,0);
	} else {
		background(255,255,0);
	}

	// test_rect();
	// test_costume();
	// random_set();
	// random_vertex_classic(1000);
	random_vertex_other(200);

	

}


void test_costume() {
		vec2 pos = vec2(mouseX,mouseY);
	vec3 size = vec3(50);
	// costume = new Costume(this,ICOSI_DODECAHEDRON_LINE_ROPE);
	costume = new Costume(this,HOUSE_ROPE);
	//costume = new Costume(this,ELLIPSE_ROPE);
	// costume = new Costume(this,RECT_ROPE);
	// costume.size(50);
	// costume.pos(width/2,height/2);
	
	//vec2 pos = vec2(width/2,height/2);
	
	// costume.draw(vec3(pos),vec3(size),vec2());

  beginDraw(pg);
  if(pg != null) pg.background(0,0);
	// text("truc",mouseX,mouseY,pg);
	// ellipse(mouseX,mouseY,50,50,pg);
	//rect(mouseX,mouseY,50,50,pg);
	float z = sin(frameCount *.1) *(width/2);
	//test(pos,size) ;
	// rect(vec3(mouseX,mouseY,z),vec2(50),pg);
	//ellipse(vec3(mouseX,mouseY,z),vec2(50),pg);
	// triangle(vec3(10,10,50),vec3(30,10,40),vec3(30,100,-100),pg);
  // line(vec3(random(width),random(width),random(width)),vec3(random(width),random(width),random(width)),pg);
 //  stroke(r.YELLOW,pg);
 //  strokeWeight(mouseX,pg);
	// point(vec3(random(width),random(width),random(width)),pg);
	// costume()

  float rot_x = sin(frameCount *.01) *TAU;
  // costume.set_align(CENTER);
  costume.pass_graphic(pg);
	costume.draw(vec3(pos),vec3(size),vec3(rot_x,0,rot_x)); 
	//random_set();
	endDraw(pg);

	image(pg);

}

void test_rect() {
	vec2 pos = vec2(mouseX,mouseY);
	vec3 size = vec3(50);
	beginDraw(pg);
	// pg.translate(pos.x(),pos.y());
 //  translate(pos,pg);
 //  rect(vec2(-size.x,-size.y).div(2),vec2(size.x,size.y),pg);
	// pop(pg);


	// ok
	// pg.push();
	// pg.translate(pos.x(),pos.y());
 //  pg.rect(-size.x/2,-size.y/2,size.x,size.y);
	// pg.pop();

	push(pg);
	translate(pos,pg);
	rect(vec2(-size.x,-size.y).div(2),vec2(size.x,size.y),pg);
  // pg.rect(-size.x/2,-size.y/2,size.x,size.y);
	pop(pg);
	endDraw(pg);
	image(pg);
}



void random_set() {
	beginDraw(pg);
	for(int i = 0 ; i < 100000 ; i++) {
		int c = color(random(255));
		int x = (int)random(width);
		int y = (int)random(height);
		set(x,y,c,pg);
	}
	endDraw(pg);
	image(pg);
}


void random_vertex_classic(int num) {
  println((int)frameRate);
	beginShape();
	for(int i = 0 ; i < num ; i++) {
		int x = (int)random(width);
		int y = (int)random(height);
		vertex(x,y);
	}
	endShape(CLOSE);
}



void random_vertex_other(int num) {
  println((int)frameRate);
  beginDraw(pg);
	beginShape(pg);
	// ça commence déjà à laguer...
	for(int i = 0 ; i < num ; i++) {
		int x = (int)random(width);
		int y = (int)random(height);
		vertex(x,y,pg);
	}
	endShape(CLOSE,pg);
	endDraw(pg);
	image(pg);


}


