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
  size(300,300);
}



void draw() {
  background(255);
  // via_method_flower();
  // via_method_costume();
  via_method_costume_with_class_Costume();

}

void via_method_flower() {
  vec2 pos = vec2(mouseX,mouseY);
  int diam = width;
  int petals_num = 10;
  flower(pos,diam,petals_num);
  vec2 petal_left = vec2(.01,.02);
  float strength_left = 1;
  vec2 petal_right = vec2(.02,.01);
  float strength_right = 1.;
  flower_static(petal_left,strength_left,petal_right,strength_right);
  // flower_wind(petal_left,strength_left,petal_right,strength_right);
}


void via_method_costume() {
  vec2 pos = vec2(mouseX,mouseY);
  int diam = width;
  costume(pos,vec2(diam),FLOWER_ROPE);
}


void via_method_costume_with_class_Costume() {
  vec2 pos = vec2(mouseX,mouseY);
  int diam = width;
  Costume flower = new Costume(this);
  flower.set_type(FLOWER_ROPE);
  flower.set_summit(50);
  costume(pos,vec2(diam),flower);
}





















