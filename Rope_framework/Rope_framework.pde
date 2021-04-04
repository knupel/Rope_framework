/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/



void setup() {
  size(200,200,P2D);
}


void draw() {
  background(r.ORANGE);
  fill(r.BLOOD);
  stroke(r.BLACK);
  strokeWeight(2);
  ellipse(mouseX,mouseY, 50,50);
  noFill();
  stroke(r.WHITE);
  rect(20,20, width -40, height -40);


}




