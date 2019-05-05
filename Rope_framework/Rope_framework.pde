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
R_Face face = new R_Face();
void setup() {
	size(400,400,P3D);
	// define plane ;
	vec3 a = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
	vec3 b = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
	vec3 c = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
	plane.set(a,b,c);


	for(int i = 0 ; i < cloud.length ; i++) {
		cloud[i] = vec3().rand(vec2(0,width),vec2(0,height),vec2(-width,width));
		// R_Node node = new R_Node(cloud[i].copy()); // static solution
		R_Node node = new R_Node(cloud[i]); // pointer solution 
		plane.add(node);
	}
  
	// face.set(plane.get_nodes()[0].pos(),plane.get_nodes()[1].pos(),plane.get_nodes()[2].pos()); // not refresh in the case the object is past after the first step.

	// too use pointer method you need to be sure all your chain is the same Object vec3
	// Use this method can be the possibility to pass the initial object all along your way
	face.set(plane.get_nodes().get(0).pointer(),plane.get_nodes().get(1).pointer(),plane.get_nodes().get(2).pointer()); 


}




void draw() {
	background(0);
	for(int i = 0 ; i < cloud.length ; i++) {
		cloud[i].jitter(20);
	}
  println("new round", frameCount);
	for(int i = 0 ; i < plane.get_nodes().size() ; i++) {
		println("plane pos",plane.get_nodes().get(i).pos()); // here you don't method pointer because the pos is refresh just above
		println("plane pointer",plane.get_nodes().get(i).pointer());
	}

	face.show();
}
