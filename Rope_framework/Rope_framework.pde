/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

import rope.gui.slider.R_Slider;
import rope.R_State.State; 
R_Board board;

void setup() {
  
  rope_version();
  size(800,800,P2D);
  State.init(this);
  vec2 pos = vec2(10);
  vec2 size = vec2();
  boolean vert_is = true;
  board = new R_Board(pos, size, vert_is);
  
  float step = 3;
  vec2 size_button = vec2(20);
  board.add_button(size_button, step, "machin", "truc", "bidule", "chouette");
  vec2 size_slider = vec2(100,10);
  step = 5;
  board.add_slider(size_slider, step,  "surf", "ski", "planche");
  
}


void draw() {
  background(255);
  State.pointer(mouseX,mouseY);
  State.event(mousePressed, !keyPressed);
  board.update();
  board.show_structure();
  board.show_label();
  board.show_molette();
  board.show_value();
  
  if(any(State.bang())) {
    println(State.bang(),frameCount);
  }
  
  State.reset_event();

}




