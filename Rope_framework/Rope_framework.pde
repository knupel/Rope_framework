/**
* Rope Framework
* v 1.1.3
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* work with
* Processing 3.5.3
* Rope library 0.8.3.28
*/


vec2 origin;
vec2 destination;
PGraphics other;

void setup() {
  // size(640,480);

  size(600,600,P2D);
  other = createGraphics(width,height,P2D);
  

  new_coord();

  tempo(10,20,5);
  alpha_line2D(1,0);
  colour(r.RED,r.GREEN,r.BLUE); // this method take the lead on stroke
  stroke(r.VIOLET);
  beginDraw(other);
  other.background(r.BLACK);
  endDraw(other);
  image(other);
}

void draw() {
  beginDraw(other);
  stroke(r.VIOLET,other);
  //println(frameRate);

  origin.x(width/2);
  origin.y(height/2);

  //boolean update_pixel_is = false;
  boolean update_pixel_is = true;
  // it's faster to load and update pixels outside when there is a lot line, 
  // but it's can be good to update inside  for some moirring effect.
  
  // boolean aa_is = false; // no antialiasing
  boolean aa_is = true; // antialising 

  float radius = map(mouseX,0,width,width/10,width/3);
  int num = 100;
  float step = TAU / num;
  
  //g.loadPixels();
  //other.loadPixels();
  background(r.BLACK,other);
  /*
  for(int i = 0 ; i < num ; i++) {
    float dir =  i *step ;
    float ndx = sin(dir);
    float ndy = cos(dir);
    destination = vec2(ndx,ndy).mult(radius).add(origin);
    // line2D(origin.x(),origin.y(),destination.x(),destination.y(),aa_is,update_pixel_is,g);
    line2D(origin.x(),origin.y(),destination.x(),destination.y(),aa_is,update_pixel_is,other);
  }
  */
  
  // directional
  
  destination.x(mouseX);
  destination.y(mouseY);
  
  if(origin != null && destination != null) {
    line2D(origin.xy(),destination.xy(),true,update_pixel_is,other);
    //line2D(origin.xy(),vec2(width,height).sub(destination.xy()),false,update_pixel_is,g);
  }
  
 // other.updatePixels();
  // g.updatePixels();
  endDraw(other);
  image(other);
}


void new_coord() {
  if(origin == null) origin = vec2();
  if(destination == null) destination = vec2();
  origin.x(random(width));
  origin.y(random(height));
  destination.x(random(width));
  destination.y(random(height));
}





