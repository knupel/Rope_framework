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

  tempo(10,20,5);
  alpha_line2D(1,0);
  colour(r.RED,r.GREEN,r.BLUE); // this method take the lead on stroke
  stroke(r.VIOLET);
}

void draw() {
  background(r.BLACK);
  println(frameRate);

  origin.x(width/2);
  origin.y(height/2);

  boolean update_pixel_is = false;
  // it's faster to load and update pixels outside when there is a lot line, 
  // but it's can be good to update inside  for some moirring effect.
  
  boolean aa_is = false; // no antialiasing
  // boolean aa_is = true; // antialising 

  
  float radius = width / 3 ;
  int num = 1000;
  float step = TAU / num;
  
  g.loadPixels();
  
  for(int i = 0 ; i < num ; i++) {
    float dir =  i *step ;
    float ndx = sin(dir);
    float ndy = cos(dir);
    destination = vec2(ndx,ndy).mult(radius).add(origin);
    line2D(origin.x(),origin.y(),destination.x(),destination.y(),aa_is,update_pixel_is,g);
  }
  
  // directional
  /*
  destination.x(mouseX);
  destination.y(mouseY);
  
  if(origin != null && destination != null) {
    line2D(origin.xy(),destination.xy(),true,update_pixel_is,g);
    line2D(origin.xy(),vec2(width,height).sub(destination.xy()),false,update_pixel_is,g);
  }
  */

  g.updatePixels();
}


void new_coord() {
  if(origin == null) origin = vec2();
  if(destination == null) destination = vec2();
  origin.x(random(width));
  origin.y(random(height));
  destination.x(random(width));
  destination.y(random(height));
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
