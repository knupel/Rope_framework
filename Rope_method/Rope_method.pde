/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
guide to code here: 
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*/

PImage img;
void setup() {
  size(300,300,P3D);
  img = loadImage("jpg file/banc_public_small.jpg");
  init_layer(width,height,P3D);
}


float rotate_x;
float rotate_y;
void draw() {
  begin_layer();
// background(0);
  // image(img);
  for(int i = 0; i < 1000;i++) {
    set((int)random(width),(int)random(height),0);
  }
  updatePixels();

  end_layer();
  g.image(get_layer(),0,0);

}

































