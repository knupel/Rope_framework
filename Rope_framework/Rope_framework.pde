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





void setup() {
  size(640,480);
}
ivec2 src = ivec2();
void draw() {
  background(125);
  if(mousePressed) {
  	src = ivec2(mouseX,mouseY);
  }
  float radius = 30;
  int num = 10;
  //loadPixels();
  g.loadPixels();
  for(int i = 0 ; i < num ; i++) {
    float dir = random(TAU);
    float x = sin(dir);
    float y = cos(dir);
    float from_center = random_next_gaussian(radius);
    vec2 dst = vec2(x,y).mult(from_center).add(src);
    dst.constrain(vec2(0),vec2(width,height));
    printTempo(60," ");
    printTempo(60,"x",dst.x());
    printTempo(60,"y",dst.y());
    int target = (int)dst.y() * width + (int)dst.x();

    printTempo(60,dst.y(),"*",width,"+",dst.x(),"=",target);
    //int target = int(dst.x() * width + dst.y());
    
    // println(g.pixels.length);
    if(target >= g.pixels.length) target = 0;
    g.pixels[target] = color(0);
    
  }
  g.updatePixels();
  
}






