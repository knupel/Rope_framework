/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
/*
* DRAW CIRCLE 
* https://stackoverflow.com/questions/1734745/how-to-create-circle-with-b%C3%A9zier-curves
* http://spencermortensen.com/articles/bezier-circle/
*/
vec2 [] pts = new vec2[4];
vec2 [] pts_a = new vec2[4];
vec2 [] pts_b = new vec2[4];
void setup() {
	size(400,400,P2D);
  float radius = 100;
  vec2 offset = vec2(width/2,height/2);
  

  // normal position
  pts[0] = vec2(0,-1);
	pts[1] = vec2(1,0);
	pts[2] = vec2(0,1);
	pts[3] = vec2(-1,0);  

  
  int n = pts.length;
  // kappa
	float magic_number = (4./3.)*tan(PI/(2*n));

	pts_a[0] = pts[0].copy().add(-magic_number,0);
	pts_a[1] = pts[1].copy().add(0,-magic_number);
	pts_a[2] = pts[2].copy().add(magic_number,0);
	pts_a[3] = pts[3].copy().add(0,magic_number);

	pts_b[0] = pts[0].copy().add(magic_number,0);
	pts_b[1] = pts[1].copy().add(0,magic_number);
	pts_b[2] = pts[2].copy().add(-magic_number,0);
	pts_b[3] = pts[3].copy().add(0,-magic_number);


  // finalize position
	for(int i = 0 ; i < pts.length ; i++) {
		pts[i].mult(radius).add(offset);
		pts_a[i].mult(radius).add(offset);
		pts_b[i].mult(radius).add(offset);
	}
}

void draw() {
	background(125);
	fill(255);
	stroke(0);
	strokeWeight(1);

	beginShape();
	vertex(pts[0]);
  bezierVertex(pts_a[0].x,pts_a[0].y,pts_b[0].x,pts_b[0].y,pts[0].x,pts[0].y);
  // vertex(pts[1]);
  bezierVertex(pts_a[1].x,pts_a[1].y,pts_b[1].x,pts_b[1].y,pts[1].x,pts[1].y);
  // vertex(pts[2]);
  bezierVertex(pts_a[2].x,pts_a[2].y,pts_b[2].x,pts_b[2].y,pts[2].x,pts[2].y);
  // vertex(pts[3]);
  bezierVertex(pts_a[3].x,pts_a[3].y,pts_b[3].x,pts_b[3].y,pts[3].x,pts[3].y);
  endShape();

  
  strokeWeight(10);
  for(int i = 0 ; i < pts.length ; i++) {
  	stroke(255,0,0);
  	point(pts[i]);
  	stroke(0,255,0);
  	point(pts_a[i]);
  	stroke(0,255,0);
  	point(pts_b[i]);
  }
}














