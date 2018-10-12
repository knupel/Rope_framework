/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
/**
* Example to add few shader effect on a same picture, to do that you need to pass by a PGraphics system
*/
PImage img_1, img_2, img_3 ;
PGraphics pg, pg_inc ;

void setup() {
  size (100,100,P3D) ;
  frameRate(180);
  img_1 = loadImage("jpg file/banc_public_small.jpg");
  img_2 = loadImage("jpg file/petite_puros_girl.jpg");
  img_3 = loadImage("jpg file/pirate_small.jpg");
  surface.setSize(img_1.width, img_1.height);

  pg = createGraphics(width,height,P2D);
  pg_inc = createGraphics(pg.width,pg.height,P2D);
}


void draw() {
  background(0);
  println(frameRate);
   
  float ratio_x = abs(sin(frameCount * .001));
  float ratio_y = abs(cos(frameCount * .002));
  float ratio_z = abs(sin(frameCount * .005));
 

  pg.beginDraw();
  // overlay_flip(true,true);
  overlay(pg, img_2, img_2, ratio_x, ratio_y, ratio_z);
  pg.endDraw();

  pg_inc.beginDraw() ;
  pg_inc.image(img_1,0,0);
  pg_inc.endDraw();

  pg.beginDraw();
  mix_flip(true,true);
  mix(pg, pg, pg_inc, ratio_x, ratio_y, ratio_z);
  pg.endDraw();

  image(pg);
}