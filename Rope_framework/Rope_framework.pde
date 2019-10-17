/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* example R_Colour
* v 0.0.1
* 2019-2019
*/

void setup() {
	size(300,300,P2D);
	rope_version();
}

void draw() {
	background(r.BLANC);
	strokeWeight(3);
	stroke(r.BLACK);
	line(width/2,height/2,width-mouseX,height-mouseY);
	stroke(r.BLOOD);
	line2D(width/2,height/2,mouseX,mouseY,true,true);
}


