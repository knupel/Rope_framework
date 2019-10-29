/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* R_Bloc example
* example : create bloc, set bloc and catch bloc setting
* v 0.0.1
* 2019-2019
*/

ArrayList<R_Bloc> list_bloc;
R_Bloc bloc;
boolean build_new_bloc_is = true;
boolean manage_bloc_is = false;
boolean bloc_selected_is = false;

void setup() {
	// fullScreen();
	size(400,400,P2D);
	rope_version();
	reset_bloc();
	list_bloc = new ArrayList<R_Bloc>();
}

void draw() {
	background(r.SANG);

	if(bloc.end_is()) {
		list_bloc.add(bloc);
		reset_bloc();
	}
	
	// show
	for(R_Bloc b : list_bloc) {
		b.show();
	}

	// simple build
	if(build_new_bloc_is) {
		build_bloc();
	}

	// manage existing bloc

	// select
	for(int index = list_bloc.size() - 1 ; index >= 0 ; index--) {
		R_Bloc b = list_bloc.get(index);
		b.update(mouseX,mouseY);
		if(b.in_bloc(mouseX,mouseY)) {
			b.show_struct();
			if(!b.select_is() && !bloc_selected_is) {
				b.select_is(mousePressed);
				if(b.select_is()) {
					bloc_selected_is = true;
				}
			}
			break;
		}
	}
	// show
	for(R_Bloc b : list_bloc) {
		if(b.select_is()) {
			b.show_anchor_point();
			b.show_available_point(mouseX,mouseY);
		}
	}

	// move gobal
	for(R_Bloc b : list_bloc) {
		b.move(mouseX, mouseY, mousePressed);
	}
}


void mousePressed() {
	if(!bloc_selected_is) {
		for(R_Bloc b : list_bloc) {
			b.select_is(false);
		}
	}
}

void mouseReleased() {
	if(build_new_bloc_is) {
		add_point_to_bloc_is(true);
	}

	bloc_selected_is = false;
}

void keyPressed() {
	if(keyCode == BACKSPACE) {
		for(R_Bloc b : list_bloc) {
			b.clear();
		}
	}

	if(key == 'n') {
		build_new_bloc_is = !build_new_bloc_is;
		if(build_new_bloc_is) manage_bloc_is = false;
	}

	if(key == 'm') {
		manage_bloc_is = !manage_bloc_is;
		if(manage_bloc_is) build_new_bloc_is = false;
	}


	println("\nWHAT HAPPEN");
	println("build new bloc", build_new_bloc_is);
	println("manage blocs", manage_bloc_is);
}




boolean add_point_to_bloc_is;
boolean add_point_to_bloc_is() {
	return add_point_to_bloc_is;
}

void add_point_to_bloc_is(boolean is) {
	add_point_to_bloc_is = is;
}

void reset_bloc() {
	bloc = new R_Bloc();
	bloc.set_magnetism(4);
	bloc.set_colour_build(r.CYAN);
}

void build_bloc() {
	bloc.build(mouseX,mouseY,add_point_to_bloc_is());
	add_point_to_bloc_is(false);
	bloc.show();
	bloc.show_struct();
	bloc.show_anchor_point();
}


void load_bloc(vec2 [] points) {
	for(vec2 v : points) {
		bloc.build(v.x(),v.y(),true);
	}
}


