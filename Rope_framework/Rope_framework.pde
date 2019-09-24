/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* 
* v 0.0.1
* 2019-2019
*/

R_Typewriter writer;
float rot = 0;
void setup() {
  size(300,300);




  //text(str,vec2(width/2,height/2),vec2(100));
  // text(str,0,0,100,100);


}


void draw() {
	background(0);
  String str = "jdjnljnfdnvdlfknvlfnbmfkgb,pfgjbmfgjbfgmbfmjbprdfjbvm,dfmbv,mfgbjmgf,bm,fgmb,mf,fmjbprdfjbvm,dfmbv,mfgbjmgf,bm,fgmb,mf";

  writer = new R_Typewriter(this, "AmericanTypewriter-MediumA.otf",12);
  writer.align(CENTER);
  writer.pos(mouseX,mouseY);
  writer.content(str);
  writer.angle(rot += 0.01);
  // writer.show();
  writer.show(100,100,CENTER);
}

