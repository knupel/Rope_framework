/**
* Rope Framework
*
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* work with
* Rope frame Work 1.1.3
* Processing 3.5.3
* Rope library 0.8.3.28
*/


vec2 center = vec2(0,0);
float angle = 0 ;
vec2 ref = vec2(1,0);
vec2 pts = vec2();
float rayon;
vec2 offset;

void setup() {
  size(400,400);
  offset = vec2(width/2,height/2);
  rayon = width/4;
  background(r.BLANC);
  stroke(r.BLACK);
  strokeWeight(5);
  point(center.copy().add(offset));
  point(ref.copy().mult(rayon).add(offset));
}


void draw() {
  background(r.BLANC);
  point(center.copy().add(offset));
  point(ref.copy().mult(rayon).add(offset));
  angle = map(mouseX,0,width,0,TAU);
  float x = cos(angle);
  float y = sin(angle);
  pts.set(x,y);
  point(pts.mult(rayon).add(offset));
}







