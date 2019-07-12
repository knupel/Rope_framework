/**
* Rope Framework
* v 1.1.2
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.7.1.25
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/

/**
* Xiaolin Wu line algorithm
* @see https://github.com/jdarc/wulines/blob/master/src/Painter.java
* @see https://rosettacode.org/wiki/Xiaolin_Wu%27s_line_algorithm#Java
* @see https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
* @see https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm
*/



vec2 origin;
vec2 destination;

void setup() {

size(640,480);
// colorMode(HSB,360,100,100,100);
new_coord();
// println(getColorMode()[0]);
 
}

void draw() {

  
  background(r.WHITE);

  origin.x(width/2);
  origin.y(height/2);
  destination.x(mouseX);
  destination.y(mouseY);
  float radius = width / 3 ;
  int num = 30;
  float step = TAU / num;

  for(int i = 0 ; i < num ; i++) {
    float dir =  i *step;
    float ndx = sin(dir);
    float ndy = cos(dir);
    destination = vec2(ndx,ndy).mult(radius).add(origin);
    line_pixel(g,origin.x(),origin.y(),destination.x(),destination.y(),2);



  }
  /*
  if(origin != null && destination != null) {
    //println("je suis là");
    // draw_line_aa_wu(g, origin.x(),origin.y(),destination.x(),destination.y());
    line_pixel(g,origin.x(),origin.y(),destination.x(),destination.y(),2);
    // println(frameCount)
  }
  */
  
}


void keyPressed() {
  new_coord();
}



void new_coord() {
  if(origin == null) origin = vec2();
  if(destination == null) destination = vec2();
  origin.x(random(width));
  origin.y(random(height));
  destination.x(random(width));
  destination.y(random(height));
}

void line_pixel(PImage img, float x0, float y0, float x1, float y1, int mode_is) {
  if(mode_is == 0) {
    draw_line_no_aa(img, x0, y0, x1, y1);
  } else if(mode_is == 1 ) {
    draw_line_aa_wu(img, x0, y0, x1, y1);
  } else if(mode_is == 2) {
    draw_line_aa_stan(img, x0, y0, x1, y1, r.BLACK);
  }
}



/**
* NO AA
*/
void draw_line_aa_stan(PImage img, float x0, float y0, float x1, float y1, int colour) {
  vec2 src = vec2(x0,y0);
  vec2 dst = vec2(x1,y1);
  float dir = src.angle(dst);
  float radius = dist(src,dst);
  
  /*
  if(dir == PI) {
    println("PI",dir);
  } else if(dir == HALF_PI) {
    println("HALT_PI",dir);
  } else if(dir == PI/4) {
    println("PI/4",dir);
  } else if(dir == PI*2) {
    println("PI*2",dir);
  } else if(dir == 0) {
    println("0",dir);
  } else if(dir == -HALF_PI) {
    println("neg HALT_PI",dir);
  }
  */


  

  int ref_x = 0;
  int ref_y = 0; 
  int ref_count_line = 0;
  int count_line = 0;

  int length_line_x = 0;
  int length_line_y = 0;
  img.loadPixels();
  for(int i = 0 ; i < radius ; i++) {
    
    float x = sin(dir);
    float y = cos(dir);
    float from_center = i;
    vec2 path = vec2(x,y).mult(from_center).add(src);
    path.constrain(vec2(0),vec2(width,height));
    
    int px = (int)path.x();
    int py = (int)path.y();
    // boolean new_len_x_is = false;
    // boolean new_len_y_is = false;

    // if(ref_x != px) new_len_x_is = true;
    // if(ref_y != py) new_len_y_is = true;

    if(ref_x != px && ref_y != py) {
      count_line ++;
      ref_x = px;
      ref_y = py;

    }

    if(ref_x == px) {
      length_line_y++;
    }

    if(ref_y == py) {
      length_line_x++;
    }
    
    
    
    // antialiasing line
    if(ref_count_line != count_line) {
      // printTempo(60,"len x",length_line_x,"len y",length_line_y,frameCount);  
      ref_count_line = count_line;
      if(count_line > 1) {
        if(length_line_x > length_line_y) {
          //printTempo(60,"length", length_line_x);
          for(int k = 1 ; k <= length_line_x ; k++) {
            // extends current line
            int cpx = px + k;
            int cpy = py ;
            int target = cpx + cpy * img.width;
            float alpha = 1.0/k;
            plot(img,target,colour,alpha);

            // extend previous line
            /*
            cpx = px - k-1;
            cpy = py+1 ;
            target = cpx + cpy * img.width;
            alpha = 1.0/k;
            plot(img,target,colour,alpha);
            */
          }
        } else if(length_line_x < length_line_y) {
          for(int k = 1 ; k <= length_line_x ; k++) {
            // extends current line
            int cpx = px ;
            int cpy = py + k;
            int target = cpx + cpy * img.width;
            float alpha = 1.0/k;
            plot(img,target,colour,alpha);

            // extend previous line
            /*
            cpx = px - k-1;
            cpy = py+1 ;
            target = cpx + cpy * img.width;
            alpha = 1.0/k;
            plot(img,target,colour,alpha);
            */
          }
      

        }
        // printTempo(60,frameCount, "nouvelle ligne",count_line);
        // printTempo(60,frameCount, "ligne x",length_line_x);
        // printTempo(60,frameCount, "ligne y",length_line_y);

      }
      length_line_x = 0;
      length_line_y = 0;
    }
    

    // main line
    int target = px + py * img.width;
    // plot(img,target,colour,g.colorModeA);
    plot(img,target,r.RED,g.colorModeA);

     
  }
  img.updatePixels();
  
}


void plot(PImage img, int target, int col, float alpha) {
  if(target < img.pixels.length && target >= 0) {
    if(alpha < 1.0) {
      int original = img.pixels[target];
      col = mixer(original,col,alpha);
    }
    img.pixels[target] = col;
  }
}










/**
* line AA Xiaolin Wu based on alogrithm of Bresenham
*/
int ipart(double x) {
  return (int) x;
}
 
double fpart(double x) {
  return x - Math.floor(x);
}
 
double rfpart(double x) {
  return 1.0 - fpart(x);
}
 

void draw_line_aa_wu(PImage img, double x_0, double y_0, double x_1, double y_1) {
  boolean steep = Math.abs(y_1 - y_0) > Math.abs(x_1 - x_0);
  double buffer;
  if (steep) {
    buffer = y_0;
    y_0 = x_0; 
    x_0 = buffer;
    buffer = y_1; 
    y_1 = x_1; 
    x_1 = buffer;
  }
  
  if (x_0 > x_1) {
    buffer = x_0; 
    x_0 = x_1; 
    x_1 = buffer;
    buffer = y_0; 
    y_0 = y_1; 
    y_1 = buffer;
  }

  double dx = x_1 - x_0;
  double dy = y_1 - y_0;
  double gradient = dy / dx;

  // handle first endpoint
  int x_end_0 = (int)Math.round(x_0);
  double y_end_0 = y_0 + gradient * (x_end_0 - x_0);
  double x_gap_0 = rfpart(x_0 + 0.5);
  pixel_wu(img, steep, x_end_0, y_end_0, x_gap_0);

  // handle second endpoint
  int x_end_1 = (int)Math.round(x_1);
  double y_end_1 = y_1 + gradient * (x_end_1 - x_1);
  double x_gap_1 = fpart(x_1 + 0.5);
  pixel_wu(img, steep, x_end_1, y_end_1, x_gap_1);

  // main loop
    // first y-intersection for the main loop
  double intery = y_end_0 + gradient;
  for (int x = x_end_0 ; x <= x_end_1 ; x++) {
    // double gap = g.colorModeA;
    double gap = 1.0;
    pixel_wu(img, steep, x, intery, gap);
    intery += gradient;
  }
}

void pixel_wu(PImage img, boolean steep, int x, double intery, double gap) {
  double alpha = 0;
  
  if (steep) {
    alpha = rfpart(intery) * gap;
    plot(img, ipart(intery) + 0, x, alpha);
    alpha = fpart(intery) * gap;
    plot(img, ipart(intery) + 1, x, alpha);
  } else {
    alpha = rfpart(intery) * gap;
    plot(img, x, ipart(intery) + 0, alpha);
    alpha = fpart(intery) * gap;
    plot(img, x, ipart(intery) + 1, alpha);
  }
}

void plot(PImage img, double x, double y, double alpha) {
  //println("alpha",alpha);
  float a = (float)alpha;
  println(frameCount,a);
  // float a = (float)alpha *g.colorModeA *.1;
  //println("new alpha",a);
  // int col = color(255,0,0,a);
  // img.loadPixels();
  // int rank = (int)x + (int)y * img.width;
  // img.pixels[rank] = col;
  // img.updatePixels();
  // img.set((int)x,(int)y,col);
    int col = color(255,0,0,a);
  
  int rank = (int)x + (int)y * img.width;
  loadPixels();
  g.pixels[rank] = col;  
  updatePixels();
}









/**
* NO AA
*/
void draw_line_no_aa(PImage img, float x0, float y0, float x1, float y1) {
  vec2 src = vec2(x0,y0);
  vec2 dst = vec2(x1,y1);
  float dir = src.angle(dst);
  float radius = dist(src,dst);


  img.loadPixels();
  for(int i = 0 ; i < radius ; i++) {
    
    float x = sin(dir);
    float y = cos(dir);
    float from_center = i;
    vec2 path = vec2(x,y).mult(from_center).add(src);
    path.constrain(vec2(0),vec2(width,height));
    printTempo(60," ");
    printTempo(60,"x",path.x());
    printTempo(60,"y",path.y());

    int target = (int)path.y() * width + (int)path.x();

    // printTempo(60,dst.y(),"*",width,"+",dst.x(),"=",target);
    //int target = int(dst.x() * width + dst.y());
    
    // println(g.pixels.length);
    if(target >= g.pixels.length) target = 0;
    img.pixels[target] = color(0); 
  }
  img.updatePixels();
}
