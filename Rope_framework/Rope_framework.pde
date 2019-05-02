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
ArrayList<vec4>pts = new ArrayList<vec4>();
ArrayList<Face>faces = new ArrayList<Face>();
int pts_min = 1000;
int pts_max = 10000;
int dist_min = 5;
int dist_max = 90;
int friends = 20;
int max_faces = 10;

void setup() {
	size(800,800,P3D);
	
	generate_cloud(int(random(pts_min,pts_max)),friends);

	generate_faces(pts,int(random(dist_min,dist_max)),max_faces);
}



float rx;
float ry;
void draw() {
	background(0);
	push();
	translate(width/2,height/2);
	rotateX(rx += 0.01);
	rotateY(rx += 0.005);
	for(Face f : faces) {
		beginShape();
		vertex(f.get()[0]);
		vertex(f.get()[1]);
		vertex(f.get()[2]);
		endShape();
	}
	pop();

}


void keyPressed() {
	if(key == 'n') {
		generate_cloud(int(random(pts_min,pts_max)),friends);
		generate_faces(pts,int(random(dist_min,dist_max)),max_faces);
	}
	if(key == 'f') generate_faces(pts,int(random(dist_min,dist_max)),max_faces);
}








void generate_cloud(int num, int friends) {
	int canvas = width/5;
	pts.clear();
	for(int i = 0 ; i < num ; i++) {
		vec3 pos = vec3().rand(vec2(-canvas,canvas),vec2(-canvas,canvas),vec2(-canvas,canvas));
		//int friends = ceil(random(50));
		//int friends = 3;
		pts.add(vec4(pos.x(),pos.y(),pos.z(),friends));
	}

}

void generate_faces(ArrayList<vec4> original, int dist_max, int max_faces) {
	faces.clear();
	ArrayList<vec4> temp = new ArrayList<vec4>();
	for(vec4 p : original) {
		vec4 p_copy = p.copy();
		temp.add(p_copy);
	}
 
  int count = 0 ;
  int max_pass = 100;
	while(temp.size() > 2 && count < max_pass) {
		tirage(temp,dist_max,max_faces);
		clean_list(temp);
		count++;
	}
	println("pass",count);
	println("faces",faces.size());
}


void clean_list(ArrayList<vec4> list) {
	for(int i = list.size()-1 ; i >= 0 ; i--) {
		vec4 p = list.get(i);
		if(p.w() < 1) list.remove(i);
	}
}

boolean tirage(ArrayList<vec4> list, float dist, int max_faces) {
	int max = list.size()-2;
  boolean match_is = false;
  vec4 [] p = new vec4[3];
	for(int i = 0 ; list.size() >= 3  && i < max  && faces.size() < max_faces ; i++) {
		int ta = floor(random(list.size()));
		p[0] = list.get(ta);

		int tb = floor(random(list.size()));
		p[1] = list.get(tb);

		int tc = floor(random(list.size()));
		p[2] = list.get(tc);

		if(ta != tb && ta != tc && tc != tb) {
			vec3 a = vec3(p[0]);
			vec3 b = vec3(p[1]);
			vec3 c = vec3(p[2]);
			vec3 barycenter = barycenter(a,b,c);
			if(dist_to_barycenter(barycenter,dist,a,b,c)) {
				Face f = new Face(a,b,c);
				faces.add(f);
				match_is = true;
				p[0].w(p[0].w()-1);
				p[1].w(p[1].w()-1);
				p[2].w(p[2].w()-1);
			}
		}
	}
	return match_is;
}


boolean dist_to_barycenter(vec3 barycenter, float dist, vec3... list) {
	boolean in_is = true;
	for(int i = 0 ; i < list.length ; i++) {
		if(dist(barycenter,list[i]) < dist) {
			in_is = true;
		} else {
			in_is = false;
			break;
		}
	}
	return in_is;
}









class Face {
	vec3 [] summits;
	Face(vec3 a, vec3 b, vec3 c) {
		summits = new vec3[3];
		summits[0] = a.copy();
		summits[1] = b.copy();
		summits[2] = c.copy();
	}

	vec3 [] get() {
		return summits;
	}
}
