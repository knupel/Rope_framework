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
	size(300,300,P3D);
	pg = createGraphics(width,height,P3D);
	



}

void draw() {
	println((int)frameRate);
	background(255,0,0);
	costume = new Costume(this,RECT_ROPE);
	// costume.size(50);
	// costume.pos(width/2,height/2);
	vec2 pos = vec2(mouseX,mouseY);
	vec2 size = vec2(50);
	// costume.draw(vec3(pos),vec3(size),vec2());

  beginDraw(pg);
  pg.background(0,0);
	// text("truc",mouseX,mouseY,pg);
	// ellipse(mouseX,mouseY,50,50,pg);
	//rect(mouseX,mouseY,50,50,pg);
	float z = sin(frameCount *.1) *(width/2);
	// rect(vec3(mouseX,mouseY,z),vec2(50),pg);
	//ellipse(vec3(mouseX,mouseY,z),vec2(50),pg);
	// triangle(vec3(10,10,50),vec3(30,10,40),vec3(30,100,-100),pg);
  // line(vec3(random(width),random(width),random(width)),vec3(random(width),random(width),random(width)),pg);
  stroke(r.YELLOW,pg);
  strokeWeight(mouseX,pg);
	point(vec3(random(width),random(width),random(width)),pg);
	endDraw(pg);

	image(pg);
	

}

