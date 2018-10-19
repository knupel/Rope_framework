/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

void setup() {
  size(600,600);
}
void draw() {
  background(255);
  Vec2 f = follow(mouseX,mouseY,-.25);
  pointer(color(255,0,0),f.x,f.y);
  // pointer(color(255,0,0),pmouseX,pmouseY);
  // pointer(color(0),mouseX,mouseY);
}



void pointer(int c, float x, float y) {
  noStroke();
  fill(c);
  pushMatrix();
  translate(x,y);
  ellipse(0,0,20,20);
  popMatrix();
}










