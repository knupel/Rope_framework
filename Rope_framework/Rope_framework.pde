/**
* Rope Framework
* v 1.0.0
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/

void setup() {
	set_filter_input("movie","mov");
  set_filter_input("image","psd");
  // select_input();
  
  print_extension_filter();
  // select_input();
  // print_extension_filter();
  // set_filter_input("default","psd");
  // print_extension_filter("default");

}


void draw() {
  // println(input_is("movie"));
  // println(input_file());
  // println(input_file("image"));
  // println(input_file("text"));
  // println(input_file("movie"));
  // println(input_file("sound"));
  
  boolean explore_sub_folder = true;
  String [] ext = {"mov"};
  explore_folder(folder(),explore_sub_folder,ext); 

  if(get_files() != null && get_files().size() > 0) {
  	println("size",get_files().size());
  	for(File f : get_files()) {
	  	println(f);
	  }
  }
  
  // println(input_file("movie"));
  // println(input("movie"));
}


void keyPressed() {
	if(key == 'i') select_input("image");
	if(key == 't') select_input("text");
	if(key == 'm') select_input("movie");
	if(key == 's') select_input("sound");

	if(key == 'f') select_folder();
}




























