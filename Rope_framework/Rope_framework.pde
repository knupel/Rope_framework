/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* image collection
* v 0.2.0
* 2017-2019
*/


R_Image_Manager collection;
PGraphics buffer;

void setup() {
  size(100,100,P2D);
  rope_version();
  collection = new R_Image_Manager();  
  // 
  collection.load("jpg file/petite_puros_girl.jpg", "jpg file/pirate_small.jpg","jpg file/pirate_small.jpg");
  PImage img = loadImage("jpg file/banc_public_small.jpg");
  collection.add(img,"new image");
  surface.setSize(collection.get(0).width,collection.get(0).height);

}

void draw() {
  if(mousePressed) {
    R_Image img = collection.rand();
    println(img.get_id(),img.get_name());
    background(img.get_image());
  } else {
    background(collection.get(0));
  }
}
