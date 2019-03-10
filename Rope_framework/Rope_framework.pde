/**
* Rope Framework
* v 1.0.0
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*/




Curve circle;
void setup() {
  size(500,500);
  circle = new Curve(5);
  for(Bezier b :circle.get_bezier()) {
    println("a",b.get_a());
    println("pos",b.get_pos());
    println("b",b.get_b());
  }
}



void draw() {
  background(255);
  float radius = 10 + abs(sin(frameCount *.01))*(height/2);
  vec2 pos = vec2(mouseX,mouseY);
  circle.show(g,pos,radius);
}





/**
* Circle vertex refactoring from Static class to classic class
* v 0.0.3
* 2019-2019
* @author @behreajj from Processing forum
* @auther @stanlepunk for the refactoring
* @see https://discourse.processing.org/t/draw-circle-shape-with-vertex/8558/2 the Forum post for the original 
*/
public class Curve {
  boolean loop = false;
  Bezier[] knots;

  public Curve(int num) {
    float offset_angle = 0;
    build(num,offset_angle);

  }

  private void build(int count, float offset_angle) {
    knots = new Bezier[count];
    float step = 1.0 /count;
    float to_angle = TWO_PI *step;
    float mag = (4.0 / 3.0) * tan(HALF_PI *step);
    for (int i = 0; i < count; ++i) {
      float angle = offset_angle +i *to_angle;
      knots[i] = new Bezier();
      knots[i].from_angle(angle,mag);
    }
  }

  public void show(PGraphics renderer, vec pos, float radius) {
    int knot_num = knots.length;
    if (knot_num <= 2) {
      // Ignores case where curve with 2 knots could
      // be drawn by a single bezierCurve function.
      return;
    }

    Bezier previous_knot = knots[0];
    Bezier current_knot;

    renderer.beginShape();

    vec3 temp_pos = previous_knot.get_pos().xyz().mult(radius).add(pos);
    renderer.vertex(temp_pos.x(),temp_pos.y());

    for (int i = 1 ; i <= knot_num; i++) {
      current_knot = knots[i%knot_num];
      vec3 a = previous_knot.get_a().xyz().mult(radius).add(pos);

      temp_pos = current_knot.get_pos().xyz().mult(radius).add(pos);
      vec3 b = current_knot.get_b().xyz().mult(radius).add(pos);
      renderer.bezierVertex(a.x,a.y,b.x,b.y,temp_pos.x,temp_pos.y);
      previous_knot = current_knot;
    }
    renderer.endShape(CLOSE);
  }

  public Bezier [] get_bezier() {
    return knots;
  }
}

public class Bezier {
  vec3 pos;
  vec3 fore_handle;
  vec3 rear_handle;

  public Bezier() {
    pos = vec3();
    fore_handle = vec3();
    rear_handle = vec3();
  }

  // set 
  public void set_pos(vec pos) {
    this.pos.set(pos);
  }

  public void set_a(vec fore) {
    this.fore_handle.set(fore);
  }

  public void set_b(vec rear) {
    this.rear_handle.set(rear);
  }

  // engine
  public void from_angle(float angle, float handle_mag) {
    float cos_angle = cos(angle);
    float sin_angle = sin(angle);
    
    vec2 pos = new vec2(cos_angle,sin_angle);
    set_pos(pos);
    set_a(vec2(pos.x -sin_angle *handle_mag, pos.y +cos_angle *handle_mag)); 
    set_b(vec2(pos.x +sin_angle *handle_mag, pos.y -cos_angle *handle_mag));
  }
  
  // get
  public vec3 get_pos() {
    return pos;
  }

  public vec3 get_a() {
    return fore_handle;
  }

  public vec3 get_b() {
    return rear_handle;
  }
}

















