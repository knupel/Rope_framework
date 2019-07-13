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

void setup() {
  size(640,480);
  new_coord();
}

void draw() {
  background(r.BLACK);

  origin.x(width/2);
  origin.y(height/2);

  int mode_aa = 0; // no AA
  // int mode_aa = 1 ; // antialising wu algorithm
  // int mode_aa = 2 ; // processing line

  
  float radius = width / 3 ;
  int num = 30;
  float step = TAU / num;
  /*
  for(int i = 0 ; i < num ; i++) {
    float dir =  i *step ;
    float ndx = sin(dir);
    float ndy = cos(dir);
    destination = vec2(ndx,ndy).mult(radius).add(origin);
    line(origin.x(),origin.y(),destination.x(),destination.y(),mode_aa,g);
  }
  */
  

  // directional
  stroke(r.VIOLET);
  destination.x(mouseX);
  destination.y(mouseY);
  if(origin != null && destination != null) {
    line(origin.x(),origin.y(),destination.x(),destination.y(),mode_aa,g);
  }
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









void line(float x0, float y0, float x1, float y1, int mode_is) {
  line(x0, y0, x1, y1, mode_is,g);
}

void line(float x0, float y0, float x1, float y1, int mode_is, PGraphics pg) {
  if(mode_is == 0) {
    draw_line_no_aa(x0, y0, x1, y1, pg);
  } else if(mode_is == 1 ) {
    draw_line_aa_wu(x0, y0, x1, y1, pg);
  } else if(mode_is == 2) {
    line(x0, y0, x1, y1, pg); // processing
  }
}














/**
* line AA Xiaolin Wu based on alogrithm of Bresenham
* v 0.1.0
* 2019-2019
* @see https://github.com/jdarc/wulines/blob/master/src/Painter.java
* @see https://rosettacode.org/wiki/Xiaolin_Wu%27s_line_algorithm#Java
* @see https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
* @see https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm
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
 
void draw_line_aa_wu(double x_0, double y_0, double x_1, double y_1, PGraphics pg) {
  pg.loadPixels();
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
  double intery = y_end_0;
  pixel_wu(steep, x_end_0, intery, x_gap_0, pg);

  // handle second endpoint
  int x_end_1 = (int)Math.round(x_1);
  intery = y_1 + gradient * (x_end_1 - x_1);
  double x_gap_1 = fpart(x_1 + 0.5);
  pixel_wu(steep, x_end_1, intery, x_gap_1, pg);

  // main loop
  // first y-intersection for the main loop
  intery = y_end_0 + gradient;
  for (int x = x_end_0 ; x <= x_end_1 ; x++) {
    double gap = 1.0;
    pixel_wu(steep, x, intery, gap, pg);
    intery += gradient;
  }
  pg.updatePixels();
}

void pixel_wu(boolean steep, int x, double intery, double gap, PGraphics pg) {
  double alpha = 0;
  int col = pg.strokeColor;
  if (steep) {
    alpha = rfpart(intery) * gap;
    plot(int(ipart(intery) + 0), x, col, (float)alpha, pg);
    alpha = fpart(intery) * gap;
    plot(int(ipart(intery) + 1), x, col, (float)alpha, pg);
  } else {
    alpha = rfpart(intery) * gap;
    plot(x, int(ipart(intery) + 0), col, (float)alpha, pg);
    alpha = fpart(intery) * gap;
    plot(x, int(ipart(intery) + 1), col, (float)alpha, pg);
  }
}

/**
* NO AA
*/
void draw_line_no_aa(float x0, float y0, float x1, float y1, PGraphics pg) {
  vec2 src = vec2(x0,y0);
  vec2 dst = vec2(x1,y1);
  float dir = src.angle(dst);
  float radius = dist(src,dst);
  int col = pg.strokeColor; 

  pg.loadPixels();
  for(int i = 0 ; i < radius ; i++) {
    float x = sin(dir);
    float y = cos(dir);
    float from_center = i;
    vec2 path = vec2(x,y).mult(from_center).add(src);
    path.constrain(vec2(0),vec2(width,height));
    int px = (int)path.x();
    int py = (int)path.y();
    // update pixel
    plot(px, py, col, 1.0, pg);
    /*
    int rank = px + py * pg.width;
    if(rank >= 0 && rank < pg.pixels.length && px > 0 && px < pg.width && py > 0) {
      pg.pixels[rank] = col; 
    } 
    */
  }
  pg.updatePixels();
}





































/**
* LINE EXPERIMENTATION
*/
void draw_line_aa_stan(float x0, float y0, float x1, float y1, PGraphics pg) {
  vec2 src = vec2(x0,y0);
  vec2 dst = vec2(x1,y1);
  float dir = src.angle(dst);
  float radius = dist(src,dst);

  ivec2 cardinal = ivec2(0,0);

  float [] clock = new float[9];
  float clock_range = PI / 8.0;
  clock[0] = PI + HALF_PI;
  clock[1] = PI + QUARTER_PI;
  clock[2] = PI;
  clock[3] = PI - QUARTER_PI;
  clock[4] = HALF_PI;
  clock[5] = QUARTER_PI;
  clock[6] = 0;
  clock[7] = -clock[5];
  clock[8] = -clock[4];
  // printArray(clock);
  
  // println(dir);
  int quarter = 0;
  for(int i = 0 ; i < 4 ; i++) {
    if(dir > clock[i*2] && dir < clock[i*2]+HALF_PI) {
      quarter = i;
      if(i == 1) {
        cardinal.set(-1,-1);
      } else if(i == 2) {
        cardinal.set(1,-1);
      } else if(i == 3) {
        cardinal.set(1,1);
      }
      break;
    } else {
      cardinal.set(-1,1);
    }
  }
  //println("quarter",quarter, dir,normal_dir);
  /*
  if(dir == PI) {
    normal_dir.set(0,-1);
  } else if(dir == HALF_PI ) {
    println("HALF_PI",dir);
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
  pg.loadPixels();
  

  int col = pg.strokeColor;

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
          /*
          for(int k = 1 ; k <= length_line_x ; k++) {
            int rank = -k *cardinal.x();
            // extends current line
            int cpx = px + rank;
            int cpy = py ;
            int target = cpx + cpy * img.width;
            float alpha = 1.0/k;
            plot(img,target,alpha);

            // extend previous line
            cpx = px - rank-1;
            cpy = py+1 ;
            target = cpx + cpy * img.width;
            alpha = 1.0/k;
            plot(img,target,alpha);
          }
          */
        } else if(length_line_x < length_line_y) {
          for(int k = 1 ; k <= length_line_x ; k++) {
            int rank = -k *cardinal.y();
            // extends current line
            int cpx = px ;
            int cpy = py + rank;
            int target = cpx + cpy * pg.width;
            float alpha = 1.0/k;
            plot(target,col,alpha,pg);

            // extend previous line
            
            cpx = px +1;
            cpy = py  - rank -1;
            target = cpx + cpy * pg.width;
            alpha = 1.0/k;
            plot(target,col,alpha,pg);
            
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
    int target = px + py * pg.width;
    // plot(img,target,colour,g.colorModeA);
    plot(target,col, g.colorModeA,pg);

     
  }
  pg.updatePixels();
  
}


void plot(int target, int col, float alpha, PGraphics pg) {
  if(target < pg.pixels.length && target >= 0) {
    if(alpha < 1.0) {
      int original = pg.pixels[target];
      col = mixer(original,col,alpha);
    }
    pg.pixels[target] = col;
  }
}
