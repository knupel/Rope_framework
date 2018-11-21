/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

void setup() {
	size(500,500);
}

iVec2 ref_sketch_location;
void draw() {
	if(ref_sketch_location == null) {
		ref_sketch_location = get_sketch_location().copy();
		println(ref_sketch_location,frameCount);
	} else {
		if(!ref_sketch_location.equals(get_sketch_location())) {
			ref_sketch_location.set(get_sketch_location());
			println(ref_sketch_location,frameCount);
		}
	}
	
}









