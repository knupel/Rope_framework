/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/




import rope.core.R_Graphic;
import rope.R_State.State;


/**
* Crope Palette exemple
* Processing 3.5.4
* Rope library 0.12.1.41
* v 0.1.0
* 2021-2021
*/


PShader shader;
PGraphics pg;
int px;
int py;
int sx;
int sy;

void setup() {
  px = 30;
  py = 30;
  sx = width - 2 *px;
  sy = height - 2 *py;
	// only in P2D or P3D
  size(400, 400, P2D);
  pg = createGraphics(sx, sy, P2D);
  shader = loadShader("shader/fx_color/gradient.glsl");

}


void draw() {
  background(0);
  float arg = constrain(map(mouseX,0,width,0,1),0,1);
  
  // gradiant spectrum color
  shader.set("min_hue",0.5);
  shader.set("max_hue",1.0);

  // gradient hue
  shader.set("hue",arg);
  shader.set("start_sat",0.7);
  shader.set("min_sat",0.0);
  shader.set("max_sat",1.0);

  shader.set("start_bri",0.9);
  shader.set("min_bri",0.0);
  shader.set("max_bri",1.0);

  // direction of the gradient
  shader.set("vert_is",false);
  // shader.set("mode",1);

  // noStroke();
  pg.shader(shader);
  pg.beginDraw();
  pg.rect(0,0,sx,sy,0);
  // pg.beginShape();
  // pg.vertex(0,0); // top left
  // pg.vertex(sx,0); // top right
  // pg.vertex(sx, sy); // bottom left
  // pg.vertex(0, sy); // bottom right
  // pg.endShape();
  pg.endDraw();
  image(pg,px,py);


  ellipse(mouseX,mouseY, 50,50);

}




