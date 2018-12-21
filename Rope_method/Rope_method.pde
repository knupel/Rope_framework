/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

void setup() {
	image(pattern_noise(width,height,.1),0,0);

}


void draw() {
	// println(get_scroll());
}





PGraphics pattern_noise(int w, int h, float inc) {
  PGraphics pg = createGraphics(w,h);
  float offset_y =0;
  pg.beginDraw();
  for(int x = 0 ; x < w ; x++) {
    float offset_x = 0;
    for(int y = 0 ; y < h ; y++) {
      float brightness = map(noise(offset_x,offset_y),0,1,0,g.colorModeZ);
      int c = color(brightness);
      pg.set(x,y,c);
      offset_x += inc;
    }
    offset_y += inc;
  }
  pg.endDraw();
  return pg;
}





