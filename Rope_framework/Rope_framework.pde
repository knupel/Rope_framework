/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/




// import rope.costume.R_Icosahedron;
import rope.mesh.R_Face;

R_Icosahedron icosahedron;
int radius = 100;

void setup() {
	rope_version();
  size(600,600,P3D);
	background(r.SANG);
	// print_list_costume();

	icosahedron = new R_Icosahedron(this, radius);
	printArray(icosahedron.get_ref_points());
	printArray(icosahedron.get_points());
	
}


void draw() {
  if(!mousePressed) background(r.SANG);
	float thickness = map(sin(frameCount * 0.003),-1,1,0.1,10);
	float size = map(sin(frameCount * 0.005),-1,1,radius -10,radius +10);
	float distance = map(sin(frameCount * 0.01),-1,1, 0.1f,1.15f);
	// strokeWeight(thickness);
	strokeWeight(2);

  // pushMatrix();
	// translate(width/2, height/2);
	// rotateX(frameCount*PI/185);
	// rotateY(frameCount*PI/-200);
	// show_icosahedron_by_face(size, distance);
	// popMatrix();
	// // LE COEUR
	// pushMatrix();
	// translate(width/2, height/2);
	// rotateX(frameCount * 0.01);
	// rotateY(frameCount* 0.02);
	// show_icosahedron_direct(radius);
	// popMatrix();
	show_icosahedron_direct(radius);
}

void show_icosahedron_by_face(float size, float dist) {
	icosahedron.size(size);
	icosahedron.update();
	R_Face [] faces = icosahedron.get_faces().toArray(new R_Face[0]);
	vec3 [] normals = icosahedron.get_normals().toArray(new vec3[0]);
	for(int i = 0 ; i < faces.length ; i++) {
		normals[i].mult(dist);
		faces[i].offset(normals[i]);
		faces[i].show();
	}
}


void show_icosahedron_direct(float size) {
	icosahedron.type(VERTEX);
	// icosahedron.type(POINT);
	vec3 angle = vec3().wave(frameCount,0.01,0.02,0.03);
	icosahedron.angle(angle);
	icosahedron.pos(width/2, height/2,0);
	icosahedron.size(size);
	icosahedron.update();
	icosahedron.show();
}

void show_other_poly() {
	polyhedron("TRUNCATED DODECAHEDRON", VERTEX, 100);
	polyhedron("RHOMBIC DODECAHEDRON", VERTEX, 100);

	polyhedron("TETRAHEDRON", VERTEX, radius);
	polyhedron("TETRAHEDRON", LINE, radius);
	polyhedron("TETRAHEDRON", POINT, radius);
}

