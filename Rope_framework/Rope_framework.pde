/**
* Rope Framework
* v 1.0.0
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*/





void setup() {
  size(500,500,P3D);
  int num = 30;
  float radius = 100;
	background(255);
  circle(width *.5, height *.5,radius,num);
}

Curve circle;
void circle(float x, float y, float radius, int num) {
	float offset_angle = 0;
	circle = Curve.circle(num,offset_angle);
	translate(width * 0.5, height * 0.5);
  circle.draw(g,radius);

  // for(int i = 0 ; i < circle.get_knots().length ; i++) {
  // 	println(circle.get_knots()[i].get_pos());
  // 	println(circle.get_knots()[i].get_a());
  // 	println(circle.get_knots()[i].get_b());
  // }



}




/**
* Circle vertex refactoring
* v 0.0.2
* 2019-2019
* @author @behreajj from Processing forum
* @auther @stanlepunk for the refactoring
* @see https://discourse.processing.org/t/draw-circle-shape-with-vertex/8558/2 the Forum post for the original 
*/

static class Curve {
  boolean loop = false;
  Knot[] knots;

  Curve(boolean loop, Knot... knots) {
    this.loop = loop;
    this.knots = knots;
  }

  void draw(PGraphics renderer, float radius) {
    int knot_num = knots.length;
    if (knot_num <= 2) {
      // Ignores case where curve with 2 knots could
      // be drawn by a single bezierCurve function.
      return;
    }

    Knot previous_knot = knots[0];
    Knot current_knot;

    int end = loop ? knot_num + 1: knot_num;

    renderer.beginShape();

    vec3 pos = previous_knot.get_pos().mult(radius);
    renderer.vertex(pos.x(),pos.y());

    for (int i = 1; i < end; i++) {
      current_knot = knots[i%knot_num];
      vec3 a = previous_knot.get_a().mult(radius);

      pos = current_knot.get_pos().mult(radius);;
      vec3 b = current_knot.get_b().mult(radius);
      renderer.bezierVertex(a.x,a.y,b.x,b.y,pos.x,pos.y);
      previous_knot = current_knot;
    }
    renderer.endShape(CLOSE);
  }

  static Curve circle(int count, float offset_angle) {
  	Knot[] knots = new Knot[count];
    float step = 1.0 /count;
    float to_angle = TWO_PI *step;
    float mag = (4.0 / 3.0) * tan(HALF_PI *step);
    for (int i = 0; i < count; ++i) {
      float angle = offset_angle +i *to_angle;
      knots[i] = Knot.from_angle(angle,mag);
    }
    return new Curve(true,knots);
  }

  public Knot [] get_knots() {
  	return knots;
  }
}


static class Knot {
  vec3 coord = new vec3();
  vec3 fore_handle = new vec3();
  vec3 rear_handle = new vec3();

  private Knot(vec3 coord, vec3 fore, vec3 rear) {
    set(coord,fore,rear);
  }
  // set 
  private Knot set(vec3 coord, vec3 fore, vec3 rear) {
    this.coord.set(coord);
    this.fore_handle.set(fore);
    this.rear_handle.set(rear);
    return this;
  }

  static Knot from_angle(float angle, float handle_mag) {
    float cos_angle = cos(angle);
    float sin_angle = sin(angle);
    
    vec2 coord = new vec2(cos_angle,sin_angle);
    vec2 fore = new vec2(coord.x -sin_angle *handle_mag, coord.y +cos_angle *handle_mag);
    vec2 rear = new vec2(coord.x +sin_angle *handle_mag, coord.y -cos_angle *handle_mag);
    return new Knot(new vec3(coord.x,coord.y,0), new vec3(fore.x,fore.y,0), new vec3(rear.x,rear.y,0));
  }
  
  // get
  public vec3 get_pos() {
  	return coord;
  }

  public vec3 get_a() {
  	return fore_handle;
  }

  public vec3 get_b() {
  	return rear_handle;
  }
}
























/*

static class Curve {
  boolean loop = false;
  Knot[] knots;

  Curve(boolean loop, Knot... knots) {
    this.loop = loop;
    this.knots = knots;
  }

  void draw(PGraphics renderer) {
    int knot_num = knots.length;
    if (knot_num <= 2) {
      // Ignores case where curve with 2 knots could
      // be drawn by a single bezierCurve function.
      return;
    }

    Knot previous_knot = knots[0];
    Knot current_knot;
    vec3 coord;
    vec3 fore_handle;
    vec3 rear_handle;
    int end = loop ? knot_num + 1: knot_num;

    renderer.beginShape();
    coord = previous_knot.coord;
    renderer.vertex(coord.x, coord.y);

    for (int i = 1; i < end; ++i) {
      current_knot = knots[i % knot_num];
      fore_handle = previous_knot.fore_handle;
      coord = current_knot.coord;
      rear_handle = current_knot.rear_handle;
      renderer.bezierVertex(fore_handle.x, fore_handle.y, rear_handle.x, rear_handle.y, coord.x, coord.y);
      previous_knot = current_knot;
    }
    renderer.endShape();
  }

  static Curve circle(int count, float offset_angle, float radius) {
  	Knot[] knots = new Knot[count];
    float inverse_knot_count = 1.0 / (float)count;
    float to_angle = TWO_PI * inverse_knot_count;
    float mag = radius * (4.0 / 3.0) * tan(HALF_PI * inverse_knot_count);
    for (int i = 0; i < count; ++i) {
      float angle = offset_angle +i *to_angle;
      knots[i] = Knot.from_angle(angle, radius, mag);
    }
    return new Curve(true,knots);
  }

  public Knot [] get_knots() {
  	return knots;
  }
}


static class Knot {
  vec3 coord = new vec3();
  vec3 fore_handle = new vec3();
  vec3 rear_handle = new vec3();

  private Knot(vec3 coord, vec3 fore, vec3 rear) {
    set(coord,fore,rear);
  }
  // set 
  private Knot set(vec3 coord, vec3 fore, vec3 rear) {
    this.coord.set(coord);
    this.fore_handle.set(fore);
    this.rear_handle.set(rear);
    return this;
  }

  static Knot from_angle(float angle, float radius, float handle_mag) {
    float cos_angle = cos(angle);
    float sin_angle = sin(angle);
    
    vec2 coord = new vec2(cos_angle,sin_angle).mult(radius);
    vec2 fore = new vec2(coord.x -sin_angle *handle_mag, coord.y +cos_angle *handle_mag);
    vec2 rear = new vec2(coord.x +sin_angle *handle_mag, coord.y -cos_angle *handle_mag);
    return new Knot(new vec3(coord.x,coord.y,0), new vec3(fore.x,fore.y,0), new vec3(rear.x,rear.y,0));
  }
  
  // get
  public vec3 get_pos() {
  	return coord;
  }

  public vec3 get_a() {
  	return fore_handle;
  }

  public vec3 get_b() {
  	return rear_handle;
  }
}
*/

















