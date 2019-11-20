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
	beginDraw(pg_1);
	if(mousePressed) {
		aspect(r.ROUGE,r.NOIR,4,pg_1);
	} else {
		aspect(r.CYAN,r.NOIR,4,pg_1);
	}
	ellipse(mouseX,mouseY,40,40,pg_1);
	endDraw(pg_1);

	beginDraw(pg_2);
	aspect(r.JAUNE,r.NOIR,4,pg_2);
	ellipse(mouseY,mouseX,40,40,pg_2);
	endDraw(pg_2);

	image(pg_1);
	image(pg_2);

	aspect(r.ORANGE,r.BLANC,0);
	ellipse(mouseX/2,mouseY/2,20,20);
}






