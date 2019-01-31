/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
void setup() {
	size(400,400);
	background(0);
	stroke(255);
	for(int i = 0 ; i < width/3 ; i++) {
		float x = map(random_next_gaussian(),-1,1,0,width);
		float y = height/2;
		point(x,y);
	}

	ivec3 t = ivec3(5).add(5);
	println(t);
}































