/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


void setup() {
  print_constants_rope();
  /*
  size (300,300,P3D);
  init_layer();
  begin_layer();
  get_layer(0).colorMode(HSB,360,100,100);
  end_layer();
  */

}
/*
Obj obj = new Obj(this);
void draw() {
  background(0);
  begin_layer();
  obj.work_widthout_layer();

  end_layer();
  g.image(get_layer(),0,0);

}
*/

abstract class Ghost {
  protected PVector pos, rot, sca;
  void applyTransforms() {

    translate(pos.x,pos.y,pos.z);
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.z);
    //scale(sca.x, sca.y, sca.z);
  }

}
class Obj extends Ghost {
  PApplet pa ;
  Obj(PApplet pa) {
    this.pa = pa ;
    rot = new PVector();
  }
  void work_widthout_layer() {
    // pushStyle();
    rot.x += .01;
    rot.y += .02;
    rot.z += .005;
    
    background_rope(0,0,100);
    fill(0,100,100);
    stroke(0,0,0);
    strokeWeight(1);
        
    pos = new PVector(mouseX,height/2,width/3);

    pushMatrix(); 
    rectMode(CENTER);
    applyTransforms();
    rect(0,0,width,height);
    box(100);
    popMatrix();
    //popStyle();

  }
}








