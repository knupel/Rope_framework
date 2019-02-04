/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
void setup() {
	size(600,600,P3D);

	
}


void draw() {
	background(0);
	float s = 300;
	float sx = abs(cos(frameCount *.01))*s+20;
	float sy = abs(cos(frameCount *.02))*s+20;
	float sz = abs(cos(frameCount *.03))*s+20;

	push();
	translate(width/2,height/2,0);
  rotateX(map(mouseY,0,height,0,TAU));
  rotateY(map(mouseX,0,width,0,TAU));
	costume(0,0,0,100,100,100,CROSS_RECT_ROPE);

	pop();

}































