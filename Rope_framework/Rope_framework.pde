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
PImage temp;
void setup() {
  size(300,300);
  temp = createImage(width,height,ARGB);
  println(get_os());
  println(get_os_family());


}



void draw() {
  background(255,0,0);
  fill(0);
  ellipse(mouseX,mouseY,50,50);
  temp.copy(g,0,0,width,height, 0,0,width,height);
  image(temp,0,height/2);


  fill(255);
  ellipse(mouseY,mouseX,50,50);



}























