/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* When a point meet a line
* v 0.0.1
* 2019-2019
*/
vec2 a, b;
void setup() {
	size(500,500,P2D);
	rope_version();
	a = vec2().rand(vec2(0,width),vec2(0,height));
	b = vec2().rand(vec2(0,width),vec2(0,height));
}

void draw() {
	background(r.BLANC);
	stroke(r.ORANGE);
	vec2 point = vec2(mouseX, mouseY);
	ellipse(point,20);
	strokeWeight(1);
	float range = 1.0;
	if(is_on_line(a, b, point, range)) {
		strokeWeight(5);
		stroke(r.ROUGE);
	} else {
		stroke(r.NOIR);
	}
	line(a,b);
}

void keyPressed() {
	a = vec2().rand(vec2(0,width),vec2(0,height));
	b = vec2().rand(vec2(0,width),vec2(0,height));
}


