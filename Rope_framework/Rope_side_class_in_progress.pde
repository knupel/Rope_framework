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
    vec3 buf = new vec3(ax%TAU, ay%TAU, 0);
    boolean print_is = true;

    if(print_is) print_out("-------------------------------------");
    float sign_lx = sign(buf.x());
    float sign_ly = sign(buf.y());
    float lx = 0;
    float ly = 0;
    // check to trigonometry from 0 to 2PI (TAU)
    if(sign_lx == -1) lx = buf.x() + TAU; else lx = buf.x();
    if(sign_ly == -1) ly = buf.y() + TAU; else ly = buf.y();
    if(print_is) print_out("lx", lx);
    if(print_is) print_out("ly", ly);
    if(lx < ly) clockwise = true; else clockwise = false;
    if(print_is) print_out("clockwise", clockwise);

    
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
    // if(y == -PI) y = PI;
    // check to back to classic trigonometry
    if(sign.y() == -1) y -= TAU;
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
    boolean upper_is = ang_a > ang_b;
    boolean a_zero = ang_a == 0;
    boolean b_zero = ang_b == 0;

    if(upper_is) {
      if(a_zero) {
        ang_a = TAU;
        arc(buf_pos, this.size, ang_a, ang_b, PIE);
      } else if(b_zero) {
        ang_b = TAU;
        arc(buf_pos, this.size, ang_b, ang_a, PIE);
      } else {
        arc(buf_pos, this.size, ang_b, ang_a, PIE);
      }
    } else {
      if(a_zero) {
        arc(buf_pos, this.size, ang_b, ang_a, PIE);
      } else {
        arc(buf_pos, this.size, ang_a, ang_b, PIE);
      }
    }
    return true;
  }

  private boolean show_struc_pie_counter_clockwise(vec2 buf_pos, int a, int b) {
    float ang_a = this.molette[a].angle();
    float ang_b = this.molette[b].angle();
    boolean [] beyond_list = beyond_limit(limit.a());
    boolean beyond = only(beyond_list);

    if(beyond) {
      if(beyond_list[a]) {
        arc(buf_pos,size, ang_a - TAU, ang_b, PIE);
        return true;
      }
      if(beyond_list[b]) {
        arc(buf_pos,size, ang_b - TAU, ang_a, PIE);
        return true;
      }
    } 
    if(ang_a > ang_b) {
      arc(buf_pos, this.size, ang_b, ang_a, PIE);
      return true;
    }
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
        float buf_angle = calc_angle(i, this.molette[i].angle());
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
      beyond_limit_is[i] = molette[i].angle() > limit;
    }
    return beyond_limit_is;
  }


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

    } else if(drag_direction == VERTICAL) {
      angle = cursor.y() * drag_force;
    }
    return angle;
  }


  private float constrain_angle(float angle) {
    return constrain_angle_impl(angle, this.limit.a(), this.limit.b(), clockwise);
  }
  
  private float constrain_angle_impl(float angle, float limit_x, float limit_y, boolean clockwise) {
    float temp_ang = angle%TAU;
    float sign_lx = sign(limit_x);
    float sign_ly = sign(limit_y);
    float sign_ang = sign(temp_ang);
    float lx = 0;
    float ly = 0;
    float ang = 0;

    // check to trigonometry from 0 to 2PI (TAU) easier to read the value
    if(sign_lx == -1) lx = limit_x + TAU; else lx = limit_x;
    if(sign_ly == -1) ly = limit_y + TAU; else ly = limit_y;
    if(sign_ang == -1) ang = temp_ang + TAU; else ang = temp_ang;

    boolean print_is = true;
    if(print_is) print_out("\nconstrain_angle_impl");
    // if(print_is) print_out("lx TAU", lx);
    // if(print_is) print_out("ly TAU", ly);
    // if(print_is) print_out("ang TAU", ang);

    if(clockwise) {
      if(ang < lx) return limit_x;
      if(ang > ly) return limit_y;
    } else {
      if(ang > lx) {
        if(print_is) print_out(ang, ">", lx, "return", limit_x);
        return limit_x;
      }
      if(ang < ly) {
        if(print_is) print_out(ang, "<", ly, "return", limit_y);
        return limit_y;
      }
    }

    return angle;
  }



}