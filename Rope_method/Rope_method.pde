/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
// import processing.video.Movie;

void setup() {
	colorMode(HSB,360,100,100,100);
	size(700,700,P3D);
}



float rot_x = 0;
float rot_y = 0;
void draw() {
	background(0);
  stroke(0,0,100);
  // noFill();
  fill(0,100,50);

  float min = width/12;
	float max = width *.4;
  

  float rx = abs(sin(frameCount *.002));
  float ry = abs(sin(frameCount *.004));
  float rz = abs(sin(frameCount *.006));
  float sx = map(rx,0,1,min,max);
  float sy = map(ry,0,1,min,max);
  float sz = map(rz,0,1,min,max);
  Vec3 size = Vec3(sx,sy,sz);
  // House house = new House(size,size*2,size);
  
  pushMatrix();
	translate(width/2,height/2);
	if(mousePressed) {
		rot_y = map(mouseY,0,height,-PI,PI);
		rot_x = map(mouseX,0,width,-PI,PI);
	}
	rotateX(rot_y);
	rotateY(rot_x);
	costume(Vec3(),size,HOUSE_ROPE);
	popMatrix();
}




























