/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
void setup() {
	float cyan = 0;
	float magenta = 1;
	float yellow = 0;
	float black = 0;
	Vec3 rgb = cmyk_to_rgb(cyan,magenta,yellow,black);
	println("CMYK to RGB",rgb);
	Vec4 cmyk = rgb_to_cmyk(rgb.r,rgb.g,rgb.b);
	println("RGB to CMYK",cmyk);
	background_rope(rgb);
}














