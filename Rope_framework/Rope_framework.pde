/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/


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
  if(keyPressed) background(r.BLANC);
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
	// show_icosahedron_direct().

	popMatrix();
}

void show_icosahedron_by_face() {
	float size = map(sin(frameCount * 0.005),-1,1,20,200);
	float scale = map(sin(frameCount * 0.01),-1,1,-0.8,4);
	float thickness = map(sin(frameCount * 0.003),-1,1,0.1,10);
	icosahedron.radius(size);
	strokeWeight(thickness);
	// icosahedron.show();
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
	icosahedron.radius(50);
	icosahedron.show();
}


// https://processing.org/examples/icosahedra.html
// https://en.wikipedia.org/wiki/Icosahedron
public class Icosahedron extends R_Shape {
  vec3 top_point;
	vec3 bottom_point;
  vec3[] top_pent = new vec3[5];
  vec3[] bottom_pent = new vec3[5];

	vec3 ref_top_point;
	vec3 ref_bottom_point;
  vec3[] ref_top_pent = new vec3[5];
  vec3[] ref_bottom_pent = new vec3[5];
	// float radius = 150;
	int type = VERTEX;

  // constructor
  public Icosahedron(PApplet p5, float radius) {
		super(p5);
    size(radius);
    init();
  }

	public void type(int type) {
		this.type = type;
	}

	public void radius(float radius) {
		size(radius);
	}

	public void init() {
		float step = 2*PI/5;
		float angle = 0;
    float dist = dist(cos(0), sin(0), cos(step),  sin(step));
		float a = (float)(Math.sqrt(((dist*dist) -1.0)));

    float tri_ht = (float)(Math.sqrt((dist*dist)-((dist/2)*(dist/2))));

    for (int i = 0; i < top_pent.length; i++){
			ref_top_pent[i] = new vec3(cos(angle), sin(angle), tri_ht/2.0f);
      angle +=step;
    }
    ref_top_point = new vec3(0, 0, tri_ht/2.0f+a);
		// why this one must be converte in degrees ?????
    angle = degrees(step)/2.0f;
    for (int i = 0; i < bottom_pent.length; i++){
			ref_bottom_pent[i] = new vec3(cos(angle), sin(angle), -tri_ht/2.0f);
      angle +=step;
    }
		ref_bottom_point = new vec3(0, 0, -(tri_ht/2.0f+a));
		//
		init_final_point();
  }


	private void init_final_point() {
		top_point = ref_top_point.copy();
		bottom_point = ref_bottom_point.copy();
		for(int i = 0 ; i < top_pent.length ; i++) {
			top_pent[i] = ref_top_pent[i].copy();
			bottom_pent[i] = ref_bottom_pent[i].copy();
		}
	}

	private void set_final_point(float radius) {
		top_point.mult(radius);
		bottom_point.mult(radius);
		for(int i = 0 ; i < top_pent.length ; i++) {
			top_pent[i].mult(radius);
			bottom_pent[i].mult(radius);
		}
	}

	private void reset_final_point() {
		top_point.set(ref_top_point);
		bottom_point.set(ref_bottom_point);
		for(int i = 0 ; i < top_pent.length ; i++) {
			top_pent[i].set(ref_top_pent[i]);
			bottom_pent[i].set(ref_bottom_pent[i]);
		}
	}

  // draws icosahedron 
	public void show() {
		set_final_point(size.x());
		if(type == POINT) {
			point(top_point);
			point(bottom_point);
			for(int i = 0 ; i < top_pent.length ; i++) {
				point(top_pent[i]);
				point(bottom_pent[i]);
			}
		} else {
			show_imp();
		}
		reset_final_point();
	}

  private void show_imp() {
    for (int i=0; i < top_pent.length; i++){
      // icosahedron top
      if (i < top_pent.length-1){
				triangle_imp(top_pent[i], top_point, top_pent[i+1]);
      } else {
				triangle_imp(top_pent[i], top_point, top_pent[0]);
      }
      // icosahedron bottom   
      if (i< bottom_pent.length-1) {
				triangle_imp(bottom_pent[i], bottom_point, bottom_pent[i+1]);
      } else {
				triangle_imp(bottom_pent[i], bottom_point, bottom_pent[0]);
      }
    }
    // icosahedron body
    for (int i = 0; i < top_pent.length; i++){
      if (i < top_pent.length-2) {
				triangle_imp(top_pent[i], bottom_pent[i+1], bottom_pent[i+2]);
				triangle_imp(bottom_pent[i+2], top_pent[i], top_pent[i+1]);
      } else if (i == top_pent.length-2) {
				triangle_imp(top_pent[i], bottom_pent[i+1], bottom_pent[0]);
				triangle_imp(bottom_pent[0], top_pent[i], top_pent[i+1]);
      } else if (i == top_pent.length-1) {
				triangle_imp(top_pent[i], bottom_pent[0], bottom_pent[1]);
				triangle_imp(bottom_pent[1], top_pent[i], top_pent[0]);
      }
    }
  }

	public ArrayList<vec3> get_normals() {
		ArrayList<vec3> list = new ArrayList<vec3>();
		ArrayList<R_Face> list_faces = this.get_faces();
		for(R_Face face : list_faces) {
			vec3 center = face.barycenter();
			list.add(center);
		}
		return list;
	}

	public ArrayList<R_Face> get_faces() {
		return get_faces(false);
	}

	public ArrayList<R_Face> get_faces_normal() {
		return get_faces(true);
	}

	private ArrayList<R_Face> get_faces(boolean normal_is) {
		if(!normal_is) {
			set_final_point(size.x());
		}
		ArrayList<R_Face> list = new ArrayList<R_Face>();
		R_Face face = new R_Face();
		for (int i = 0; i < top_pent.length; i++){
      // icosahedron top
      if (i < top_pent.length-1){
				face.set(top_pent[i], top_point, top_pent[i+1]);
				list.add(face.copy());
      } else {
				face.set(top_pent[i], top_point, top_pent[0]);
				list.add(face.copy());
      }
      // icosahedron bottom   
      if (i< bottom_pent.length-1) {
				face.set(bottom_pent[i], bottom_point, bottom_pent[i+1]);
				list.add(face.copy());
      } else {
				face.set(bottom_pent[i], bottom_point, bottom_pent[0]);
				list.add(face.copy());
      }
    }
    // icosahedron body
    for (int i = 0; i < top_pent.length; i++){
      if (i < top_pent.length-2) {
				face.set(top_pent[i], bottom_pent[i+1], bottom_pent[i+2]);
				list.add(face.copy());
				face.set(bottom_pent[i+2], top_pent[i], top_pent[i+1]);
				list.add(face.copy());
      } else if (i == top_pent.length-2) {
				face.set(top_pent[i], bottom_pent[i+1], bottom_pent[0]);
				list.add(face.copy());
				face.set(bottom_pent[0], top_pent[i], top_pent[i+1]);
				list.add(face.copy());
      } else if (i == top_pent.length-1) {
				face.set(top_pent[i], bottom_pent[0], bottom_pent[1]);
				list.add(face.copy());
				face.set(bottom_pent[1], top_pent[i], top_pent[0]);
				list.add(face.copy());
      }
    }
	if(!normal_is) {
			reset_final_point();
		}
		return list;
	}

	// public ArrayList<R_Face> get_faces() {
	// 	ArrayList<R_Face> list = new ArrayList<R_Face>();
	// 	R_Face face = new R_Face();
	// 	for (int i = 0; i < ref_top_pent.length; i++){
  //     // icosahedron top
  //     if (i < top_pent.length-1){
	// 			face.set(ref_top_pent[i], ref_top_point, ref_top_pent[i+1]);
	// 			list.add(face.copy());
  //     } else {
	// 			face.set(ref_top_pent[i], ref_top_point, ref_top_pent[0]);
	// 			list.add(face.copy());
  //     }
  //     // icosahedron bottom   
  //     if (i< bottom_pent.length-1) {
	// 			face.set(ref_bottom_pent[i], ref_bottom_point, ref_bottom_pent[i+1]);
	// 			list.add(face.copy());
  //     } else {
	// 			face.set(ref_bottom_pent[i], ref_bottom_point, ref_bottom_pent[0]);
	// 			list.add(face.copy());
  //     }
  //   }
  //   // icosahedron body
  //   for (int i = 0; i < top_pent.length; i++){
  //     if (i < top_pent.length-2) {
	// 			face.set(ref_top_pent[i], ref_bottom_pent[i+1], ref_bottom_pent[i+2]);
	// 			list.add(face.copy());
	// 			face.set(ref_bottom_pent[i+2], ref_top_pent[i], ref_top_pent[i+1]);
	// 			list.add(face.copy());
  //     } else if (i == top_pent.length-2) {
	// 			face.set(ref_top_pent[i], ref_bottom_pent[i+1], ref_bottom_pent[0]);
	// 			list.add(face.copy());
	// 			face.set(ref_bottom_pent[0], ref_top_pent[i], ref_top_pent[i+1]);
	// 			list.add(face.copy());
  //     } else if (i == top_pent.length-1) {
	// 			face.set(ref_top_pent[i], ref_bottom_pent[0], ref_bottom_pent[1]);
	// 			list.add(face.copy());
	// 			face.set(ref_bottom_pent[1], ref_top_pent[i], ref_top_pent[0]);
	// 			list.add(face.copy());
  //     }
  //   }
	// 	return list;
	// }

	private void triangle_imp(vec3 a, vec3 b, vec3 c) {
		if(type == VERTEX) {
			triangle_vertex(a, b, c);
		} else if(type == LINE) {
			triangle_line(a, b, c);
		} else triangle_vertex(a, b, c);
	}

	private void triangle_line(vec3 a, vec3 b, vec3 c) {
		noFill();
		triangle(a, b, c);
	}

	private void triangle_vertex(vec3 a, vec3 b, vec3 c) {
		triangle(a, b, c);
	}
}