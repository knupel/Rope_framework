/**
*
* Place tobe to add you massive classe and test it :)
* 
*/
import rope.gui.Crope;
import rope.tool.R_Rank;
import rope.gui.button.R_Button;
import rope.gui.slider.R_Slider;

public class R_Board extends Crope {
  private ArrayList<Crope> list;
  private R_Rank [] rank = new R_Rank[1];
  private boolean vert_is;
  

  public R_Board (vec2 pos, vec2 size, boolean vert_is) {
    super("Board", pos, size);
    list = new ArrayList<Crope>();
    rank[0] = new R_Rank();
    rank[0].set(0);
    this.vert_is = vert_is;
  }

  private vec2 rank_pos(vec2 size_elem, float step) {
    vec2 buf = this.pos.copy();
    if(!vert_is) {
      buf.x((size_elem.x() * step) + rank[0].get());
      rank[0].add(buf.x());
    } else {
      buf.y((size_elem.y() * step) + rank[0].get());
      rank[0].add(buf.y());
    }
    return buf;
  }

  public void add_button(vec2 size_elem, float step, String... label) {
    for(int i = 0 ; i < label.length ; i++) {
      R_Button b = new R_Button(rank_pos(size_elem, step), size_elem);
      b.set_label(label[i]);
      b.set_colour_in_on(r.GREEN);
	    b.set_colour_out_on(r.SAPIN);
	    b.set_colour_in_off(r.RED);
	    b.set_colour_out_off(r.BLOOD);
      list.add(b);
    }
  }

  public void add_slider(vec2 size_elem, float step, String... label) {
    for(int i = 0 ; i < label.length ; i++) {
      R_Slider s = new R_Slider(rank_pos(size_elem, step), size_elem);
      s.set_label(label[i]);
      list.add(s);
    }
  }


  public void update() {
    for(Crope c : list) {
      c.update();
      if(c instanceof R_Button) {
        ((R_Button)c).rollover(true);
      }
    }
  }

  public void show_structure() {
    for(Crope c : list) {
      c.show_structure();
    }
  }

  public void show_molette() {
    for(Crope c : list) {
      if(c instanceof R_Slider) {
        ((R_Slider)c).show_molette();
      }
    }
  }

  public void show_label() {
    for(Crope c : list) {
      c.show_label();
    }
  }

   public void show_value() {
    for(Crope c : list) {
      c.show_value();
    }
  }


} 