/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
// import processing.video.Movie;

House house;
void setup() {
	colorMode(HSB,360,100,100,100);
	size(700,700,P3D);
	house = new House();
}



float rot_x = 0;
float rot_y = 0;
void draw() {
	background(0);

	aspect(r.BLOOD,r.BLACK,1);

  float min = width/12;
	float max = width *.4;
  
  // house size
  float rx = abs(sin(frameCount *.002));
  float ry = abs(sin(frameCount *.004));
  float rz = abs(sin(frameCount *.006));
  float sx = map(rx,0,1,min,max);
  float sy = map(ry,0,1,min,max);
  float sz = map(rz,0,1,min,max);
  Vec3 size = Vec3(sx,sy,sz);
  house.set_size(size);

  // house peak
  float peak_a = abs(sin(frameCount *.005)) *.5;
  float peak_b = abs(sin(frameCount *.005)) *.5;
  house.set_peak(peak_a,peak_b);

  // house colour roof
   house.set_fill_wall(r.GRAY_3);
   house.set_fill_roof(r.BLOOD);
   house.set_fill_ground(r.BLACK);
   house.set_stroke(r.GRAY_1);
   house.set_thickness(2);

  
  
  pushMatrix();
	translate(width/2,height/2);
	if(mousePressed) {
		rot_y = map(mouseY,0,height,-PI,PI);
		rot_x = map(mouseX,0,width,-PI,PI);
	}
	rotateX(rot_y);
	rotateY(rot_x);
	house.show();
	// costume(Vec3(),size,HOUSE_ROPE);
	popMatrix();
}




























