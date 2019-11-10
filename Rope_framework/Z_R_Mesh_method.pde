/**
* R_Bloc method
* v 0.0.1
* 2019-2019
*/
R_Bloc create_bloc(vec2 [] points) {
	R_Bloc bloc = new R_Bloc();
	for(vec2 v : points) {
		bloc.build(v.x(),v.y(),true);
	}
	return bloc;
}

/**
* R_Megabloc method
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

void bloc_show_structure(R_Megabloc megabloc) {
	for(R_Bloc b : megabloc.get()) {
		if(b.select_is()) {
			b.show_struct();
			b.show_anchor_point();
		}
	}
}

boolean bloc_show_available_point(R_Megabloc megabloc) {
	boolean event_is = false;
	for(R_Bloc b : megabloc.get()) {
		if(b.select_is()) {
			if(b.show_available_point(mouseX,mouseY)) {
				event_is = true;
			}
		}
	}
	return event_is;
}

int bloc_index = -1;
int bloc_point_index = -1;
void bloc_manage(R_Megabloc megabloc) {
	if(!bloc_move(megabloc)) {
		bloc_move_point(megabloc);
	}
}

boolean add_new_bloc_is = true;
void check_for_new_bloc(R_Megabloc megabloc) {
	boolean check_for_new_bloc_is = false;
	// check the last current building bloc
	if(megabloc.size() > 0) {
		int last_index = megabloc.size() - 1;
		R_Bloc b = megabloc.get(last_index);
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

void new_bloc(R_Megabloc megabloc) {
	R_Bloc bloc = new R_Bloc();
	int id = megabloc.size();
	bloc.set_id(id);
	bloc.set_magnetism(10);
	bloc.set_colour_build(r.CYAN);
	bloc.select_is(true);
	megabloc.add(bloc);
}

void bloc_draw(R_Megabloc megabloc, boolean event_is) {
	if(event_is) {
		for(R_Bloc b : megabloc.get()) {
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
}

void bloc_remove_single_select(R_Megabloc megabloc) {
	int index = -1;
	for(int i = 0 ; i < megabloc.size() ; i++) {
		R_Bloc b = megabloc.get().get(i);
		if(b.select_is()) {
			index = i;
		}
	}
	if(index > -1) {
		megabloc.remove(index);
	}
}

boolean bloc_selected_is = false;
void bloc_select(R_Megabloc megabloc) {
	for(int index = megabloc.size() - 1 ; index >= 0 ; index--) {
		R_Bloc b = megabloc.get(index);
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

boolean bloc_move(R_Megabloc megabloc) {
	boolean event_is = false;
	if(bloc_index < 0 && bloc_point_index < 0) {
		for(int index = 0 ; index < megabloc.size() ; index++) {
			R_Bloc b = megabloc.get(index);
			boolean is = false;
			bloc_index = - 1;
			bloc_point_index = -1;
			if(mousePressed && b.select_is() && !b.select_point_is()) {
				bloc_index = index;
				bloc_point_index = -1;
				is = true;
			  event_is = true;
				break;
			}
			b.move(mouseX,mouseY,is);
		}
	} else if(bloc_index >= 0) {
		R_Bloc b = megabloc.get(bloc_index);
		if(mousePressed && b.select_is() && !b.select_point_is()) {
			event_is = true;
			b.update(mouseX,mouseY);
			b.move(mouseX,mouseY,true);
		} else {
			bloc_point_index = -1;
			bloc_index = -1;
		}
	}
	return event_is;
}

void bloc_move_point(R_Megabloc megabloc) {
	if(bloc_point_index < 0 && bloc_index < 0) {
		for(int index = 0 ; index < megabloc.size() ; index++) {
			R_Bloc b = megabloc.get(index);
			bloc_point_index = -1;
			bloc_index = -1;
			b.move_point(mouseX,mouseY,mousePressed);
			if(b.select_point_is()) {
				bloc_point_index = index;
				bloc_index = -1;
				break;
			}		
		}
	} else if(bloc_point_index >= 0) {
		R_Bloc b = megabloc.get(bloc_point_index);
		b.move_point(mouseX,mouseY,mousePressed);
		if(!b.select_point_is()) {
			bloc_point_index = -1;
			bloc_index = -1;
		}
	}
}

void save_megabloc(R_Megabloc megabloc, String file_name, String path) {
	String [] save = new String[1];
	// header
	String name = "bloc file name:"+file_name;
	String elem = "elements:"+ megabloc.size();
	String w = "width:" + width;
	String h = "height:"+ height;
	save[0] =  name + "," + elem + "," + w + ","+ h +"\n";
	// details
	for(R_Bloc r : megabloc.get()) {
		save[0] += (r.get_data() + "\n");
	}
	saveStrings(path+file_name+".blc",save);
}

String [] load_megabloc(String path_name) {
	String [] data = loadStrings(path_name);
	for(int i = 0 ; i < data.length ; i++) {
		println(data[i]);
	}
	if(data[0].split(",")[0].contains("bloc file name")) {
		return data;
	} else {
		return null;
	}
}

R_Megabloc read_megabloc(String [] file_type_blc) {
	R_Megabloc mb = new R_Megabloc();
	boolean is = true;
	// elem
	int elem = 0;
	if(file_type_blc[0].split(",")[1].contains("elements")) {
		elem = atoi(file_type_blc[0].split(",")[1].split(":")[1]);
	} else {
		is = false;
	}
	// bloc
	for(int i = 1 ; i <= elem ; i++) {
		String bloc_info [] = file_type_blc[i].split(",");
		if(bloc_info[0].contains("bloc") && bloc_info[2].contains("complexity")
				&& bloc_info[3].contains("fill") && bloc_info[4].contains("stroke") && bloc_info[5].contains("thickness")) {
			R_Bloc b = new R_Bloc();
			b.set_fill(atoi(bloc_info[3].split(":")[1]));
			b.set_stroke(atoi(bloc_info[4].split(":")[1]));
			b.set_thickness(atof(bloc_info[5].split(":")[1]));
			int start = 5;
			for(int n = start ; n < bloc_info.length ; n++) {
				if(bloc_info[n].contains("type")) {
					String [] coord = bloc_info[n].split("<>");
					float ax = atof(coord[1].split(":")[1]);
					float ay = atof(coord[2].split(":")[1]);
					b.build(ax,ay,true);
				}
			}
			mb.add(b);
		}
	}

	if(is)
		return mb;
	else
		return null;
}















/**
* R_Plane methods
* v 0.0.1
* 2019-2019
*
*/
boolean in_plane(vec3 a, vec3 b, vec3 c, vec3 any, float range) {
	vec3 n = get_plane_normal(a, b, c);
	// Calculate nearest distance between the plane represented by the vectors
	// a,b and c, and the point any
	float d = n.x()*any.x() + n.y()*any.y() + n.z()*any.z() - n.x()*a.x() - n.y()*a.y() - n.z()*a.z();
	// A perfect result would be d == 0 but this will not hapen with realistic
	// float data so the smaller d the closer the point. 
	// Here I have decided the point is on the plane if the distance is less than 
	// range unit.
	return abs(d) < range; 
}


vec3 get_plane_normal(vec3 a, vec3 b, vec3 c) {
	return new R_Plane().get_plane_normal(a,b,c);
}








