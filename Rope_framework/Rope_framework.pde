/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
* work with

* Processing 3.5.3.269
* Rope library 0.8.5.30
* Rope frame Work 1.1.5.51
*
* Line2D on pgraphics
*/


vec2 origin;
vec2 destination;
PGraphics other;

void setup() {
  size(300,300,P2D);
  rope_version();
  other = createGraphics(width,height,P2D);
  origin = vec2();
  destination = vec2();

  
  alpha_line2D(1,0);
  tempo(10,20,5); // give color rythme
  palette(r.VERT,r.JAUNE,r.ROUGE); // this method take the lead on stroke
  // palette(r.ROUGE); // this method take the lead on stroke
  
  beginDraw(other);
  background(r.BLACK,other);
  endDraw(other);
  image(other);
}

void draw() {
  
  println(frameRate);

  origin.x(width/2);
  origin.y(height/2);

  //boolean update_pixel_is = false;
  boolean update_pixel_is = true;
  // it's faster to load and update pixels outside when there is a lot line, 
  // but it's can be good to update inside  for some moirring effect.
  
  boolean aa_is = false; // no antialiasing
  if(keyPressed) aa_is = true; // antialising 

  beginDraw(other);
  background(r.BLACK,other);
  
  float radius = map(mouseX,0,width,width/10,width/3);
  int num = 1000;
  float step = TAU / num;
  
  for(int i = 0 ; i < num ; i++) {
    float dir =  i *step ;
    float ndx = cos(dir);
    float ndy = sin(dir);
    destination = vec2(ndx,ndy).mult(radius).add(origin);
    line2D(origin.x(),origin.y(),destination.x(),destination.y(),aa_is,update_pixel_is,other);
  }
  
  
  // directional
  /*
  destination.x(mouseX);
  destination.y(mouseY);
  if(origin != null && destination != null) {
    line2D(origin.xy(),destination.xy(),aa_is,update_pixel_is,other);
  }
  */
  
  endDraw(other);
  image(other);
}
