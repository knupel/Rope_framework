/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/


// void setup() {
//   rope_version();
//   size(800,800,P2D);
//   State.init(this);
//   /**
//   * your code
//   */
// }


// void draw() {
//   background(255);
//   State.pointer(mouseX,mouseY);
//   State.event(mousePressed, !keyPressed);
//   /**
//   * your code
//   */
//   State.reset_event();
// }



/**
* GUI CROPE EXAMPLE
* dependancies
* Processing 3.5.4
* 2021-2021
*
* Knob example
* v 0.1.0
*/

import rope.gui.button.R_Button;
// import rope.gui.button.R_Knob;
import rope.R_State.State;
import rope.vector.vec2;
import rope.core.Rope;
// import rope.core.Rope;
import rope.gui.R_Mol;


// Rope r = new Rope();
void setup() {
  size(200,200);
  State.init(this);
  set_knob(); 
}


void draw() {
	background(255);
	State.pointer(mouseX,mouseY);
	State.event(mousePressed);
	draw_knob();
	State.reset_event();
}

R_Knob knob ;
void set_knob() {
	knob = new R_Knob(new vec2(20),100);
	knob.set_rollover_type(RECT);
	
	knob.set_value(0.45, 0.3);

	knob.set_size_mol(10);
	knob.set_dist_mol(knob.size().x() * 0.5);
	knob.set_type_mol(RECT);

	knob.set_dist_guide(knob.size().x() * 0.65);

	// limit the range knob
	knob.limit(true); // use default value range

  // CLOCKWISE
  knob.set_limit(0, PI); 
	// knob.set_limit(PI, TAU);
  // knob.set_limit(r.SOUTH, r.NORTH); // GROS BUG
	
	// knob.set_limit( r.NORTH_WEST, r.SOUTH_WEST); // GROS BUG
	// knob.set_limit(r.NORTH_EAST, r.SOUTH_EAST); 
	// knob.set_limit(r.NORTH_EAST, r.SOUTH); 
	
 	
	// knob.set_limit( r.SOUTH_EAST, r.SOUTH_WEST);

	// knob.set_limit(r.NORTH_WEST, TAU - r.QPI); // GROS BUG
	// knob.set_limit(r.NORTH_WEST, r.NORTH_EAST);

	// knob.set_limit(0, TAU - (PI/2));  // GROS BUG
	// knob.set_limit(0, r.NORTH);

  // knob.set_limit(r.NORTH_WEST, r.NORTH_EAST);
	// knob.set_limit( r.SOUTH_WEST, r.NORTH_WEST); // GROS BUG
  


  // CLOCKWISE FALSE
	// knob.set_limit(PI, 0);
	// knob.set_limit(0, r.NORTH_EAST); 
	// knob.set_limit(r.NORTH_EAST, r.NORTH_WEST); 
	// knob.set_limit( r.SOUTH, r.NORTH_EAST); 
  // knob.set_limit(r.NORTH, r.SOUTH); // GROS BUG
  // knob.set_limit(r.SOUTH_WEST, r.SOUTH_EAST); 

	// colour molette
	knob.set_align_label_name(LEFT);
	knob.set_align_label_value(LEFT);
	knob.set_label("Turn me please");
	float pos_info = 25;

	knob.set_drag_force(0.05);

	R_Mol [] list = knob.get_mol();
	for(int i = 0 ; i < list.length ; i++) {
		println("mol pos",list[i].pos());
	}

}


void draw_knob() {
	knob.update();
	// knob.update(mouseX,mouseY);
	// knob.select(mousePressed);
	// knob.select(keyPressed); // by default is mousePressed
	// knob.update(mouseX,mouseY,keyPressed);
	//knob.update(mouseX,mouseY,mousePressed,keyPressed);
	knob.rollover(true);


	knob.show_label();
	knob.show_struc();
	knob.show_struc_pie();
	knob.show_mol();
	knob.show_value();
	knob.show_limit();
	knob.show_guide();
  
  // println("knob value", knob.get());
	// println("knob value", knob.get()%TAU);
}





public class R_Trigo extends Rope {
	float angle = 0;
	bvec4 disc; // east, south, west, north
	bvec4 point; // east, south, west, north

	public R_Trigo(float x, float y) {
		this.angle = (float) Math.atan2(y,x);
		init();
		set(this.angle);
	}

	public R_Trigo(float angle) {
		this.angle = angle;
		init();
		set(this.angle);
	}

	private void init() {
 		disc = new bvec4();
		point = new bvec4();
	}

	public void set(float angle) {
		boolean d_east = !all(abs(angle) > HPI, angle < PI);
		boolean d_south = all(angle < PI, angle > 0);
		boolean d_west = !d_east;
		boolean d_north = !d_south;
		disc.set(d_east, d_south, d_west, d_north);

		boolean p_east = any(angle == TAU, angle == 0);
		boolean p_south = angle == HPI;
		boolean p_west = angle == PI;
		boolean p_north = any(angle == -HPI, angle == TAU -HPI);
		point.set(p_east, p_south, p_west, p_north);
	}

	public bvec4 point() {
		return this.point;
	}

	public boolean point_east() {
		return this.point.x();
	}

	public boolean point_south() {
		return this.point.y();
	}

	public boolean point_west() {
		return this.point.z();
	}

	public boolean point_north() {
		return this.point.w();
	}

	public bvec4 disc() {
		return this.disc;
	}

	public boolean disc_east() {
		return this.disc.x();
	}

	public boolean disc_south() {
		return this.disc.y();
	}

	public boolean disc_west() {
		return this.disc.z();
	}

	public boolean disc_north() {
		return this.disc.w();
	}

	public float angle() {
		return this.angle;
	}
}


