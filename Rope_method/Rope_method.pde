/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


Primitive [] prim;
void setup() {
	size(800,800,P2D);
	// 15_000 rect go down P2D
	// 1500 primitive go down
	prim = new Primitive[1500]; 
	// prim = new Primitive[1500]; 
	for(int i = 0 ; i < prim.length ; i++) {
		prim[i] = new Primitive();
	}


}


void draw() {
	println((int)frameRate);
	background(255);
	noFill();
	test_shape();
	

	
	// square(mouseX,mouseY,40);

	
	for(int i = 0 ; i < prim.length ; i++) {
		//prim[i] = new Primitive();
		// rectangle(random(width),random(height),40,40);
		//rect(random(width),random(height),40,40);
		//prim[i].draw(vec3(random(width),random(height),0),40);
	}
	
}


void test_shape() {
	int diam = 100;
	for(int i = 0 ; i < width/diam +1 ; i++) {
		new Primitive().draw(vec2(i*diam,height/2),diam,2);
		new Primitive().draw(vec2(i*diam,height/2),diam,3);
		new Primitive().draw(vec2(i*diam,height/2),diam,4);
		new Primitive().draw(vec2(i*diam,height/2),diam,8);
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
	


































