/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/



import rope.mesh.R_Face;

Icosahedron icosahedron;
int radius = 100;

void setup() {
	rope_version();
  size(600,600,P3D);
	background(r.BLANC);
	// print_list_costume();

	icosahedron = new Icosahedron(this, radius);
	
}


void draw() {
  if(!mousePressed) background(r.BLANC);
	strokeWeight(2);
  pushMatrix();
	translate(width/2, height/2);
	rotateX(frameCount*PI/185);
	rotateY(frameCount*PI/-200);
  // polyhedron("TRUNCATED DODECAHEDRON", VERTEX, 100);
	//  polyhedron("RHOMBIC DODECAHEDRON", VERTEX, 100);

	// polyhedron("TETRAHEDRON", VERTEX, radius);
	// polyhedron("TETRAHEDRON", LINE, radius);
	// polyhedron("TETRAHEDRON", POINT, radius);
	show_icosahedron_by_face();
	

	popMatrix();
	show_icosahedron_direct();
}

void show_icosahedron_by_face() {
	float size = map(sin(frameCount * 0.005),-1,1,20,200);
	float scale = map(sin(frameCount * 0.01),-1,1,-0.8,4);
	float thickness = map(sin(frameCount * 0.003),-1,1,0.1,10);
	icosahedron.size(size);
	strokeWeight(thickness);
	R_Face [] faces = icosahedron.get_faces().toArray(new R_Face[0]);
	vec3 [] normals = icosahedron.get_normals().toArray(new vec3[0]);

	
	
	for(int i = 0 ; i < faces.length ; i++) {
		normals[i].mult(scale);
		faces[i].offset(normals[i]);
		faces[i].show();
	}
}


void show_icosahedron_direct() {
	icosahedron.type(VERTEX);
	// icosahedron.type(POINT);
	icosahedron.pos(mouseX,mouseY,0);
	icosahedron.size(50);
	icosahedron.show();
}



