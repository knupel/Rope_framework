/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* hue palette
* v 0.0.1
* 2019-2019
*/
void setup() {
  size(400,400,P2D);
  // colorMode(HSB,360,100,100,100);
  // colorMode(HSB,150,50,50,50);
  colorMode(HSB,1,1,1,1);
  rope_version();
  
  background(r.NOIR);
  int num_group = 1;
  int num_colour = 300;
  float spectrum = 0.1;
  //float spectrum = g.colorModeA / 4.0;
  int [] palettes = hue_palette(r.VERMILLON, num_group, num_colour, spectrum);
  noStroke();
  for(int i = 0 ; i < num_colour ; i++) {
    println("hsb",hue(palettes[i]),saturation(palettes[i]),brightness(palettes[i]),alpha(palettes[i]));
    // fill(hue(r.VERMILLON),saturation(palettes[i]),brightness(palettes[i]),alpha(palettes[i]));
    // fill(r.VERMILLON);
    fill(palettes[i]);
    ellipse(random(width),random(height),20,20);
  }
}


