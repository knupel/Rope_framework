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
Primitive prim;
void setup() {
  size(300,300);
  prim = new Primitive();
  

}

void draw() {
  background(0);
  prim.draw(vec2(width/2,height/2),30,10);

  costume(mouseX,mouseY,100,100,TRIANGLE_ROPE);

}




/*
import rope.costume.RCurve;
import rope.costume.RBezier;
RCurve circle;


void setup() {
  colorMode(HSB,1,1,1,1);
  background(0);
  size(300,300);
  //circle_setup();
  //circle_setup_on_pg();
}


float angle;
void draw() {
  // println((int)frameRate);
  background_rope(0,.2);
  float hue = abs(sin(frameCount *.005));
  fill(hue,1,1,.1);
  noStroke();
  
  push();
  translate(width/2,height/2);
  //rotate(angle+=.01);
  draw_circle();
  pop();
  // draw_circle_on_pg();
}


void circle_setup() {
  circle = new RCurve(this,4);
}


PGraphics pg;
void circle_setup_on_pg() {
  pg = createGraphics(300,300);
  circle = new RCurve(this,64,pg);
}

void draw_circle() {
  for(RBezier b :circle.get_bezier()) {
    vec2 trouble = vec2().sin_wave(frameCount,.01,.1);
    b.set_a(trouble);
    trouble = vec2().cos_wave(frameCount,.1,.01);
    b.set_b(trouble);
  }
  vec2 pos = vec2(0,0);
  float normal_size = .3;
  // float radius = 10 + abs(sin(frameCount *.01))*(height *normal_size);
  float radius = height /3;
  circle.show(pos,radius);
}


void draw_circle_on_pg() {
  // start begin draw
  pg.beginDraw();
  // the library assume to draw on pg before you pass it in the constructor
  for(RBezier b : circle.get_bezier()) {
    vec2 trouble = vec2().sin_wave(frameCount,.01,.02);
    b.set_a(trouble);
    trouble = vec2().cos_wave(frameCount,.02,.01);
    b.set_b(trouble);
  }
  vec2 pos = vec2(pg.width/2,pg.height/2);
  float radius = 10 + abs(sin(frameCount *.01))*(pg.height *.66);
  circle.show(pos,radius);

  // end begin draw
  pg.endDraw();
  image(pg);
}
*/


















