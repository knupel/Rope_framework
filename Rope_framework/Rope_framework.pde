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


/*
vec3 a;
R_Node node ;
void setup() {
	a = vec3().rand(width);
	println(a);
	node = new R_Node(a);
	println(node.pos());
}


void draw() {
	a.jitter(10);
	println("a",a);
	println("node",node.pos());
}
*/









vec3 [] cloud = new vec3[1000];
R_Plane plane = new R_Plane();
void setup() {
	size(400,400,P3D);
	// define plane ;
	vec3 a = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
	vec3 b = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
	vec3 c = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
	plane.set(a,b,c);


	for(int i = 0 ; i < cloud.length ; i++) {
		cloud[i] = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
		R_Node node = new R_Node(cloud[i]);
		plane.add(node);
	}

	for(int i = 0 ; i < plane.get_nodes().length ; i++) {
		println(plane.get_nodes()[i].pos());
	}


}




void draw() {
	for(int i = 0 ; i < cloud.length ; i++) {
		cloud[i].jitter(20);
	}
  println("new round", frameCount);
	for(int i = 0 ; i < plane.get_nodes().length ; i++) {
		println(plane.get_nodes()[i].pos());
	}


}
