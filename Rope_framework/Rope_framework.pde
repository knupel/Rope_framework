/**
* Rope Framework
* v 1.1.2
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


vec2 value = new vec2(-1, 2);
void setup() {
  println(value.constrain(0,1));
  value.set(-1,2);
	println(value.constrain(new vec2(0,1), new vec2(0,3)));
}






