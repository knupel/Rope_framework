/**
* Rope Framework
*
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* dependancies
* Processing 3.5.3.269
* Rope library 0.8.5.30
* Rope framework 1.1.4
*/




void setup() {
  size(300,300,P2D);
}


void draw() {
  background(r.SANG);
  fill(r.BLANC);
  noStroke();
  beginShape();
  vertex(mouseX,mouseY,0);
  vertex(mouseY,mouseX,0);
  vertex(width/2,height/2,0);
  endShape();
}










