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
  select_input("movie");
  print_extension_filter();
}


void draw() {
  println(input_is("movie"));
  println(input_file("movie"));
  println(input("movie"));
}




























