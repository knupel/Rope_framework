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


import rope.costume.R_Circle;
import rope.costume.R_Bezier;
R_Circle circle;


void setup() {
  colorMode(HSB,1,1,1,1);
  background(0);
  size(300,300);

  circle_setup();
  //circle_setup_on_pg();
}


float angle;
void draw() {
  // println((int)frameRate);
  background_rope(0,0,1,.5);
  float hue = abs(sin(frameCount *.0005));
  fill(hue,1,1,1);
  noStroke();
  // stroke(hue,1,1,.2);
  // noFill();
  

  draw_circle();
  // draw_circle_on_pg();



}


void circle_setup() {
  circle = new R_Circle(this,128);
}


PGraphics pg;
void circle_setup_on_pg() {
  pg = createGraphics(300,300);
  circle = new R_Circle(this,64,pg);
}

void draw_circle() {
  for(R_Bezier b : circle.get_bezier()) {
    vec2 trouble = vec2().sin_wave(frameCount,0.02,.05).mult(2.5);
    b.set_a(trouble);
    trouble = vec2().cos_wave(frameCount,.05,.02).mult(.5);
    b.set_b(trouble);
  }
  vec2 pos = vec2(width/2,height/2);
  float normal_size = .3;
  // float radius = 10 + abs(sin(frameCount *.01))*(height *normal_size);
  int diam = height;
  circle.pos(pos);
  circle.size(diam);
  circle.show();
}


void draw_circle_on_pg() {
  // start begin draw
  pg.beginDraw();
  // the library assume to draw on pg before you pass it in the constructor
  for(R_Bezier b : circle.get_bezier()) {
    vec2 trouble = vec2().sin_wave(frameCount,.01,.02);
    b.set_a(trouble);
    trouble = vec2().cos_wave(frameCount,.02,.01);
    b.set_b(trouble);
  }
  vec2 pos = vec2(pg.width/2,pg.height/2);
  int diam = int(10 + abs(sin(frameCount *.01))*(pg.height *.66));
  circle.pos(pos);
  circle.size(diam);
  circle.show();

  // end begin draw
  pg.endDraw();
  image(pg);
}



















