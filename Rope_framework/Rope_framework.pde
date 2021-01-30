/**
* Rope framework
* Copyleft (c) 2014-2020
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

/**
*
* method follow
*/
vec3 buf_a;
vec3 buf_b;
void setup() {
	size(400,400,P2D);
	rope_version();
	println(r.PINK);
	println(r.VERSION);

	buf_a = new vec3();
	buf_b = new vec3();
}


void draw() {
	background(255,0,0);
	float speed = 0.01;
	vec2 a = follow(mouseX,mouseY, speed, buf_a);

	ellipse(a,50);
	vec2 speed2D = vec2(0.01,0.05);
	vec2 target = vec2(mouseX,mouseY);
	vec2 b = follow(target, speed2D, buf_b);
	ellipse(b,25);

	// vec2 follow(vec2 target, float speed, vec3 buf)
	// vec2 follow(vec2 target, vec2 speed, vec3 buf)
	// vec2 follow(float tx, float ty, float speed, vec3 buf)
	// vec3 follow(vec3 target, float speed, vec3 buf)
	// vec3 follow(vec3 target, vec3 speed, vec3 buf)
	// vec3 follow(float tx, float ty, float tz, float speed, vec3 buf)
	// vec3 follow(float tx, float ty, float tz, float sx, float sy, float sz, vec3 buf)

}
