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

R_Bloc [] bloc;

void setup() {
	size(400,400,P2D);
	rope_version();
	create_bloc();
}


void draw() {
	background(r.SANG);
	show_bloc();
}

void keyPressed() {
	if(key == 'n') {
		create_bloc();
	}
	if(key == 's') {
		save_bloc();

	}


	if(key == 'l') {

	}


}

void show_bloc() {
	for(int i = 0 ; i < bloc.length ; i++) {
		bloc[i].show();
	}
}

void create_bloc() {
	int num = 3;
	bloc = new R_Bloc[num];
	for(int i = 0 ; i < bloc.length ; i++) {
		bloc[i] = new R_Bloc();
		int complexity = (int)random(3,5);
		for(int k = 0 ; k < complexity ; k++) {
			float x = random(width);
			float y = random(height);
			bloc[i].build(x,y,true);
		}
	}
}


void save_bloc() {
	String [] save = new String[1];
	save[0] = "";
	for(int i = 0 ; i < bloc.length ; i++) {
		save[0] += (bloc[i].get_data() + "\n");
	}
	println(save);
	saveStrings("save.blc",save);
}

