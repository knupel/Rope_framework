/**
LAYER METHOD
2018-2018
those gost method is here like a filter between rope and Processing 
in case the coder want use a PGraphics layer before to implement in the Processing rendering
*/
/**
Layer method
*/
PGraphics l;
void init_layer(int x, int y, String type) {
  l = createGraphics(x,y,type);
}

void begin_layer() {
  if(l != null) {
    l.beginDraw();
  }
}

void end_layer() {
  if(l != null) {
    l.endDraw();
  }
}

PGraphics get_layer() {
  return l;
}


// position
void translate(int x, int y) {
  if(l != null) {
    l.translate(x,y);
  } else {
    p.translate(x,y);
  }
}


// bug method
void rotate(float arg) {
  if(l != null) {
    l.rotate(arg);
  } else {
    p.rotate(arg);
  }
}


void rotateX(float arg) {
  if(l != null) {
    l.rotateX(arg);
  } else {
    p.rotateX(arg);
  }
}

void rotateY(float arg) {
  if(l != null) {
    l.rotateY(arg);
  } else {
    p.rotateY(arg);
  }
}




/**
aspect
*/
// fill
void noFill() {
  if(l != null) {
    l.noFill();
  } else {
    p.noFill();
  }
} 

void fill(int rgb) {
  if(l != null) {
    l.fill(rgb);
  } else {
    p.fill(rgb);
  }
}


void fill(int rgb, float alpha) {
  if(l != null) {
    l.fill(rgb,alpha);
  } else {
    p.fill(rgb,alpha);
  }
}

void fill(float gray) {
  if(l != null) {
    l.fill(gray);
  } else {
    p.fill(gray);
  }
}


void fill(float gray, float alpha) {
  if(l != null) {
    l.fill(gray,alpha);
  } else {
    p.fill(gray,alpha);
  }
}

void fill(float v1, float v2, float v3) {
  if(l != null) {
    l.fill(v1,v2,v3);
  } else {
    p.fill(v1,v2,v3);
  }
}

void fill(float v1, float v2, float v3, float alpha) {
  if(l != null) {
    l.fill(v1,v2,v3,alpha);
  } else {
    p.fill(v1,v2,v3,alpha);
  }
}

// stroke
void noStroke() {
  if(l != null) {
    l.noStroke();
  } else {
    p.noStroke();
  }
} 

void stroke(int rgb) {
  if(l != null) {
    l.stroke(rgb);
  } else {
    p.stroke(rgb);
  }
}


void stroke(int rgb, float alpha) {
  if(l != null) {
    l.stroke(rgb,alpha);
  } else {
    p.stroke(rgb,alpha);
  }
}

void stroke(float gray) {
  if(l != null) {
    l.stroke(gray);
  } else {
    p.stroke(gray);
  }
}


void stroke(float gray, float alpha) {
  if(l != null) {
    l.stroke(gray,alpha);
  } else {
    p.stroke(gray,alpha);
  }
}

void stroke(float v1, float v2, float v3) {
  if(l != null) {
    l.stroke(v1,v2,v3);
  } else {
    p.stroke(v1,v2,v3);
  }
}

void stroke(float v1, float v2, float v3, float alpha) {
  if(l != null) {
    l.stroke(v1,v2,v3,alpha);
  } else {
    p.stroke(v1,v2,v3,alpha);
  }
}


// strokeWeight
void strokeWeight(float thickness) {
  if(l != null) {
    l.strokeWeight(thickness);
  } else {
    p.strokeWeight(thickness);
  }
}

// strokeJoin
void strokeJoin(int join) {
  if(l != null) {
    l.strokeJoin(join);
  } else {
    p.strokeJoin(join);
  }
}

// strokeJoin
void strokeCapstrokeCap(int cap) {
  if(l != null) {
    l.strokeCap(cap);
  } else {
    p.strokeCap(cap);
  }
}












/**
shape
*/
// rect
void rect(int px, int py, int sx, int sy) {
  if(l != null) {
    l.rect(px,py,sx,sy);
  } else {
    p.rect(px,py,sx,sy);
  }
}


void rect(int px, int py, int sx, int sy, float r) {
  if(l != null) {
    l.rect(px,py,sx,sy,r);
  } else {
    p.rect(px,py,sx,sy,r);
  }
}

void rect(int px, int py, int sx, int sy, float tl, float tr, float br, float bl) {
  if(l != null) {
    l.rect(px,py,sx,sy,tl,tr,br,bl);
  } else {
    p.rect(px,py,sx,sy,tl,tr,br,bl);
  }
}


//arc
void arc(float a, float b, float c, float d, float start, float stop) {
  if(l != null) {
    l.arc(a,b,c,d,start,stop);
  } else {
    p.arc(a,b,c,d,start,stop);
  }
}

void arc(float a, float b, float c, float d, float start, float stop, int mode) {
  if(l != null) {
    l.arc(a,b,c,d,start,stop,mode);
  } else {
    p.arc(a,b,c,d,start,stop,mode);
  }
}

// ellipse
void ellipse(int px, int py, int sx, int sy) {
  if(l != null) {
    l.ellipse(px,py,sx,sy);
  } else {
    p.ellipse(px,py,sx,sy);
  }
}

// box
void box(int s) {
  if(l != null) {
    l.box(s,s,s);
  } else {
    p.box(s,s,s);
  }
}

void box(int w, int h, int d) {
  if(l != null) {
    l.box(w,h,d);
  } else {
    p.box(w,h,d);
  }
}


//line
void line(float x1, float y1, float x2, float y2) {
  if(l != null) {
    l.line(x1,y1,x2,y2);
  } else {
    p.line(x1,y1,x2,y2);
  }
}

void line(float x1, float y1, float z1, float x2, float y2, float z2) {
  if(l != null) {
    l.line(x1,y1,z1,x2,y2,z2);
  } else {
    p.line(x1,y1,z1,x2,y2,z2);
  }
}

// point
void point(float x, float y) {
  if(l != null) {
    l.point(x,y);
  } else {
    p.point(x,y);
  }
}

void point(float x, float y, float z) {
  if(l != null) {
    l.point(x,y,z);
  } else {
    p.point(x,y,z);
  }
}

// quad
void quad(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  if(l != null) {
    l.quad(x1,y1,x2,y2,x3,y3,x4,y4);
  } else {
    p.quad(x1,y1,x2,y2,x3,y3,x4,y4);
  }
}

// triangle
/*
method already use somewhere else
void triangle(float x1, float y1, float x2, float y2, float x3, float y3) {
  if(l != null) {
    l.triangle(x1,y1,x2,y2,x3,y3);
  } else {
    p.triangle(x1,y1,x2,y2,x3,y3);
  }
}
*/



 





