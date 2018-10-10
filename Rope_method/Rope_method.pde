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
  init_layer(width,height,2);
}


float rotate_x;
float rotate_y;
void draw() {
  // first layer
  select_layer(0);
  begin_layer();

  for(int i = 0; i < 200;i++) {
    int x = (int)random(width);
    int y = (int)random(height);
    int c = color(255,0,0);
    set(x,y,c);
  }
  //updatePixels();

  end_layer();

  // second layer
  select_layer(1);
  rotate_x += .01;
  rotate_y += .02;
  begin_layer();
  background_rope(0);
  translate(width/2,height/2);
  pushMatrix();
  
  rotateX(rotate_x);
  rotateY(rotate_y);
  box(150);


  popMatrix();

  end_layer();

  g.image(get_layer(1),0,0);
  g.image(get_layer(0),mouseX,0);

}


void mousePressed() {
  clear_layer(0);
}











