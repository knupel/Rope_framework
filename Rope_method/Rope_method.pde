/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


void setup() {
  size(500,500,P3D);
  // frameRate(1000);

}


Vec3 dir = Vec3();
void draw() {
  background_rope(0);
  Vec3 pos = Vec3(width/2,height/2,0);
  Vec3 size = Vec3(200,200,40);
  dir.add(.01,.02,.05);
  fill(255,0,0,25);
  stroke(255,0,0);
  strokeWeight(1);
  //costume(pos,size,dir,STAR_ROPE);
  set_costume_star_summits(36);
  // set_costume_star_angle(0);
  set_costume_star_ratio(.1,.2,.3,.4,.5,.6,.7,.8,.9);

  Costume c = new Costume(STAR_3D_ROPE);
  costume(pos,size,dir,c);
  // costume(pos,size,dir,STAR_3D_ROPE);
  /*
  set_costume_virus_mutation(2);
  set_costume_virus_node(4);
  set_costume_virus_num(36);
  costume(pos,size,dir,VIRUS_ROPE);
  */

}














