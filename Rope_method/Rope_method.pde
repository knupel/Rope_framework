/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


Primitive [] prim;
Primitive [] primitive;
void setup() {
	size(800,800,P3D);
	// primitive_setup();
	vec2 v = vec2().rand(vec2(2,3),vec2(4,5));


}


void draw() {
	//primitive_draw();


}


void primitive_setup() {
		// 15_000 rect go down P2D
	// 1500 primitive go down
	//prim = new Primitive[15000];
	prim = new Primitive[10];

	// prim = new Primitive[1500]; 
	for(int i = 0 ; i < prim.length ; i++) {
		prim[i] = new Primitive();
	}
	

	primitive = new Primitive[4];
	for(int i = 0 ; i < primitive.length ; i++) {
		primitive[i] = new Primitive();
	}

}

void primitive_draw() {
		println((int)frameRate);
	background(255);
	noFill();
	// test_shape();
	// test_quantity();
	println(abs(vec3().wave_sin(frameCount,.1)));

}

float angle;
void test_quantity() {
	angle = map(mouseX,0,width,0,TAU);
	for(int i = 0 ; i < prim.length ; i++) {
		// prim[i].draw(vec3(random(width),random(height),0),40,3,angle);
		
		prim[i].calc(vec3(random(width),random(height),0),40,3,angle);
		// prim[i].show();
		beginShape();
		for(int k = 0 ; k < prim[i].get().length ; k++) {
			vertex(prim[i].get()[k]);
		}
		endShape(CLOSE);
		//println(prim[i].get());
		
	}

}


void test_shape() {
	int diam = 100;
	for(int i = 0 ; i < width/diam +1 ; i++) {
		primitive[0].draw(vec2(i*diam,height/2),diam,2);
		primitive[1].draw(vec2(i*diam,height/2),diam,3);
		primitive[2].draw(vec2(i*diam,height/2),diam,4);
		primitive[3].draw(vec2(i*diam,height/2),diam,8);
		ellipse(i*diam,height/2,diam,diam);
	}
}



void rectangle(float x, float y, float w, float h) {
	// quad(x,y,  w,y,  w,h,  x,h);
	rect(x,y,w,h);
	/*
	beginShape();
	vertex(x,y);
	vertex(x+w,y);
	vertex(x+w,y+h);
	vertex(x,y+h);
	endShape(CLOSE);
	*/
	
}
	


































