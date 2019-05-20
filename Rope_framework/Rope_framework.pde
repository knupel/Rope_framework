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
PImage [] img;


void setup() {
	select_folder();


}

void draw() {
	//println(folder());
	if(folder() != null) {
		explore_folder(folder(),"jpg");
	}

	println(folder_is());
	// printArray(get_files_sort());

}

