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
R_Slider sl_hue, sl_rainbow, sl_sat, sl_bri;

void setup() {
  vec2 size = new vec2(150,15);
  rope_version();
  size(200,200,P2D);
  State.init(this);
  sl_hue = new R_Slider(vec2(10,10), size);
  sl_hue.set_mode(r.HUE);
  sl_hue.set_value(0.5);
  sl_hue.opengl(true);

  sl_sat = new R_Slider(vec2(10,40), size);
  sl_sat.set_mode(r.GRADIENT_SATURATION);
  sl_sat.opengl(true);

  sl_bri = new R_Slider(vec2(10,70), size);
  sl_bri.set_mode(r.GRADIENT_BRIGHTNESS);
  sl_bri.set_value(1.0);
  sl_bri.opengl(true);

    // the witness
  sl_rainbow = new R_Slider(vec2(10,100), size);
  sl_rainbow.set_mode(r.RAINBOW);
  sl_rainbow.set_value(0.5);
  sl_rainbow.opengl(true);
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

  sl_hue.update();
  sl_hue.show_structure();
  sl_hue.show_molette();
  
  sl_sat.update();
  sl_sat.set_root(sl_hue.get(0));
  sl_sat.show_structure();
  sl_sat.show_molette();
  
  sl_bri.update();
  sl_bri.set_root(sl_hue.get(0));
  sl_bri.show_structure();
  sl_bri.show_molette();

  sl_rainbow.update();
  sl_rainbow.set_sat(sl_sat.get(0));
  sl_rainbow.set_bri(sl_bri.get(0));
  sl_rainbow.show_structure();
  sl_rainbow.show_molette();
}




