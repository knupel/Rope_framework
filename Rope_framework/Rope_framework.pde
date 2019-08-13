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
* Rope library 0.8.4.29
*/

import rope.costume.R_Line2D;
R_Line2D main_line;

void setup() {
  size(400,400);
  background(r.BLANC);
  border(width/4);
}


void draw() {
  background(r.BLANC);
  // line
  vec2 a = vec2(width/2,height/2);
  vec2 b = vec2(mouseX,mouseY);
  main_line = new R_Line2D(this,a,b);

  stroke(r.BLACK);
  strokeWeight(5);
  point(a);
  point(b);

  ArrayList<R_Line2D> list = new ArrayList<R_Line2D>();
  line2D_echo(main_line, borders, list);

  // border
  strokeWeight(1);
  stroke(r.BLACK);
  noFill();
  for(R_Line2D line2D : borders) {
    line2D.show();
  }
}




void line2D_echo(R_Line2D line, R_Line2D [] limits, ArrayList<R_Line2D> list) {
  float total_dist = line.dist();
  R_Line2D rest_line = line.copy();
  // offset define the step between each line
  float offset = 2;
  // define if the line make go and return, or restart always from the opposite line
  boolean go_and_return_is = keyPressed;

  // change angle echo
  float angle_echo = 0.15;

  while(rest_line.dist() > 0) {
    rest_line = line2D_echo_loop(rest_line,limits,list,offset,angle_echo, go_and_return_is).copy();
  }

  strokeWeight(1);
  stroke(r.PINK);
  // show the last segment
  if(list != null && list.size() > 0) {
    for(R_Line2D l : list) {
      l.show();
    }
  }
}






R_Line2D [] borders = new R_Line2D[4];
void border(int marge) {
  vec2 a = vec2(marge,marge);
  vec2 b = vec2(width-marge, marge);
  vec2 c = vec2(width-marge, height -marge);
  vec2 d = vec2(marge,height-marge);
  borders[0] = new R_Line2D(this,a,b);
  borders[1] = new R_Line2D(this,b,c);
  borders[2] = new R_Line2D(this,c,d);
  borders[3] = new R_Line2D(this,d,a);
}











