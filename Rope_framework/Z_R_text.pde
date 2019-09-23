/**
* R_Text
* v 0.0.2
* 2019-2019
*/
import geomerative.*;

public class R_Typewriter {
  RShape geom_group;
  String sentence;

  String path;
  String path_vector = null;
  String type;
  String [] type_wanted;

  PFont font;
  int size;
  vec3 pos;
  float angle = 0;
  boolean reset_cloud;
  int align = LEFT;

  public R_Typewriter(PApplet pa, String path, int size) {
    geomerative.RG.init(pa); // Geomerative
    build(path,size,"ttf","otf");
  }

  public R_Typewriter(PApplet pa, String path, int size, String... type_wanted) {
    geomerative.RG.init(pa); // Geomerative
    build(path,size,type_wanted);
  }

  private void build(String path, int size, String... type_wanted) {
    if(extension_is(path,type_wanted)) {
      this.type_wanted = type_wanted;
      this.path = path;
      this.size = size;
      this.font = createFont(this.path,this.size);
      this.type = extension(this.path);
      reset_cloud = true;
    } else {
      printErr("class R_Text: path don't match with any font type:",path);
    }
  }

  // SET
  void path(String path) {
    if(extension_is(path,type_wanted) && !this.path.equals(path)) {
      this.path = path;
      this.font = createFont(this.path,this.size);
    } else {
      printErr("class R_Text method set(): path don't match with any font type:",path);
    }
  }

  void size(int size) {
    if(this.size != size) {
      this.size = size;
      this.font = createFont(this.path,this.size);
      reset_cloud = true;
    }
  }

  void align(int align) {
    this.align = align;
  }

  void angle(float angle){
    this.angle = angle;
  }

  void sentence(String sentence) {
    if(this.sentence == null || !this.sentence.equals(sentence)) {
      this.sentence = sentence;
    }
  }

  void pos(vec pos) {
    pos(pos.x(),pos.y(),pos.z());
  }

  void pos(ivec pos) {
    pos(pos.x(),pos.y(),pos.z());
  }

  void pos(float x, float y) {
    pos(x,y,0);
  }

  void pos(float x, float y, float z){
    if(pos == null) {
      pos = vec3(x,y,z);
    } else {
      pos.set(x,y,z);
    }
  }

  // GET
  vec3 pos() {
    if(pos == null) {
      pos = vec3();
    }
    return pos;
  }

  int size() {
    return size;
  }

  float get_angle(){
    return this.angle;
  }

  String get_path() {
    return this.path;
  }

  void reset(){
    reset_cloud = true;
  }

  ArrayList<vec3>points;
  vec3 [] get_points(String sentence){
    if(points == null) {
      points = new ArrayList<vec3>();
    }
    sentence(sentence);
    if(extension_is(path,"ttf")){
      path_vector = path;
    }

    if(path_vector != null && (geom_group == null || reset_cloud)) {
      reset_cloud = false;
      try {
        geom_group = geomerative.RG.getText(sentence,path_vector,size,align);
        points.clear();
        for(int i = 0 ; i < geom_group.children.length ; i++) {
          RPoint[] geom_pts = geom_group.children[i].getPoints();
          for(RPoint p : geom_pts) {
            points.add(geom_to_vec(p).add(pos()));
          }
        }
      } catch (Exception e) {
        e.printStackTrace();
        println("path vector",path_vector);
      } 
    }

    return points.toArray(new vec3[points.size()]); 
  }

  vec3 geom_to_vec(RPoint p){
    return vec3(p.x,p.y,0);
  }

  // SHOW
  void show(String sentence){
    if(pos == null) {
      pos = vec3();
    }
    if(this.angle != 0){
      push();
      translate(pos);
      rotate(angle);
    }
    textFont(font);
    textAlign(align);
    if(this.angle != 0){
      text(sentence,vec3());
      pop();
    } else {
      text(sentence,pos);
    }
  }
}


