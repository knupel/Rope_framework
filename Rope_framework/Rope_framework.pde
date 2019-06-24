/**
* Rope Framework
* v 1.1.1
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.7.1.25
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/


vec3 [] pos = new vec3[2000];
void setup() {
	size(500,500,P3D);
	for(int i = 0 ; i < pos.length ; i++) {
		pos[i] = vec3().rand(vec2(-width,width),vec2(-height,height),vec2(-width,width));
	}

}

float rx;
float ry;
void draw() {
	gui();
	background(r.BLACK);
	rx += .01;
	ry += .01;
	stroke(r.WHITE);
	//noStroke();
	noFill();
	//fill(r.RED);
  push();
  rotateX(rx);
  rotateY(ry);
  translate(width/2,height/2,0);
  vec3 size = vec3(50);
  println("frameRate", (int)frameRate);
  for(int i = 0 ; i < pos.length ; i++) {
  	if(which_costume == 0) {
  		costume(pos[i],size,HOUSE);
  	} else if(which_costume == 1) {
  		costume(pos[i],size,SPHERE_MEDIUM);
  	} else if(which_costume == 2) {
  		costume(pos[i],size,SPHERE_LOW);
  	} else if(which_costume == 3) {
  		costume(pos[i],size,TETRAHEDRON);
  	} else if(which_costume == 4) {
  		costume(pos[i],size,CROSS_BOX_3);
  	} else if(which_costume == 5) {
  		costume(pos[i],size,DODECAGON);
  	}
  }
  pop();
	

}


void gui() {
  if(which_costume < 0) which_costume = max_costume_available;
  if(which_costume > max_costume_available) which_costume = 0;
}
int which_costume ;
int max_costume_available = 5;
void keyPressed() {
	if(key == CODED) {
    if(keyCode == UP) {
      which_costume ++;
    }
    if(keyCode == DOWN) {
      which_costume --;
    }
  }
}





