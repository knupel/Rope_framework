/**
* Rope Framework
* v 1.0.1
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.5.1
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/

void setup() {
  frameRate(1);
  template_method("my_method",this, String.class, int.class);
  // template_method("my_method",this, String.class, int.class); // print: template_method(): this method my_method with those classes organisation already exist
  // template_method("my_method",this, String.class, int.class, float.class);
  //println("method size:",method_index.size());
  /*
  for(Method_Manager mm : method_index) {
    println(mm.get_name());
    printArray(mm.get_index());
  }
  */
}

void draw() {
  surface.setTitle(Integer.toString((int)frameRate));
  background((int)random(#000000));
  method("my_method",this,"Frames:", frameCount);
  println("method is:",method_is());
  // method("my_method",this,"Frames:", frameCount, 3.4); // method not existing return error message
}



// method who's calling
void my_method(final String stuff, final int num) {
  println(stuff, num);
}




























