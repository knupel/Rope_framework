/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* example R_Colour
* v 0.0.1
* 2019-2019
*/
R_Colour c;
void setup() {
	rope_version();
	c = new R_Colour(this, r.NOIR);
	println("groupe 0  couleur 0", c.get(0)[0]);
	c.add_group(2);
	c.add(1,r.ROUGE);
	// c.add(2,r.VIOLET);
	println("groupe 1 couleur 0", c.get(1)[0]);
	println("groupe 2 length", c.get(2).length);
	println("groupe 2 couleur 0", c.get(2)[0]);

}

/*
void draw() {
	c.add_group();
	println("num group",c.size_group());

}
*/
