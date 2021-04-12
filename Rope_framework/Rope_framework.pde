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
  size(800,200,P2D);
  State.init(this);
  vec2 pos = vec2(10);
  vec2 size = vec2();
  boolean vert_is = false;
  board = new R_Board(pos, size, vert_is);
  vec2 size_button = vec2(20);
  float step = 1.5;
  board.add_button(size_button, step, "machin", "truc", "bidule", "chouette");
  
}

/**
* 
*
* Faire un mode r.GRADIENT mais avec r.SATURATION et r.BRIGHTNESS pour les dégradé
*
*
*
*
*/
void draw() {
  background(0);
  State.pointer(mouseX,mouseY);
  State.event(mousePressed);
  board.update();
  board.show_structure();
  board.show_label();
  board.show_value();

  State.reset_bang();

}




