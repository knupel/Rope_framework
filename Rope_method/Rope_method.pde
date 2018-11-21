/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


void setup() {
	size(500,500,P3D);
	load_sketch_location();
}


void draw() {
	update_sketch_location();
}



iVec2 ref_sketch_location;
void update_sketch_location() {
	if(ref_sketch_location == null) {
		ref_sketch_location = get_sketch_location().copy();
		write_sketch_location();
		// println(ref_sketch_location,frameCount);
	} else {
		if(!ref_sketch_location.equals(get_sketch_location())) {
			ref_sketch_location.set(get_sketch_location());
			write_sketch_location();
		}
	}
}

void write_sketch_location() {
	String loc [] = new String[2];
	loc[0] = Integer.toString(ref_sketch_location.x);
	loc[1] = Integer.toString(ref_sketch_location.y);
	saveStrings("data/location.loc",loc);
}


void load_sketch_location() {
	String[] location = loadStrings("location.loc");
	iVec2 loc = iVec2();
	loc.x = Integer.parseInt(location[0]);
	loc.y = Integer.parseInt(location[1]);
	// check if the save position can be used and don't display the sketch in a innaccessible place
	// First check the num of screen device

	println("location loaded from save file",loc);
  if(get_screen_num() < 2) {
  	if(loc.x < 0 || loc.x > get_screen_size().x -width || loc.y < 0 || loc.y > get_screen_size().y -height) {
  		center_sketch(loc);
  	}
  } else if (get_screen_num() >= 2) {
  	int begin_x = 0;
  	int begin_y = 0;
  	int end_x = get_screen_size(0).x; // master screen
  	int end_y = get_screen_size(0).y; // master screen
  	for(int i = 0 ; i < get_screen_num(); i++) {
  		println("screen location",i, get_screen_location(i));
  		println("screen size",i, get_screen_size(i));
  		// x part
  		if(get_screen_location(i).x < begin_x) {
  			begin_x = get_screen_location(i).x;
  		} 
  		if (get_screen_location(i).x > 0) {
  			end_x += get_screen_size(i).x;
  		}

      // y part
   		if(get_screen_location(i).y < begin_y) {
  			begin_y = get_screen_location(i).y;
  		}

  		if (get_screen_location(i).y > 0) {
  			end_y += get_screen_size(i).y;
  		}
  	}
  	println("screen x",begin_x,end_x);
  	println("screen y",begin_y,end_y);
  	println("original loc",loc);

  	if(loc.x < begin_x || loc.x > (end_x - width) || loc.y < begin_y || loc.y > (end_y - height)) {
  		center_sketch(loc);

  	}



  }
  println("screen size",get_screen_size());
  println("location",loc);
	surface.setLocation(loc.x,loc.y);
}

void center_sketch(iVec2 loc) {
	println("bad position the sketch will be centered");
	int term_x_0 = get_screen_size().x /2;
	int term_x_1 = width/2;
	loc.x = term_x_0 - term_x_1;
	int term_y_0 = get_screen_size().y /2;
	int term_y_1 = height/2;
	loc.y = term_y_0 - term_y_1;
}










