/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* hue palette
* v 0.0.1
* 2019-2019
*/
R_Typewriter typewriter;
void setup() {
  size(400,400,P2D);
  // typewriter = new R_Typewriter(this, "AmericanTypewriter-MediumA.otf",40);
  typewriter = new R_Typewriter(this, "AmericanTypItcDEEMed.ttf",40);
  

}

void draw(){
  background(255,0,0);
  mode_classic();

  

}

float angle = 0;
void mode_classic(){

  if(mousePressed) {
    typewriter.align(RIGHT);
  } else {
    typewriter.align(LEFT);
  }
  
  typewriter.angle(angle += .01);
  typewriter.pos(mouseX,mouseY);
  typewriter.sentence("écoutons nos pochettes");
  typewriter.show();
}

void mode_vertex(){
  noStroke();
  typewriter.pos(mouseX,mouseY);
  typewriter.reset();
  typewriter.sentence("ROCK");
  fill(r.NOIR);
  beginShape();
  for(vec3 p : typewriter.get_points()) {
    vertex(p);
  }
  endShape(CLOSE);
}


