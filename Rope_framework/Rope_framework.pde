/**
* Rope Framework
* v 1.0.1
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.6.2.22
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/
import java.util.Collections;

ArrayList <Number> prime_number_list = new ArrayList <Number>();
ArrayList <Number> sin_prime_number_list = new ArrayList <Number>();

ArrayList <Number> rand_list = new ArrayList <Number>();
ArrayList <Number> sin_rand_list = new ArrayList <Number>();


// int w = 10;
// int h = 10;
int w = 1000;
int h = 1000;
int surface_window = w*h;
void setup() {
  size(125,125); 
  int count = 0;

  for(int n = 0 ; n < surface_window ; n++) {
    if(is_prime(n)) {
      add_number_to_list(n,prime_number_list);
      add_number_to_list(int(abs(sin(n))*surface_window),sin_prime_number_list);

      int r = (int)random(w*h);
      add_number_to_list(r,rand_list);
      add_number_to_list(int(abs(sin(r))*surface_window),sin_rand_list);
    }
  }

  manage_number_list(prime_number_list);
  manage_number_list(sin_prime_number_list);
  manage_number_list(rand_list);
  manage_number_list(sin_rand_list);

  // println("prime number");
  // for(Number num : prime_number_list) {
  //   println(num.n);
  // }

  println("prime number sin");
  for(Number num : sin_prime_number_list) {
    println(num.n);
  }

  // println("random number");
  // for(Number num : rand_list) {
  //   println(num.n);
  // }

  // println("random number sin");
  // for(Number num : sin_rand_list) {
  //   println(num.n);
  // }
}

void add_number_to_list(int n, ArrayList<Number> list) {
  Number pn = new Number(n);
  list.add(pn);
  if(list.size() > 1) {
    Number previous_number = list.get(list.size()-2);
    Number current_number = list.get(list.size()-1);
    int dif = current_number.get_number() -previous_number.get_number();
    for(int i = 0 ; i < 11 ; i += 2) {
      if(dif == i) {
        current_number.type(i);
        previous_number.type(i);
        break;

      }
    }
  }
}


void manage_number_list(ArrayList<Number> list) {
  Collections.sort(list);
  if(list.size() > 1) {
    for(int i = 1 ; i < list.size() ; i++) {
      Number previous_number = list.get(i-1);
      Number current_number = list.get(i);
      int dif = current_number.get_number() -previous_number.get_number();
      for(int k = 0 ; k < 11 ; k++) {
        if(dif == k) {
          current_number.type(k);
          previous_number.type(k);
          break;
        }
      }
    }
  } 
}



int PRIME_NUMBER = 0;
int mode = 0;
int mode_max = 3;
  int which_type_display;
int show_type = -2;
int max_type = 6;
void draw() {
  background(0);
  String title = ("m: "+mode+" | s: "+width+"x"+height);
  surface.setTitle(title);
  
  // EXCEPTION MODE


  show(which_type_display);
}

void manage_type() {
  if(show_type > max_type) {
    show_type = -2;
  } else if(show_type < -2) {
    show_type = max_type;
  }

  which_type_display = show_type;
  if(mode == PRIME_NUMBER) {
    if(show_type == 0) {
      which_type_display = -1;
    } else if(show_type == 1) {
      which_type_display = 2;
    } else if(show_type == 3) {
      which_type_display = 4;
    } else if(show_type == 5) {
      which_type_display = 6;
    } else if(show_type == 7) {
      which_type_display = 8;
    } else if(show_type == 9) {
      which_type_display = 10;
    }
  }
}




void show(int which_type) {
  g.loadPixels();
  for(int i = 0 ; i < prime_number_list.size() ; i++) {
    int target = 0;
    int type = -1;
    if(mode == 0) {
      target = prime_number_list.get(i).get_number();
      type = prime_number_list.get(i).get_type();
    } else if(mode == 1) {
      target = sin_prime_number_list.get(i).get_number();
      type = sin_prime_number_list.get(i).get_type();
    } else if(mode == 2) {
      target = rand_list.get(i).get_number();
      type = rand_list.get(i).get_type();
    } else if(mode == 3) {
      target = sin_rand_list.get(i).get_number();
      type = sin_rand_list.get(i).get_type();
    }

    if(target < g.pixels.length) {
      if(type == -1 && which_type == -1) {
        g.pixels[target] = r.WHITE;
      } else if (type == 0 && which_type == 0) {
        g.pixels[target] = r.CYAN;
      } else if (type == 1 && which_type == 1) {
        g.pixels[target] = r.BLOOD;
      } else if (type == 2 && which_type == 2) {
        g.pixels[target] = r.ORANGE;
      } else if (type == 3 && which_type == 3) {
        g.pixels[target] = r.YELLOW;
      } else if (type == 4 && which_type == 4) {
        g.pixels[target] = r.GREEN;
      } else if (type == 5 && which_type == 5) {
        g.pixels[target] = r.PINK;
      } else if (type == 6 && which_type == 6) {
        g.pixels[target] = r.PURPLE;
      } else if (which_type == -2) {
        // display all
        g.pixels[target] = r.WHITE;
      }
      
    }
  }
  g.updatePixels();

}







void keyPressed() {
  if(key == 'm') {
    mode++;
    if(mode > mode_max) mode = 0 ;
  }

  if(key == 'n') {
    surface.setSize((int)random(125,w),(int)random(125,h));
    println("window",width,height);
  }
  if (key == CODED) {
    // change height
    if(keyCode == RIGHT) {
      surface.setSize(width+1,height);
      println("window",width,height);
    }

    if(keyCode == LEFT) {
      surface.setSize(width-1,height);
      println("window",width,height);
    }
    
    // change display type
    if(keyCode == UP) {
      show_type--;
      manage_type();
      println("show type",which_type_display);
    }

    if(keyCode == DOWN) {
      show_type++;
      manage_type();
      println("show type",which_type_display);
    }

  }
}








class Number implements Comparable<Number> {
  int n;
  int rank;
  int type = -1;
  Number(int n) {
    this.n = n;
  }

  @Override
  int compareTo(Number other) {
    return this.n - other.n;
  }

  void rank(int rank) {
    this.rank = rank;
  }

  void type(int type) {
    this.type = type;
  }

  int get_number() {
    return n;
  }

  int get_rank() {
    return rank;
  }

  int get_type() {
    return type;
  }
}

