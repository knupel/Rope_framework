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
boolean add_new_bloc_is = true;
boolean bloc_build_is = true;
boolean bloc_manage_is = false;
boolean bloc_selected_is = false;

void setup() {
	// fullScreen();
	size(400,400,P2D);
	rope_version();
	list_bloc = new ArrayList<R_Bloc>();
}

void draw() {
	background(r.SANG);
	//println("list bloc size",list_bloc.size());


	
	
	// show
	for(R_Bloc b : list_bloc) {
		b.show();
	}

	// simple build

	check_for_new_bloc();
	if(bloc_show_structure()) {
		add_new_bloc_is = false;
	} else {
		if(bloc_build_is) {
			bloc_draw();
		}
	}

	bloc_select();
	
	if(bloc_manage_is) {
		bloc_move();
	}

	
	
	info();
}


void mousePressed() {
	if(bloc_build_is && add_new_bloc_is) {
		new_bloc();
		add_new_bloc_is = false;
	}
	if(!bloc_selected_is) {
		for(R_Bloc b : list_bloc) {
			b.select_is(false);
		}
	}
}

void mouseReleased() {
	if(bloc_build_is) {
		add_point_to_bloc_is(true);
	}
	bloc_selected_is = false;
}

void keyPressed() {
	if(keyCode == BACKSPACE) {
		list_bloc.clear();
	}

	if(key == 'n') {
		bloc_build_is = !bloc_build_is;
		if(bloc_build_is) bloc_manage_is = false;
		add_new_bloc_is = true;
	}

	if(key == 'm') {
		bloc_manage_is = !bloc_manage_is;
		if(bloc_manage_is) bloc_build_is = false;
	}
}


// info
void info() {
	if(bloc_build_is) {
		text("build bloc mode", 20,20);
	}

	if(bloc_manage_is) {
		text("manage bloc mode", 20,20);
	}

	for(R_Bloc b : list_bloc) {
		if(b.select_is()) {
			text("there is bloc selected", 20,40);
			break;
		} 
	}
}

/**
* DRAW MULTI BLOC METHOD
* v 0.0.1
* 2019-2019
*/
boolean add_point_to_bloc_is;
boolean add_point_to_bloc_is() {
	return add_point_to_bloc_is;
}

void add_point_to_bloc_is(boolean is) {
	add_point_to_bloc_is = is;
}

void check_for_new_bloc() {
	boolean check_for_new_bloc_is = false;
	// check the last current building bloc
	if(list_bloc.size() > 0) {
		int last_index = list_bloc.size() - 1;
		R_Bloc b = list_bloc.get(last_index);
		if(b.end_is()) {
			check_for_new_bloc_is = true;
		}
	} else {
		check_for_new_bloc_is = true;
	}

	// use the result
	if(check_for_new_bloc_is) {
		add_new_bloc_is = true;
	}
}

void new_bloc() {
	R_Bloc bloc = new R_Bloc();
	int id = list_bloc.size();
	bloc.set_id(id);
	bloc.set_magnetism(4);
	bloc.set_colour_build(r.CYAN);
	bloc.select_is(true);
	list_bloc.add(bloc);
}

void bloc_draw() {
	for(R_Bloc b : list_bloc) {
		if(b.select_is() || !b.end_is()) {
			if(mousePressed) {
				b.build(mouseX,mouseY,add_point_to_bloc_is());
				add_point_to_bloc_is(false);
			}
			b.show_struct();
			b.show_anchor_point();
		}	
	}
}

void bloc_select() {
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
}

void bloc_move() {
	for(R_Bloc b : list_bloc) {
		boolean bloc_move_is = false;
		if(mousePressed && b.select_is() && !b.select_point_is()) {
			bloc_move_is = true;
		}
		b.move(mouseX, mouseY, bloc_move_is);
	}
}

boolean bloc_show_structure() {
	boolean event_is = false;
	for(R_Bloc b : list_bloc) {
		if(b.select_is()) {
			b.show_struct();
			b.show_anchor_point();
			if(b.show_available_point(mouseX,mouseY)) {
				event_is = true;
			}
		}
	}
	return event_is;
}

