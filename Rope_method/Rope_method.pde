/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

void setup() {
	image(pattern_noise(width,height,.1,.3,.4,.5,.7),0,0);

}


void draw() {
	// println(get_scroll());
}





PGraphics pattern_noise(int w, int h, float... inc) {
	PGraphics pg ;
	if(w > 0 && h > 0 && inc.length > 0 && inc.length < 5) {
		pg = createGraphics(w,h);
	  float offset_x [] = new float[inc.length];
	  float offset_y [] = new float[inc.length];
	  float component [] = new float[inc.length];
	  float max [] = new float[inc.length];
	  if(inc.length == 1) {
	  	max[0] = g.colorModeZ;
	  } else if (inc.length == 2) {
	  	max[0] = g.colorModeZ;
	  	max[1] = g.colorModeA;
	  } else if (inc.length == 3) {
	  	max[0] = g.colorModeX;
	  	max[1] = g.colorModeY;
	  	max[2] = g.colorModeZ;
	  } else if (inc.length == 4) {
	  	max[0] = g.colorModeX;
	  	max[1] = g.colorModeY;
	  	max[2] = g.colorModeZ;
	  	max[3] = g.colorModeA;
	  }

	  
	  pg.beginDraw();
	  for(int i = 0 ; i < inc.length ; i++) {
	  	offset_y [i] = 0;
	  }
	  for(int x = 0 ; x < w ; x++) {
	    for(int i = 0 ; i < inc.length ; i++) {
	    	offset_x [i] = 0;
	    }
	    for(int y = 0 ; y < h ; y++) {
	    	for(int i = 0 ; i < inc.length ; i++) {
	    		component[i] = map(noise(offset_x[i],offset_y[i]),0,1,0,max [i]);
	    	}
	    	int c = 0;
	    	if(inc.length == 1) c = color(component[0]);
	    	else if (inc.length == 2) c = color(component[0],component[1]);
	    	else if (inc.length == 3) c = color(component[0],component[1],component[2]);
	    	else if (inc.length == 4) c = color(component[0],component[1],component[2],component[3]);

	      pg.set(x,y,c);
	      for(int i = 0 ; i < inc.length ; i++) {
	      	offset_x[i] += inc[i];
	      }
	    }
	    for(int i = 0 ; i < inc.length ; i++) {
	    	offset_y[i] += inc[i];
	    }
	  }
	  pg.endDraw();
	    return pg;
	} else {
		printErr("method pattern_noise(): may be problem with size:",w,h,"\nor with component color num",inc.length,"must be between 1 and 4");
		return null;
	}
}







