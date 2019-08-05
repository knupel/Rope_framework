/**
* Rope Framework
*
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* work with
* Rope frame Work 1.1.3
* Processing 3.5.3
* Rope library 0.8.3.28
*/


vec2 center = vec2(0,0);
float angle = 0 ;
vec2 pts = vec2();
float rayon;
vec2 offset;

void setup() {
  size(400,400);
  offset = vec2(width/2,height/2);
  rayon = width * 0.4;
  background(r.BLANC);
  border(width/4);

  point(center.copy().add(offset));
}


void draw() {
  background(r.BLANC);
  // line
  angle = map(mouseX,0,width,0,TAU);
  println("angle", angle);
  float x = cos(angle);
  float y = sin(angle);
  pts.set(x,y);
  
  
  vec2 a = center.copy().add(offset);
  vec2 b = pts.mult(rayon).add(offset);
  stroke(r.BLACK);
  strokeWeight(5);
  point(a);
  point(b);
 
  stroke(r.RED);
  strokeWeight(1);
  Line2D main_line = new Line2D(a,b);
  main_line.draw();


  // intersection
  for(Line2D line2D : borders) {
    vec2 node = line2D.intersection(main_line);
    if(node != null) {
      strokeWeight(10);
      point(node);
      break;
    }
  }
  
  // border
  strokeWeight(1);
  stroke(r.BLACK);
  noFill();
  for(Line2D line2D : borders) {
    line2D.draw();
  }
}



Line2D [] borders = new Line2D[4];
void border(int marge) {
  vec2 a = vec2(marge,marge);
  vec2 b = vec2(width-marge, marge);
  vec2 c = vec2(width-marge, height -marge);
  vec2 d = vec2(marge,height-marge);
  borders[0] = new Line2D(a,b);
  borders[1] = new Line2D(b,c);
  borders[2] = new Line2D(c,d);
  borders[3] = new Line2D(d,a);
}


class Line2D {
  vec2 a;
  vec2 b;
  Line2D (vec2 a, vec2 b) {
    this.a = new vec2(a.x(),a.y());
    this.b = new vec2(b.x(),b.y());
  }

  void set(vec a, vec b) {
    this.a.set(a.x(),a.y());
    this.b.set(b.x(),b.y());
  }

  void draw() {
    line(a,b);
  }


  vec2 intersection(Line2D other) {
    float x1 = this.a.x();
    float y1 = this.a.y();
    float x2 = this.b.x();
    float y2 = this.b.y();
    
    float x3 = other.a.x();
    float y3 = other.a.y();
    float x4 = other.b.x();
    float y4 = other.b.y();
    
    float bx = x2 - x1;
    float by = y2 - y1;
    float dx = x4 - x3;
    float dy = y4 - y3;
   
    float b_dot_d_perp = bx * dy - by * dx;
   
    if(b_dot_d_perp == 0) return null;
   
    float cx = x3 - x1;
    float cy = y3 - y1;
   
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t < 0 || t > 1) return null;
   
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u < 0 || u > 1) return null;
   
    return new vec2(x1+t*bx, y1+t*by);
  }
}







