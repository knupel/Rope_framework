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
* Rope library 0.8.4.29
*/

Line2D main_line;

void setup() {
  size(400,400);
  background(r.BLANC);
  border(width/4);
}


void draw() {
  background(r.BLANC);
  // line
  vec2 a = vec2(width/2,height/2);
  vec2 b = vec2(mouseX,mouseY);
  main_line = new Line2D(a,b);

  stroke(r.BLACK);
  strokeWeight(5);
  point(a);
  point(b);


  
  ArrayList<Line2D> list = new ArrayList<Line2D>();
  line2D_echo(main_line, borders, list);
  // println("list size",list.size());

  // border
  strokeWeight(1);
  stroke(r.BLACK);
  noFill();
  for(Line2D line2D : borders) {
    line2D.draw();
  }

  // main line
  stroke(r.RED);
  strokeWeight(2);
  //main_line.draw();
  
}

void line2D_echo(Line2D line, Line2D [] limits, ArrayList<Line2D> list) {
  float total_dist = line.dist();
  
  vec2 ref = line.a;
  Line2D rest_line = line.copy();
  float offset = 2;
  boolean go_and_return_is = keyPressed;
  while(rest_line.dist() > 0) {
    rest_line = line2D_echo_loop(rest_line,limits,list,ref,offset,go_and_return_is).copy();
  }


  strokeWeight(1);
  stroke(r.PINK);
  // show the last segment
  if(list != null && list.size() > 0) {
    for(Line2D l : list) {
      l.draw();
    }
    
  }
}

Line2D line2D_echo_loop(Line2D line, Line2D [] limits, ArrayList<Line2D> list, vec2 ref, float offset, boolean go_return_is) {
  Line2D rest = new Line2D();
  int count_limit = 0;
  if(go_return_is) offset = -1 *offset;


  for(Line2D limit : limits) {
    count_limit ++;
    // add line.a() like exception because this one touch previous border
    vec2 node = limit.intersection(line, line.a());
    if(node != null) {
      Line2D line2D = new Line2D(line.a(),node);
      rest = new Line2D(node,line.b());

      //offset
      float angle_offset = limit.angle();
      if(offset < 0 ) {
        if(list.size()%2 == 0 && go_return_is) angle_offset += PI;
      } else {
        if(list.size()%2 == 0 && go_return_is) angle_offset -= PI;
      }

      vec2 displacement = projection(angle_offset,offset);
      rest.offset(displacement);
      
      // classic go and return
      if(go_return_is) {
        rest.angle(rest.angle() +PI);
      // go on a same way
      } else {
        float angle = rest.angle() -PI;

        vec2 temp = projection(angle, width+height).add(rest.a());
        Line2D max_line = new Line2D(rest.b(),temp);
        for(Line2D limit_opp : limits) {
          vec2 opp_node = limit_opp.intersection(max_line,vec2(node).add(displacement));
          if(opp_node != null) {
            rest.angle(rest.angle());
            vec2 swap = opp_node.sub(node).sub(displacement);
            rest.offset(swap);
            break;
          }
        }
      }
      // add result
      list.add(line2D);
      break;
    } else {
      // to add the last segment of the main line, 
      // because this one cannot match with any borders or limits
      // before add the last element, it's necessary to check all segments borders
      if(count_limit == limits.length) {
        list.add(line);
      } 
    }
  }
  return rest;
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







/**
* Line 2D
* 2019-2019
* v 0.0.1
*/
class Line2D {
  vec2 a;
  vec2 b;

  Line2D() {
    this.a = new vec2();
    this.b = new vec2();
  }

  Line2D (vec2 a, vec2 b) {
    this.a = new vec2(a.x(),a.y());
    this.b = new vec2(b.x(),b.y());
  }
  

  // set
  void set(vec a, vec b) {
    this.a.set(a.x(),a.y());
    this.b.set(b.x(),b.y());
  }

  void a(vec2 a) {
    this.a.set(a.x(),a.y());
  }

  void b(vec2 b) {
    this.b.set(b.x(),b.y());
  }

  vec2 a() {
    return a;
  }

  vec2 b() {
    return b;
  }

  Line2D offset(vec2 offset) {
    this.a.add(offset);
    this.b.add(offset);
    return this;
  }





  void draw() {
    line(a,b);
  }


  float dist() {
    return abs(a.dist(b));
  }

  Line2D copy() {
    return new Line2D(this.a,this.b);
  }



  // Line2D
  float angle() {
    return a.angle(b);
  }

  Line2D angle(float angle) {
    float ax = cos(angle);
    float ay = sin(angle);
    this.b = new vec2(ax,ay).mult(dist()).add(a);
    return this;
  }

  vec2 intersection(Line2D other) {
    return intersection(other, null);
  }


  vec2 intersection(Line2D other, vec2... exception) {
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
   
    float b_dot_d_perp = bx*dy - by*dx;
   
    if(b_dot_d_perp == 0) {
      return null;
    }
   
    float cx = x3 -x1;
    float cy = y3 -y1;
    
    // with dx and dy
    float t = (cx*dy - cy*dx) /b_dot_d_perp;
    if(t < 0 || t > 1) {
      return null;
    }
   
   // with bx and by
    float u = (cx*by - cy*bx) /b_dot_d_perp;
    if(u < 0 || u > 1) {
      return null;
    }

    vec2 result = new vec2(x1 +t *bx, y1 +t *by);

    if(exception != null) {
      for(int i = 0 ; i < exception.length ; i++) {
        if(exception[i].compare(result,vec2(1))) {
          result = null;
        }
      }
    }
   
    return result;
  }
}







