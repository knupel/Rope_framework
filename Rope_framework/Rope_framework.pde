/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/
/**
*
* method follow with 100K particle
*
* void plot(vec2 pos, int colour);
* void plot(vec2 pos, int colour, PGraphics pg);
* void plot(vec2 pos, int colour, float alpha);
* void plot(vec2 pos, int colour, float alpha, PGraphics pg);
* void plot(int x, int y, int colour);
* void plot(int x, int y, int colour, PGraphics pg);
* void plot(int x, int y, int colour, float alpha);
* void plot(int x, int y, int colour, float alpha, PGraphics pg);
*
* vec2 follow(vec2 target, float speed, vec2 buf):
* vec2 follow(vec2 target, vec2 speed, vec2 buf);
* vec2 follow(float tx, float ty, float speed, vec2 buf);
* vec2 follow(float tx, float ty, float sx, float sy, vec2 buf);
* vec3 follow(vec3 target, float speed, vec3 buf);
* vec3 follow(vec3 target, vec3 speed, vec3 buf);
* vec3 follow(float tx, float ty, float tz, float speed, vec3 buf);
* vec3 follow(float tx, float ty, float tz, float sx, float sy, float sz, vec3 buf);
*/
int num = 300000;
vec2 [] cloud = new vec2[num];
void setup() {
	size(800,800,P2D);
	rope_version();
	for(int i = 0; i < cloud.length ; i++) {
		cloud[i] = vec2().rand(vec2(),vec2(height,width));
	}
}

void draw() {
	background(255);
	vec2 speed = vec2(0.01,0.05);
	vec2 target = vec2(mouseX,mouseY);
	vec2 res = vec2();
	loadPixels();
	for(vec2 p : cloud) {
		res = follow(target, speed, p);
		plot(p,r.BLACK);
	}
	updatePixels();
	println("frameRate",frameRate);
}

void mousePressed() {
	for(int i = 0; i < cloud.length ; i++) {
		cloud[i] = vec2().rand(vec2(),vec2(height,width));
	}
}
