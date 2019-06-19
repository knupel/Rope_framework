/**
* Rope Framework
* v 1.1.1
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
	size(500,500,P3D);
}

float rx;
float ry;
void draw() {
	background(255);
	rx += .01;
	ry += .01;
	fill(r.RED);
	vec2 pos = vec2(mouseX,mouseY);
	vec2 size = vec2(30);
	vec2 rot = vec2(rx,ry);
	textAlign(CENTER);
	// method
	costume(pos,size,rot,"HOUSE of ROPE");
	// class
	Costume costume = new Costume(this,"HOUSE of ROPE");
	costume.pos(pos.x,pos.y,0);
	costume.size(size.x,size.y,0);
	costume.angle(rot.x,rot.y,0);
	costume.show();
}





