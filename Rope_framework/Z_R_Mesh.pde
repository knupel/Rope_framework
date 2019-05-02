/**
* R_Mesh
* temp tab before pass to Rope
* v 0.0.1
* 2019-2019
*/

/**
* R_Node
* v 0.1.0
* 2019-2019
*/
public class R_Node {
	private vec3 pos;
	private ArrayList<vec3> dest_list;
	private int branch = 4;
	private int id;

	public R_Node(vec pos, vec from) {
		this.id = (int)random(MAX_INT);
		this.pos = vec3(pos);
		dest_list = new ArrayList<vec3>();
		dest_list.add(vec3(from));
	}


	public boolean add_destination(vec dst) {
		if(dest_list.size() < branch && !all(equal(get_pos(),vec3(dst)))) {
			boolean equal_is = false;
			vec3 [] list = get_destination();
			for(int i = 0 ; i < list.length ; i++) {
				if(all(equal(list[i],vec3(dst)))) {
					equal_is = true;
				}
			}
			if(!equal_is) {
				dest_list.add(vec3(dst));
			}
			return !equal_is;
		} else {
			return false;
		}
	}
  
  // set
  public void set_destination(vec3 pos) {
		if(dest_list.size() < branch) {
			dest_list.add(pos);
		} 
	}

	public void set_id(int id) {
		this.id = id;
	}

	public void set_branch(int branch) {
		if(branch > 1 && branch > dest_list.size()) {
			this.branch = branch;
		} 
	}

  
  // get
	public int get_id() {
		return id;
	}

	public int get_branch() {
		return branch;
	}

	public int get_branch_available() {
		return branch - dest_list.size();
	}

	public vec3 [] get_destination() {
		return dest_list.toArray(new vec3[dest_list.size()]);
	}

	public vec3 get_pos() {
		return pos;
	}
}










/**
* SEGMENT
* v 0.1.0
* 2019-2019
*/
public class R_Segment {
	private vec3 start;
	private vec3 end;
	private int capacity;
	private boolean direction;
	private float angle;
	private float length;
	public R_Segment(vec start, vec end) {
		this.start = vec3(start.x,start.y,start.z);
		this.end = vec3(end.x,end.y,end.z);
		this.angle = angle(vec2(this.start),vec2(this.end));
		this.length = dist(this.start,this.end);
		// println("class Segment: new Segment build");
	}

	public vec3 get_start() {
		return start;
	}

	public vec3 get_end() {
		return end;
	}

	public float get_angle() {
		return angle;
	}

	public float get_length() {
		return length;
	}

	public void set_capacity(int capacity) {
		this.capacity = capacity;
	}

	public void set_direction(boolean direction) {
		this.direction = direction;
	}



	private vec2 line_intersection(R_Segment one, R_Segment two) {
    float x1 = one.get_start().x;
    float y1 = one.get_start().y;
    float x2 = one.get_end().x;
    float y2 = one.get_end().y;
    
    float x3 = two.get_start().x;
    float y3 = two.get_start().y;
    float x4 = two.get_end().x;
    float y4 = two.get_end().y;
    
    float bx = x2 - x1;
    float by = y2 - y1;
    float dx = x4 - x3;
    float dy = y4 - y3;
   
    float b_dot_d_perp = bx * dy - by * dx;
   
    if(b_dot_d_perp == 0) {
    	return null;
    }
   
    float cx = x3 - x1;
    float cy = y3 - y1;
   
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t < 0 || t > 1) return null;
   
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u < 0 || u > 1) return null;
   
    return vec2(x1+t*bx, y1+t*by);
  }
  
  public vec2 meet_at(R_Segment target) {
    return line_intersection(this,target);
  }

  public boolean meet_is(R_Segment target) {
  	if(meet_at(target) == null) {
  		return false;
  	} else {
  		return true;
  	}
  }
}