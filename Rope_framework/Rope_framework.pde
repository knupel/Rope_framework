/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* R_BLoc
* example : create save blocs and load them
* v 0.0.1
* 2019-2019
*/

// R_Bloc [] bloc;
R_Megabloc megabloc;
R_Megabloc megabloc_from_save;

void setup() {
	size(400,400,P2D);
	rope_version();
	megabloc = new R_Megabloc();
	create_bloc(megabloc);
}


void draw() {
	background(r.SANG);
	show_bloc(megabloc);
	if(megabloc_from_save != null) {
		show_bloc(megabloc_from_save);
	}
}

void keyPressed() {
	if(key == 'n') {
		create_bloc(megabloc);
	}
	if(key == 's') {
		save_bloc(megabloc,"bloc","");
	}

	if(key == 'l') {
		megabloc_from_save = read_megabloc(load_megabloc("bloc.blc"));
		//build_bloc_from_file
	}
}

void show_bloc(R_Megabloc megabloc) {
	megabloc.show();
}




void create_bloc(R_Megabloc megabloc) {
	megabloc.clear();
	megabloc.set(width,height);
	int fill = color(random(g.colorModeX),random(g.colorModeX),random(g.colorModeX));
	int num = 3;
	for(int i = 0 ; i < num ; i++) {
		R_Bloc bloc = new R_Bloc();
		bloc.set_fill(fill);
		int complexity = (int)random(3,5);
		for(int k = 0 ; k < complexity ; k++) {
			float x = random(width);
			float y = random(height);
			bloc.build(x,y,true);
		}
		megabloc.add(bloc);
	}
}


void save_bloc(R_Megabloc megabloc, String file_name, String path) {
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



	if(is) {
		println("megabloc", mb);
		return mb;
	}
	else
		return null;
}














