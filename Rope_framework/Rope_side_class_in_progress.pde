/**
*
* Place tobe to add you massive classe and test it :)
* 
*/
/**
* R_Knob
* Processing 3.5.4
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope
* v 1.4.0
* 2019-2021
*/
// package rope.gui.button;

import java.util.Arrays;

import rope.R_State.State;
import rope.gui.R_Mol;
import rope.vector.bvec2;
import rope.vector.vec2;
import rope.vector.vec3;

public class R_Knob extends R_Button {
  protected R_Mol [] molette;
  protected R_Mol guide;
  // angle start and end for the limit knob
  // protected vec2 limit;
  protected vec3 limit;
  private vec2 size_limit = new vec2(-3,3);
  protected boolean clockwise = true;
  private float threshold = 0.1f;

  private boolean init_molette_is;
  private boolean mol_used_is;

  private float previous_angle_ref;
  private float next_angle_ref;

  private boolean open_knob = true;

  private int drag_direction = CIRCULAR;
  private float drag_force = 0.1f;
  
  public R_Knob(vec2 pos, float size) {
    
    super("Knob", pos, new vec2(size));
    set_value(0.5f); // default > one molette > half position
    set_limit(SOUTH_WEST,SOUTH_EAST);
    init_guide();
  }
  
  public R_Knob(String type, vec2 pos, float size) {
    super(type, pos, new vec2(size));
    set_value(0.5f); // default > one molette > half position
    set_limit(SOUTH_WEST,SOUTH_EAST);
    init_guide();
  }


  // set size

  public R_Knob set_value(float pos_norm) {
    float [] arr = { pos_norm };
    set_value(arr);
    return this;
  }
  
  public R_Knob set_value(float... pos_norm) {
    set_value_calc(pos_norm);
    init_molette_is = false;
    return this;
  }

  protected void set_value_calc(float... pos_norm) {
    Arrays.sort(pos_norm);
		init_molette(pos_norm.length);
    for(int i = 0 ; i < molette.length ; i++) {
      float ang = map(pos_norm[i],0,1,0,TAU);
      if(!open_knob) {
        ang = constrain_angle(ang);
      }
      molette[i].angle(ang);
    }
  }



    /**
   * 
   * @param angle_a
   * @param angle_b
   * @return
   */
  public R_Knob set_limit(float ax, float ay) {
    
    R_Trigo trig_x = new R_Trigo(ax);
    R_Trigo trig_y = new R_Trigo(ay);
    vec3 buf = new vec3(ax, ay, 0);
    boolean print_is = true;
    if(print_is) print_out("");
    if(print_is) print_out("brut angle", buf.x(), buf.y());
    boolean vert_is = all(only(trig_x.point_north(), trig_y.point_north()),
                          only(trig_x.point_south(), trig_y.point_south()));
    boolean hori_is = all(only(trig_x.point_east(), trig_y.point_east()),
                          only(trig_x.point_west(), trig_y.point_west()));
    boolean north_is = all( all(trig_x.disc_north(), trig_y.disc_north()),
                          all(!vert_is, !hori_is));
    boolean south_is = all( all(trig_x.disc_south(), trig_y.disc_south()), 
                          all(!vert_is, !hori_is));
    boolean west_is = all(all(trig_x.disc_west(), trig_y.disc_west()),
                          all(!vert_is, !hori_is));
    boolean east_is = all(all(trig_x.disc_east(), trig_y.disc_east()),
                          all(!vert_is, !hori_is));

    if(print_is) print_out("-------------------------------------");
    if(print_is)  print_out("vert_is",vert_is);
    if(print_is) print_out("hori_is",hori_is);
    if(print_is) print_out("-------------------------------------");
    if(print_is) print_out("north_is",north_is);
    if(print_is) print_out("south_is",south_is);
    if(print_is) print_out("-------------------------------------");
    if(print_is) print_out("west_is",west_is);
    if(print_is) print_out("east_is",east_is);
    if(print_is) print_out("-------------------------------------");

    clockwise = true;
    
    if(any(north_is, south_is)) {
      // normal case
      if(print_is) print_out("any(north_is, south_is)", north_is, south_is, buf);
      if(buf.x() > buf.y()) clockwise = false;
    }
    if(west_is) {
      // reverse case
      if(print_is) print_out("west_is", west_is, buf);
      if(buf.x() < buf.y()) clockwise = false;
    }

    if(east_is) {
      // normal case
      if(print_is) print_out("east_is", west_is, buf);
      if(buf.x() > buf.y()) clockwise = false;
    }

    if(hori_is) {
      if(print_is) print_out("hori_is", hori_is, buf);
      if(buf.x() != 0 && buf.y() != TAU) clockwise = false;
    }

    if(vert_is) {
      if(print_is) print_out("vert_is", vert_is, buf);
      if(buf.x() != HPI) clockwise = false;
    }

    // other case
    if(!any(north_is, south_is, east_is, west_is, hori_is, vert_is)) {
       // reverse case
      if(print_is) print_out("!any(north_is, south_is,east_is,west_is, hori_is, vert_is)", north_is, south_is,east_is,west_is, hori_is, vert_is, buf);
      if(buf.x() < buf.y()) clockwise = false;
    }
    
    if(print_is) print_out("-------------------------------------");
    if(print_is) print_out("clockwise", clockwise);

    boolean a_greater_b_is = false;
    if(buf.x() > buf.y()) {
      a_greater_b_is = true;
    }
    
    if(print_is) print_out("-------------------------------------");
    if(print_is) print_out("Translate");
    translate_angle(buf);

    if(this.limit == null) {
      this.limit = buf.copy();
    } else {
      this.limit.set(buf);
    }
    if(print_is) print_out("set_limit()",this.limit);
    return this;
  }

  private void translate_angle(vec3 range) {
    float x = 0;
    float y = 0;
    float offset = 0;
    vec3 sign = sign(range);
    // check to trigonometry from 0 to 2PI (TAU)
    if(sign.x() == -1) x = range.x() + TAU; else x = range.x();
    if(sign.y() == -1) y = range.y() + TAU; else y = range.y();

    boolean greater = false;
    if(x > y) {
      greater = true;
    }
    offset = x;
    x = 0;
    y -=offset;
    // check to back to classic trigonometry
    if(sign.y() == -1) y -= TAU;
    // } else {
    //   y = offset;
    // }
    range.set(x,y,offset);
  }


  @Deprecated public R_Knob set_range(float angle_a, float angle_b) {
    return set_limit(angle_a, angle_b);
  }



    /**
   * 
   * @param open_knob
   * @return
   */
  public R_Knob limit(boolean open_knob) {
    this.open_knob = !open_knob;
    return this;
  }

  public R_Knob set_size_limit(float min, float max) {
    if(min > max) {
      this.size_limit.set(max,min);
      return this;
    }
    this.size_limit.set(min,max);
    return this;
  }







  /**
   * MOLETTE
   */
  protected void init_guide() {
    if(this.guide == null) {
      this.guide = new R_Mol();
      this.guide.inside_is = false;
      this.guide.size(this.size.x()/4);
      this.guide.used_is = false;
    }
  }

  protected void init_molette(int len) {
		if(molette == null || len != molette.length) {
			molette = new R_Mol[len];
      for(int i = 0 ; i < len ; i++) {
        this.molette[i] = new R_Mol();
        this.molette[i].size(this.size.x()/4);
        this.molette[i].id = 0;
        this.molette[i].used_is = false;
        this.molette[i].inside_is = false;
      }
		}
	}


  public R_Knob set_type_mol(int molette_type) {
    for(int i = 0 ; i < molette.length ; i++) {
      this.molette[i].set_shape_type(molette_type);
    }
    return this;
  }
  
  public R_Knob set_size_mol(vec2 size) {
    return set_size_mol(size.x(),size.y());
  }

  public R_Knob set_size_mol(float size) {
    return set_size_mol(size,size);
  }

  public R_Knob set_size_mol(float w, float h) {
    for(int i = 0 ; i < molette.length ; i++) {
      this.molette[i].size(w,h);
    }
    return this;
  }

  public R_Knob set_dist_mol(float dist) {
    for(int i = 0 ; i < molette.length ; i++) {
      this.molette[i].set_dist(dist);
    }
    return this;
  }


  /**
   * GUIDE
   */

  public R_Knob set_dist_guide(float dist) {
    this.guide.set_dist(dist);
    return this;
  }

  public R_Knob set_size_guide(float size) {
    return set_size_guide(size,size);
  }

  public R_Knob set_size_guide(float w, float h) {
    this.guide.size(w,h);
    return this;
  }

  public R_Knob set_drag(int direction) {
    if(direction == VERTICAL) {
      drag_direction = VERTICAL;
    } else if(direction == CIRCULAR) {
      drag_direction = CIRCULAR;
    } else {
      drag_direction = HORIZONTAL;
    }
    return this;
  }

  public R_Knob set_drag_force(float force) {
    this.drag_force = force;
    return this;
  }




  // ASPECT MOLETTE and GUIDE

  public R_Knob set_fill_mol(int c) {
    set_fill_mol(c,c);
    return this;
  }

  public R_Knob set_fill_mol(int c_in, int c_out) {
    for(int i = 0 ; i < molette.length ; i++) {
      this.molette[i].set_fill_in(c_in);
      this.molette[i].set_fill_out(c_out);
    }
    this.guide.set_fill_in(c_in);
    this.guide.set_fill_out(c_out);
    return this;
  }
  
  public R_Knob set_stroke_mol(int c) {
    set_stroke_mol(c,c);
    return this;
  }

  public R_Knob set_stroke_mol(int c_in, int c_out) {
    for(int i = 0 ; i < molette.length ; i++) {
      this.molette[i].set_stroke_in(c_in);
      this.molette[i].set_stroke_out(c_out);
    }
    this.guide.set_stroke_in(c_in);
    this.guide.set_stroke_out(c_out);
    return this;
  }

  public R_Knob set_thickness_mol(float thickness) {
    for(int i = 0 ; i < molette.length ; i++) {
      this.molette[i].set_thickness(thickness);
    }
    this.guide.set_thickness(thickness);
    return this;
  }





  // get
  /**
   * for the future when there is more molette
   */
  public float get(int index) {
    if(index >= 0 && index < molette.length)
      return this.molette[index].angle();
    return Float.NaN;
  }

  public float get() {
    return get(0);
  }

  public float [] get_all() {
    float [] value_array = new float[this.molette.length];
    for(int i = 0 ; i < value_array.length ; i++) {
			value_array[i] = get(i);
		}
    return value_array;
  }

  public R_Mol [] get_mol() {
    R_Mol [] arr_mol = new R_Mol[this.molette.length + 1];
    int index = 0;
    while(index < this.molette.length) {
      arr_mol[index] = this.molette[index];
      index++;
    }
    arr_mol[index] = this.guide;
    return arr_mol;
  }

  public R_Mol get_mol(int index) {
    R_Mol [] arr = get_mol();
    if(index > 0 && index < arr.length) {
      return arr[index];
    }
    return null;
  }



  
  // show
  public void show_limit() {
    boolean on_off_is = true;
    if(!open_knob) {
      strokeWeight(1);
      int c = 0;
      if(on_off_is) {
        if (is) {
          if (inside() && auth_rollover) {
            c = stroke_out_ON; 
          } else {
            c = stroke_in_ON;
          }
        } else {
          if (inside() && auth_rollover) {
            c = stroke_out_OFF; 
          } else {
            c = stroke_in_OFF;
          }
        }
        stroke(c);
      } else {
        stroke(c);
      }
      vec2 final_pos = pos.copy().add(size.copy().mult(0.5f));
      float radius = size.x()*0.5f;
      vec2 a_min = projection(limit.a(),radius+size_limit.min()).add(final_pos);
      vec2 b_min = projection(limit.a(),radius+size_limit.max()).add(final_pos);
      line(a_min,b_min);

      vec2 a_max = projection(limit.b(),radius+size_limit.min()).add(final_pos);
      vec2 b_max = projection(limit.b(),radius+size_limit.max()).add(final_pos);      
      line(a_max,b_max);
    }
  }


  public void show_mol() {
    for(int i = 0 ; i < molette.length ; i++) {
      if(!init_molette_is) {
       this.molette[i].pos(projection(this.molette[i].angle(), this.molette[i].get_dist()));
      }
      this.molette[i].show();
    }
    init_molette_is = true;
  }

  public void show_guide() {
    if(molette.length > 1) {
      vec2 offset = add(this.pos, this.size().copy().div(2));
      this.guide.pos(projection(this.guide.angle(), this.guide.get_dist()).add(offset));
      this.guide.show();
    }
  }

  public void show_struc_pie() {
    aspect_impl(true);
    vec2 buf_pos = pos.copy().add(size.x() /2, size.y() / 2);
    int index_a = 0;
    int index_b = molette.length -1;
    
    if(molette.length > 1) {
      show_struc_pie_impl(buf_pos, index_a, index_b);
      return;
    }
    arc(buf_pos,size,0,this.molette[index_a].angle(),PIE);
    return; 
  }

  private boolean show_struc_pie_impl(vec2 buf_pos, int index_a, int index_b) {
    if(clockwise) {
      return show_struc_pie_clockwise(buf_pos, index_a, index_b);
    } else {
      return show_struc_pie_counter_clockwise(buf_pos, index_a, index_b);
    }
  }


  private boolean show_struc_pie_clockwise(vec2 buf_pos, int a, int b) {
    float ang_a = this.molette[a].angle();
    float ang_b = this.molette[b].angle();
    // float ang_a = closer(this.molette[a].angle());
    // float ang_b = closer(this.molette[b].angle());
    // boolean spec_limit_a_is = any(limit.a() == 0 ,limit.a() == TAU);
    // boolean spec_limit_b_is = any(limit.b() == 0, limit.b() == TAU);
    boolean upper_is = ang_a > ang_b;
    boolean a_zero = ang_a == 0;
    boolean b_zero = ang_b == 0;

    if(upper_is) {
      if(a_zero) {
        // print_out("upper_is /// a_zero /// clockwise /// ang_a, ang_b",ang_a, ang_b);
        ang_a = TAU;
        arc(buf_pos, this.size, ang_a, ang_b, PIE);
      } else if(b_zero) {
        // print_out("upper_is /// b_zero /// clockwise /// ang_b, ang_a",ang_b, ang_a);
        ang_b = TAU;
        arc(buf_pos, this.size, ang_b, ang_a, PIE);
      } else {
        // print_out("upper_is /// clockwise /// ang_b, ang_a",ang_b, ang_a);
        arc(buf_pos, this.size, ang_b, ang_a, PIE);
      }
    } else {
      if(a_zero) {
        // print_out("normal /// a_zero  /// clockwise /// ang_b, ang_a",ang_b, ang_a);
        arc(buf_pos, this.size, ang_b, ang_a, PIE);
      } else {
        // print_out("normal /// clockwise /// ang_a, ang_b",ang_a, ang_b);
        arc(buf_pos, this.size, ang_a, ang_b, PIE);
      }
    }
    return true;
  }

  private boolean show_struc_pie_counter_clockwise(vec2 buf_pos, int a, int b) {
    float ang_a = this.molette[a].angle();
    float ang_b = this.molette[b].angle();
    // float ang_a = constrain_angle(this.molette[a].angle());
    // float ang_b = constrain_angle(this.molette[b].angle());
    boolean [] beyond_list = beyond_limit(limit.a());
    boolean beyond = only(beyond_list);

    if(beyond) {
      if(beyond_list[a]) {
        // print_out("counter ang_a - TAU, ang_b",ang_a - TAU, ang_b);
        arc(buf_pos,size, ang_a - TAU, ang_b, PIE);
        return true;
      }
      if(beyond_list[b]) {
        // print_out("counter ang_b - TAU, ang_a",ang_b - TAU, ang_a);
        arc(buf_pos,size, ang_b - TAU, ang_a, PIE);
        return true;
      }
    } 
    if(ang_a > ang_b) {
      // print_out("counter ang_b, ang_a",ang_b, ang_a);
      arc(buf_pos, this.size, ang_b, ang_a, PIE);
      return true;
    }
    // print_out("counter ang_a, ang_b",ang_a, ang_b);
    arc(buf_pos,size,ang_a, ang_b, PIE);
    return true;
  }

  
  




  // update

  public void update() {
    boolean new_event = all(State.env().event.a(),State.env().event.b(), State.env().event.c());
    update(State.env().pointer.x(),State.env().pointer.y(),new_event);
  }
  
  @Deprecated public void update(float x, float y) {
    boolean new_event = all(State.env().event.a(),State.env().event.b(), State.env().event.c());
    update(x,y,new_event);
  }

  /**
   * 
   * @param x
   * @param y
   * @param event
   */
  public void update(float x, float y, boolean event) {
    cursor(x,y);
    this.event = event;
    boolean bang_is = any(State.env().bang.a(), State.env().bang.b(), State.env().bang.c());
    guide_update(bang_is);
    molette_update(bang_is);
  }




  // guide molette update
  private void guide_update(boolean bang_is) {
    boolean inside_is = this.guide.inside(cursor);
    boolean used_is = all(inside_is, bang_is, !mol_used_is);
    this.guide.inside_is(inside_is);
    if(this.event) {
      if(used_is) {
        this.guide.used(true);
        mol_used_is = true;
      }
    } else {
      this.guide.used(false);
    }

    if(this.guide.used_is()) {
      float angle = calc_angle_imp(this.guide.angle());
      float dif = angle - this.guide.angle();
      molette_update_from_guide(dif);
      render_mol(this.guide, angle);
    } else {
      guide_update_from_molette();
      mol_used_is = false;
    }
  }

  private void guide_update_from_molette() {
    float angle = 0;
    boolean [] beyond_list = beyond_limit(limit.a());
    boolean beyond = only(beyond_list);
    
    for(int i = 0 ; i < molette.length ; i++) {
      float ang_mol = this.molette[i].angle();
      if(all(beyond,beyond_list[i])) {
        ang_mol += TAU; 
      }
      angle += ang_mol;
    }
    angle /= molette.length;
    this.guide.angle(angle);
  }

  private void molette_update_from_guide(float dif_angle) {
    for(int i = 0; i < molette.length ; i++) {
      float ref_angle = molette[i].angle();
      float new_angle = ref_angle + dif_angle;
      if(!this.open_knob) {
        new_angle = constrain_angle(new_angle);
      }
      render_mol(this.molette[i], new_angle);
    }
  }



  // molette update
  private void molette_update(boolean bang_is) {
    for(int i = 0 ; i < molette.length ; i++) {
      this.molette[i].set_offset(pos.copy().add(size.copy().mult(0.5f)));
      boolean inside_is = this.molette[i].inside(cursor);
      boolean used_is = all(inside_is, bang_is, !mol_used_is);

      this.molette[i].inside_is(inside_is);
      if(used_is && this.event) {
        this.molette[i].used(true);
        mol_used_is = true;
      }
      if(!this.event) {
        this.molette[i].used(false);
        previous_angle_ref = this.molette[i].angle();
      }

      if(this.molette[i].used_is()) {
        // print_out("brut angle", this.molette[i].angle());
        float buf_angle = calc_angle(i, this.molette[i].angle());
        // print_out("calc_angle", buf_angle);
        render_mol(this.molette[i], buf_angle);
      } else {
        mol_used_is = false;
      }
      // finalize
      float angle = constrain_angle(molette[i].angle());
      molette[i].angle(angle);
    }
  }





  private void render_mol(R_Mol mol, float angle) {
    if(drag_direction != CIRCULAR) {
      float new_angle = previous_angle_ref + (angle -next_angle_ref);
      mol.angle(new_angle);
      mol.pos(projection(new_angle, mol.get_distance()));
    } else if(drag_direction == CIRCULAR) {
      mol.angle(angle);
      mol.pos(projection(angle, mol.get_distance()));
    }
  }



  /**
  * MISC
  */
  private boolean [] beyond_limit(float limit) {
    boolean [] beyond_limit_is = new boolean[molette.length];
    for(int i = 0 ; i < molette.length ; i++) {
      // beyond_limit_is[i] = molette[i].angle() >= limit;
      beyond_limit_is[i] = molette[i].angle() > limit;
    }
    return beyond_limit_is;
  }

  // private float to_2pi(float angle) {
  //   if(angle < 0) {
  //     return TAU + angle;
  //   }
  //   return angle;
  // }

  private float calc_angle(int index, float angle) {
    angle = calc_angle_imp(angle);
    if(!this.open_knob) {
      angle = constrain_angle(angle);
    }
    return angle;
  }


  private float calc_angle_imp(float angle) {
    if(drag_direction == HORIZONTAL) {
      angle = cursor.x() * drag_force;
    } else if(drag_direction == CIRCULAR) {
      vec2 temp = pos.copy().add(size.copy().mult(0.5f));
      angle = temp.angle(cursor);
      // if(angle < 0) {
      //   angle+= TAU;
      // }
    } else if(drag_direction == VERTICAL) {
      angle = cursor.y() * drag_force;
    }
    return angle;
    //return to_2pi(angle);
  }


  private float constrain_angle(float angle) {
    boolean print_is = false;
    if(print_is) print_out("");
    if(print_is) print_out("clockwise", clockwise);
    if(print_is) print_out("limit",this.limit);
    if(print_is) print_out("angle",angle);
    // bvec2 sup = new bvec2(angle >= this.limit.a(), angle >= this.limit.b());
    // bvec2 inf = new bvec2(angle <= this.limit.a(), angle <= this.limit.b());
    // boolean lab = this.limit.a() > this.limit.b();
    // if(print_is) print_out("inf", inf);
    // if(print_is) print_out("sup", sup);
    // print_out("");
    if(clockwise) {
      return constrain_angle_impl(angle, this.limit.a(), this.limit.b());
      // print_out("clockwise angle", this.limit, angle);
      // return constrain_angle_clockwise(angle, sup, inf, lab);
    } else {
      return constrain_angle_impl(angle, this.limit.b(), this.limit.a());
    }
    // print_out("counter angle", this.limit, angle);
    // return constrain_angle_counter_clockwise(angle, sup, inf, lab);
  }
  
  private float constrain_angle_impl(float angle, float limit_x, float limit_y) {
    float sign_lx = sign(limit_x);
    float sign_ly = sign(limit_y);
    float sign_ang = sign(angle);
    float lx = 0;
    float ly = 0;
    float ang = 0;

    boolean inf_a = false;
    boolean inf_b = false;

    // check to trigonometry from 0 to 2PI (TAU)
    if(sign_lx == -1) lx = limit_x + TAU; else lx = limit_x;
    if(sign_ly == -1) ly = limit_y + TAU; else ly = limit_y;
    if(sign_ang == -1) ang = angle + TAU; else ang = angle;

    boolean print_is = false;
    if(print_is) print_out("constrain_angle_impl");
    if(print_is) print_out("lx TAU", lx);
    if(print_is) print_out("ly TAU", ly);
    if(print_is) print_out("ang TAU", ang);


    if(ang < lx) return limit_x;
    if(ang > ly) return limit_y;
    return angle;
  }



  private float constrain_angle_clockwise(float angle, bvec2 sup, bvec2 inf, boolean lab) {
    boolean print_is = true;
    if(lab) {
      if(print_is) print_out("Limit A > B");

      // if(all(sup)) {
      //   if(print_is) print_out("SUP AB");
      //   return closer(angle);
      // }



      // if(inf.a() && sup.b()) {
      //   if(print_is) print_out("INF A SUP B");
      //   return closer(angle);
      // }
      
    } else {
      if(print_is) print_out("Limit B > A");
      if(any(inf)) {
        if(print_is) print_out("INF AB");
        return closer(angle);
      }
      // if(sup.a() && sup.b()) {
      //   if(print_is) print_out("SUP AB");
      //   return closer(angle);
      // }
      // if(inf.a()) {
      //   if(print_is) print_out("INF A");
      //   return closer(angle);
      // }
      // if(sup.b()) {
      //   if(print_is) print_out("SUP B");
      //   return closer(angle);
      // }
    }
    return angle;
  }

  private float constrain_angle_counter_clockwise(float angle, bvec2 sup, bvec2 inf, boolean lab) {
    boolean print_is = true;
    if(lab) {
      if(print_is) print_out("Limit A > B");
      // if(sup.a() && inf.b()) {
      //   if(print_is) print_out("INF B SUP B");
      //   return closer(angle);
      // }
      // if(sup.b() && inf.a()) {
      //   if(print_is) print_out("INF A SUP B");
      //   return closer(angle);
      // } 
    } else {
      if(print_is) print_out("Limit B > A", sup, inf);
      // if(sup.a()) {
      //   if(print_is) print_out("SUP A");
      //   return closer(angle);
      // }
      // if(inf.b()) {
      //   if(print_is) print_out("INF B");
      //   return closer(angle);
      // }
    }
    return angle;
  }



   private float closer(float angle) {
    R_Trigo tri_ang = new R_Trigo(angle);
    R_Trigo tri_lim_a = new R_Trigo(this.limit.a());
    R_Trigo tri_lim_b = new R_Trigo(this.limit.b());
    boolean card_a_is = any(tri_lim_a.point());
    boolean card_b_is = any(tri_lim_b.point());
    boolean card_is = all(card_a_is, card_b_is);

    boolean print_is = false;
    if(print_is)print_out(">>>---cardinal---------------------------", clockwise);
    if(print_is) print_out(">-- any cardinal a",tri_lim_a.point());
    if(print_is) print_out(">-- any cardinal b",tri_lim_b.point());
    if(print_is) print_out(">-- any cardianl in vatican ?",card_a_is, card_b_is, card_is);

    if(print_is) print_out(">>>---closer---------------------------",pa.frameCount);
    if(print_is) print_out(">>>-<<<->>>-disc angle",tri_ang.disc());
    if(print_is) print_out(">>>-<<->>>-<disc lim a",tri_lim_a.disc());
    if(print_is) print_out(">>>-<<<->>>-disc lim b",tri_lim_b.disc());
    if(print_is)print_out(">>>---quarter---------------------------", clockwise);
    if(print_is) print_out(">-- south east",tri_ang.disc_south_east(),tri_lim_a.disc_south_east(),tri_lim_b.disc_south_east());
    if(print_is) print_out(">-- south west",tri_ang.disc_south_west(),tri_lim_a.disc_south_west(),tri_lim_b.disc_south_west());
    if(print_is) print_out(">-- north west",tri_ang.disc_north_west(),tri_lim_a.disc_north_west(),tri_lim_b.disc_north_west());
    if(print_is) print_out(">-- north east",tri_ang.disc_north_east(),tri_lim_a.disc_north_east(),tri_lim_b.disc_north_east());

    if(print_is)print_out(">>>---half---------------------------", clockwise);
    if(print_is) print_out(">-- east",tri_ang.disc_east(),tri_lim_a.disc_east(),tri_lim_b.disc_east());
    if(print_is) print_out(">-- south",tri_ang.disc_south(),tri_lim_a.disc_south(),tri_lim_b.disc_south());
    if(print_is) print_out(">-- west",tri_ang.disc_west(),tri_lim_a.disc_west(),tri_lim_b.disc_west());
    if(print_is) print_out(">-- north",tri_ang.disc_north(),tri_lim_a.disc_north(),tri_lim_b.disc_north());

    if(print_is)print_out(">>>---info---------------------------", clockwise);
    if(print_is) print_out(">-- limit angle",this.limit,angle);


    if(print_is) print_out("ETAPE 0");
    if(all(tri_ang.disc_south_east(), tri_lim_a.disc_south_east(), !card_is)) return this.limit.a();
    if(all(tri_ang.disc_south_east(), tri_lim_b.disc_south_east(), !card_is)) return this.limit.b();
    if(print_is) print_out("ETAPE 1");
    if(all(tri_ang.disc_south_west(), tri_lim_a.disc_south_west(), !card_is)) return this.limit.a();
    if(all(tri_ang.disc_south_west(), tri_lim_b.disc_south_west(), !card_is)) return this.limit.b();
    if(print_is) print_out("ETAPE 2");
    if(all(tri_ang.disc_north_west(), tri_lim_a.disc_north_west(), !card_is)) return this.limit.a();
    if(all(tri_ang.disc_north_west(), tri_lim_b.disc_north_west(), !card_is)) return this.limit.b();
    if(print_is) print_out("ETAPE 3");
    if(all(tri_ang.disc_north_east(), tri_lim_a.disc_north_east(), !card_is)) return this.limit.a();
    if(all(tri_ang.disc_north_east(), tri_lim_b.disc_north_east(), !card_is)) return this.limit.b();
    if(print_is) print_out("ETAPE 4");
    float da = abs(abs(this.limit.a() - abs(angle)));
    float db = abs(abs(this.limit.b() - abs(angle)));
    if(print_is) print_out("ETAPE 5");
    if(any(tri_ang.disc_north(), tri_ang.disc_south()) && !any(card_a_is,card_b_is) ) {
      
    // if(any(tri_ang.disc_north(), tri_ang.disc_south()) && card_is) {
      if(da < db) {
        return this.limit.a();
      } else {
        return this.limit.b();
      }
    }

    // upper case
    // if(all(cardinal_a_is,cardinal_b_is)) {
    //   return angle;
    // }
    if(print_is) print_out("ETAPE 6");
    boolean upper_ab_is = (angle > limit.a() && angle > limit.b());
    if(upper_ab_is && any(card_a_is,card_b_is)) {
      return max(limit.a(), limit.b());
    }

  

    if(print_is) print_out("ETAPE FINALE --- rien de particulier");
    return angle;
  }















  // private float constrain_angle_clockwise(float angle, bvec2 sup, bvec2 inf, boolean lab, R_Trigo ... tri) {
  //   boolean print_is = true;
  //   if(lab) {
  //     if(print_is) print_out("LAB");
  //     if(sup.a() && sup.b()) {
  //       if(print_is) print_out("SUP AB");
  //       return closer(angle);
  //     }

  //     if(inf.a() && sup.b()) {
  //       if(print_is) print_out("INF A SUP B");
  //       return closer(angle);
  //     }
      
  //   } else {
  //     if(print_is) print_out("LBA");
  //     if(sup.a() && sup.b()) {
  //       if(print_is) print_out("SUP AB");
  //       return closer(angle);
  //     }
  //     if(inf.a()) {
  //       if(print_is) print_out("INF A");
  //       return closer(angle);
  //     }
  //     if(sup.b()) {
  //       if(print_is) print_out("SUP B");
  //       return closer(angle);
  //     }
  //   }
  //   return angle;
  // }

  // private float constrain_angle_counter_clockwise(float angle, bvec2 sup, bvec2 inf, boolean lab, R_Trigo ... tri) {
  //   boolean print_is = true;
  //   if(lab) {
  //     if(print_is) print_out("LAB");
  //     if(sup.a() && inf.b()) {
  //       if(print_is) print_out("INF B SUP B");
  //       return closer(angle);
  //     }
  //     if(sup.b() && inf.a()) {
  //       if(print_is) print_out("INF A SUP B");
  //       return closer(angle);
  //     } 
  //   } else {
  //     if(print_is) print_out("LBA");
  //     if(sup.a()) {
  //       if(print_is) print_out("SUP A");
  //       return closer(angle);
  //     }
  //     if(inf.b()) {
  //       if(print_is) print_out("INF B");
  //       return closer(angle);
  //     }
  //   }
  //   return angle;
  // }

  //  try to remove it

  // private float closer(float angle) {
  //   float lim_a = this.limit.a();
  //   float lim_b = this.limit.b();
  //   if(lim_a < 0) lim_a = 0;
  //   if(lim_a >= TAU) lim_a = 0;
  //   if(lim_b < 0) lim_b = 0;
  //   if(lim_b >= TAU) lim_b = 0;

  //   float diff_a = abs(angle - lim_a);
  //   float diff_b = abs(angle - lim_b);
    

  //   boolean upper_is = diff_a > diff_b;
  //   // float diff = abs(diff_b -diff_a);
  //   // if(upper_is) 
  //   //   diff = abs(diff_a -diff_b);
    
  //   // print_out("LIMA LIMB",lim_a, lim_b);
  //   // print_out("DIFA DIFB",diff_a, diff_b, diff);
  //   // boolean test = (angle -PI) < (diff / 2);
  //   // print_out("angle -PI :::  diff / 2 ::: test", angle -PI, diff / 2, test);
  //   if(upper_is) {
  //     // if(all(clockwise,!test)) 
  //     //   return lim_a;
  //     // float diff_lim = abs(lim_a - lim_b) / 2 ;
  //     // float diff_tau = abs(TAU - angle);
  //     // if(diff_tau < diff_lim )
  //     //   return lim_a;
  //     return lim_b;
  //   } else {
  //     return lim_a;
  //   }
  // }

}