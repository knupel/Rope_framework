*COSTUME CLASS


*CONSTRUCTOR

public Costume(PApplet pa);

public Costume(PApplet pa, int type);

public Costume(PApplet pa, String arg);
  
*SET

void set_name(String name);
>name of the Object

void set_text(String arg);
>text use to be display

void set_type(int type);

void set_node(int node);

void set_mutation(int mutation);

void set_summit(int summits);

void set_num(int num);

void set_angle(float angle);

void set_ratio(float... ratio);

void set_align(int align);

void set_strength(float... strength);

void set_pair(vec2... pair);

void is_3D(boolean is_3D);

void is_vertex(boolean is_vertex);

void pass_graphic(PGraphics other);



*GET

int get_fill();

int get_stroke();

float get_thickness();
  
String get_name();
  
int get_type();

int get_node();

int get_mutation();

int get_summit();

int get_num();

float get_angle();

float[] get_ratio();

float[] get_strength();

vec2[] get_pair();

boolean is_3D();

boolean is_vertex();

boolean fill_is();

boolean stroke_is();

boolean alpha_is();






*ASPECT

void fill_is(boolean fill_is);

void stroke_is(boolean stroke_is);

void alpha_is(boolean alpha_is);

void aspect_is(boolean fill_is, boolean stroke_is, boolean alpha_is);

void init_bool_aspect();

void aspect(int fill, int stroke, float thickness);

void aspect(int fill, int stroke, float thickness, Costume costume);

void aspect(int fill, int stroke, float thickness, int costume);

void aspect(vec fill, vec stroke, float thickness);

void aspect(vec fill, vec stroke, float thickness, Costume costume);


void aspect(vec fill, vec stroke, float thickness, int costume);

*DRAW

void show();

void show(vec3 pos, vec3 size, vec rot);

 













*COSTUME PIC CLASS


*CONSTRUCTOR

Costume_pic(PApplet p5, String path, int id);
  
*GET

int get_id();

int get_type();

ROPE_svg get_svg();

PImage get_img();

String get_name();


























/**
Class House
2019-2019
v 0.0.7
*/
public class House {
	private int fill_roof = r.BLOOD;
	private int fill_wall = r.GRAY[6];
	private int fill_ground = r.BLACK;
	private int stroke_roof = r.BLACK;
	private int stroke_wall = r.BLACK;
	private int stroke_ground = r.BLACK;
	private float thickness = 1;
	private boolean aspect_is;

	private int level;
	private vec3 pos;
	private vec3 size;
	private boolean roof_ar, roof_cr; // to draw or not the small roof side
	private vec3 offset = vec3(-.5,0,.5); // to center the house; 

  private vec3 [] pa;
	private vec3 [] pc;

	private int type = CENTER;
	public House() {
		build();
	}
  
  public House(float size) {
  	this.size = vec3(size);
		build();
	}

	public House(float sx, float sy, float sz) {
		this.size = vec3(sx,sy,sz);
		build();
	}

	public void mode(int type) {
		this.type = type;
	}

	public void set_pos(vec3 pos) {
		if(this.pos == null) {
			this.pos = pos.copy();
		} else {
			this.pos.set(pos);
		}
	}

	public void set_size(vec3 size) {
		if(this.size == null) {
			this.size = size.copy();
		} else {
			this.size.set(size);
		}
	}

	private void set_peak(float ra, float rc) {
		// check if this peak configuration is permitted
		if(ra + rc > 1.) {
			if(ra>rc) {
				ra = 1.-rc; 
			} else {
				rc = 1.-ra;
			}
		}

		if(ra > 0.) {
			roof_ar = true;
			if(pa != null && pa[0] != null) {
				pa[0].x = 1.-ra+offset.x;
			}
		}

		if(rc > 0.) {
			roof_cr = true;
			if(pc != null && pc[0] != null) {
				pc[0].x = rc+offset.x;
			}
		}
	}
  // aspect
  // fill
  public void set_fill(int c) {
  	aspect_is = true;
  	fill_roof = fill_wall = fill_ground = c;
  }

  public void set_fill_roof(int c) {
		aspect_is = true;
		fill_roof = c;
	}

	public void set_fill_wall(int c) {
		aspect_is = true;
		fill_wall = c;
	}

	public void set_fill_ground(int c) {
		aspect_is = true;
		fill_ground = c;
	}

	public void set_fill(float x, float y, float z, float a) {
		set_fill(color(x,y,z,a));
	}

	public void set_fill_roof(float x, float y, float z, float a) {
		set_fill_roof(color(x,y,z,a));
	}

	public void set_fill_wall(float x, float y, float z, float a) {
		set_fill_wall(color(x,y,z,a));
	}

	public void set_fill_ground(float x, float y, float z, float a) {
		set_fill_ground(color(x,y,z,a));
	}

  // stroke
	public void set_stroke(int c) {
  	aspect_is = true;
  	stroke_roof = stroke_wall = stroke_ground = c;
  }

  public void set_stroke_roof(int c) {
		aspect_is = true;
		stroke_roof = c;
	}

	public void set_stroke_wall(int c) {
		aspect_is = true;
		stroke_wall = c;
	}

	public void set_stroke_ground(int c) {
		aspect_is = true;
		stroke_ground = c;
	}

	public void set_stroke(float x, float y, float z, float a) {
		set_stroke(color(x,y,z,a));
	}

	public void set_stroke_roof(float x, float y, float z, float a) {
		set_stroke_roof(color(x,y,z,a));
	}

	public void set_stroke_wall(float x, float y, float z, float a) {
		set_stroke_wall(color(x,y,z,a));
	}

	public void set_stroke_ground(float x, float y, float z, float a) {
		set_stroke_ground(color(x,y,z,a));
	}

	public void set_thickness(float thickness) {
		aspect_is = true;
		this.thickness = thickness;
	}

	public void aspect_is(boolean is) {
		this.aspect_is = is;
	}

  
  // build
	private void build() {
		pa = new vec3[5];
		pc = new vec3[5];
		
		pa[0] = vec3(1,-1,-0.5); // roof peak
		pa[1] = vec3(1,0,-1);
		pa[2] = vec3(1,1,-1);
		pa[3] = vec3(1,1,0);
		pa[4] = vec3(1,0,0);

		pc[0] = vec3(0,-1,-0.5); // roof peak
		pc[1] = vec3(0,0,-1);
		pc[2] = vec3(0,1,-1);
		pc[3] = vec3(0,1,0);
		pc[4] = vec3(0,0,0);

		for(int i = 0 ; i < pa.length ; i++) {
			pa[i].add(offset);
			pc[i].add(offset);
		}
	}
  

	public void show() {
		float smallest_size = 0;
		for(int i = 0 ; i < 3 ; i++) {
			if(smallest_size == 0 || smallest_size > size.array()[i]) {
				smallest_size = size.array()[i];
			}
		}

    // DEFINE FINAL OFFSET
    vec3 def_pos = null;
	  if(this.type == TOP) {
	  	if(pos == null) {
	  		def_pos = vec3();
	  		def_pos.add(vec3(0,size.y*.5,0));
	  	} else {
	  		def_pos = pos.copy();
	  		def_pos.add(vec3(0,size.y*.5,0));		
	  	}
	  } else if(this.type == BOTTOM) {
	  	if(pos == null) {
	  		def_pos = vec3();
	  		def_pos.add(vec3(0,-size.y,0));
	  	} else {
	  		def_pos = pos.copy();
	  		def_pos.add(vec3(0,-size.y,0));		
	  	}
	  }



	  // WALL
	  if(aspect_is) {
	  	aspect(fill_wall,stroke_wall,thickness);
	  }
		// draw A : WALL > small and special side
		beginShape();
		if(def_pos == null) {
			if(!roof_ar) {
				vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
			}
			for(int i = 1 ; i < pa.length ; i++) {
				vertex(pa[i].copy().mult(size));
			}
		} else {
			if(!roof_ar) {
				vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
			}
			for(int i = 1 ; i < pa.length ; i++) {
				vertex(pa[i].copy().mult(size).add(def_pos));
			}
		}
		endShape(CLOSE);


	  // draw B : WALL > main wall
	  beginShape();
		if(def_pos == null) {
			vertex(pa[2].copy().mult(size));
			vertex(pa[1].copy().mult(size));
			vertex(pc[1].copy().mult(size));
			vertex(pc[2].copy().mult(size));
		} else {
			vertex(pa[2].copy().mult(size).add(def_pos));
			vertex(pa[1].copy().mult(size).add(def_pos));
			vertex(pc[1].copy().mult(size).add(def_pos));
			vertex(pc[2].copy().mult(size).add(def_pos));
		}
		endShape(CLOSE);

	  // draw C : WALL > small and special side
		beginShape();
		if(def_pos == null) {
			if(!roof_cr) {
				vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
			}
			for(int i = 1 ; i < pc.length ; i++) {
				vertex(pc[i].copy().mult(size));
			}
		} else {
			if(!roof_cr) {
				vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
			}
			for(int i = 1 ; i < pc.length ; i++) {
				vertex(pc[i].copy().mult(size).add(def_pos));
			}	
		}
		endShape(CLOSE);

		// draw D : WALL > main wall
		beginShape();
		if(def_pos == null) {
			vertex(pa[3].copy().mult(size));
			vertex(pa[4].copy().mult(size));
			vertex(pc[4].copy().mult(size));
			vertex(pc[3].copy().mult(size));
		} else {
			vertex(pa[3].copy().mult(size).add(def_pos));
			vertex(pa[4].copy().mult(size).add(def_pos));
			vertex(pc[4].copy().mult(size).add(def_pos));
			vertex(pc[3].copy().mult(size).add(def_pos));
		}
		endShape(CLOSE);





    // GROUND
    if(aspect_is) {
	  	aspect(fill_ground,stroke_ground,thickness);
	  }
		// draw G : GROUND
		beginShape();
		if(def_pos == null) {
			vertex(pa[2].copy().mult(size));
			vertex(pc[2].copy().mult(size));
			vertex(pc[3].copy().mult(size));
			vertex(pa[3].copy().mult(size));
		} else {
			vertex(pa[2].copy().mult(size).add(def_pos));
			vertex(pc[2].copy().mult(size).add(def_pos));
			vertex(pc[3].copy().mult(size).add(def_pos));
			vertex(pa[3].copy().mult(size).add(def_pos));
		}
		endShape(CLOSE);



    // ROOF
    if(aspect_is) {
	  	aspect(fill_roof,stroke_roof,thickness);
	  }
    // draw E : ROOF > main roof
		beginShape();
		if(def_pos == null) {
			vertex(pa[4].copy().mult(size));
			vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
			vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
			vertex(pc[4].copy().mult(size));			
		} else {
			vertex(pa[4].copy().mult(size).add(def_pos));
			vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
			vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
			vertex(pc[4].copy().mult(size).add(def_pos));
		}
		endShape(CLOSE);

		// draw F : ROOF > main roof
		beginShape();
		if(def_pos == null) {
			vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
			vertex(pa[1].copy().mult(size));
			vertex(pc[1].copy().mult(size));
			vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
		} else {
			vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
			vertex(pa[1].copy().mult(size).add(def_pos));
			vertex(pc[1].copy().mult(size).add(def_pos));
			vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
		}
		endShape(CLOSE);

		// DRAW AR  > small side roof
		if(roof_ar) {
			beginShape();
			if(def_pos == null) {
				vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
				vertex(pa[1].copy().mult(size));
				vertex(pa[4].copy().mult(size));
			} else {
				vertex(pa[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
				vertex(pa[1].copy().mult(size).add(def_pos));
				vertex(pa[4].copy().mult(size).add(def_pos));
			}
			endShape(CLOSE);
		}

		// DRAW CR > small side roof
		if(roof_cr) {
			beginShape();
			if(def_pos == null) {
				vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z))); // special point for the roof peak
				vertex(pc[1].copy().mult(size));
				vertex(pc[4].copy().mult(size));
			} else {
				vertex(pc[0].copy().mult(vec3(size.x,smallest_size,size.z)).add(def_pos)); // special point for the roof peak
				vertex(pc[1].copy().mult(size).add(def_pos));
				vertex(pc[4].copy().mult(size).add(def_pos));
			}
			endShape(CLOSE);
		}
	}