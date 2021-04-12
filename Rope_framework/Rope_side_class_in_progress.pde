/**
*
* Place tobe to add you massive classe and test it :)
* 
*/
import rope.gui.Crope;
import rope.tool.R_Rank;
import rope.gui.button.R_Button;

public class R_Board extends Crope {
  ArrayList<Crope> list;
  R_Rank [] rank = new R_Rank[1];
  

  public R_Board (vec2 pos, vec2 size, boolean vert_is) {
    super("Board", pos, size);
    list = new ArrayList<Crope>();
    rank[0] = new R_Rank();
    rank[0].set(1);
  }

  public void add_button(vec2 size, float step, String... label) {
    //vec2 pos_buf = pos.copy();
    for(int i = 0 ; i < label.length ; i++) {
      // need to change the pos
      vec2 buf = this.pos.copy();
      // check for vert after if(!vert_is)
      buf.add_x(size.x() * rank[0].get());
      R_Button b = new R_Button(buf, size);
      rank[0].add(step);
      b.set_label(label[i]);
      b.set_colour_in_on(r.GREEN);
	    b.set_colour_out_on(r.SAPIN);
	    b.set_colour_in_off(r.RED);
	    b.set_colour_out_off(r.BLOOD);
      list.add(b);
    }
  }

  public void update() {
    for(Crope c : list) {
      c.update();
      if(c instanceof R_Button) {
        R_Button b = (R_Button)c;
        b.rollover(true);
      }
    }

  }

  public void show_structure() {
    for(Crope c : list) {
      c.show_structure();
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