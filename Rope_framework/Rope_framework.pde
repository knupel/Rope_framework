/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

PGraphics pg_1;
PGraphics pg_2;

void setup() {
	size(400,400,P2D);
	rope_version();
	pg_1 = createGraphics(width,height,P2D);
	pg_2 = createGraphics(width,height,P2D);
}

void draw() {
	background(r.NOIR);

	float alpha = abs(sin(frameCount * 0.1) *255);
	int c = color(255,0,0,alpha);
	aspect(c,r.BLANC,2);
	// fill(c);
	// stroke(r.NOIR);
	// strokeWeight(1);
	ellipse(mouseX,mouseY,50,50);
}






