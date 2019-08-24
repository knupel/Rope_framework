 
*PGraphics Method

All graphics method can be use on g or with an other PGrahics, just add the name of the PGraphics target to the end of method.
You can also allowed a PGraphics with method the layering method see Image chapter part LAYER, in this case the current PGraphics is detected automatcly.




/**
* beginDraw and enDraw() is write here just to keep a syntax cohesion withe PGraphics other system
*/

*set

void set(int x, int y, int c, PGraphics other);

void set(vec2 pos, int c, PGraphics other);

void set(vec2 pos, int c);

void set(ivec2 pos, int c, PGraphics other);

void set(ivec2 pos, int c);

*colorMode

public void colorMode(int mode,PGraphics other);

public void colorMode(int mode, float max, PGraphics other);

public void colorMode(int mode, float max1, float max2, float max3, PGraphics other);

public void colorMode(int mode, float max1, float max2, float max3, float maxA, PGraphics other);






*draw

void beginDraw(PGraphics other);

void endDraw(PGraphics other);

void clear(PGraphics other);




*background

void background(int rgb, PGraphics other);

void background(int rgb, float alpha, PGraphics other);

void background(float gray, PGraphics other);

void background(float gray, float alpha, PGraphics other);

void background(float v1, float v2, float v3, PGraphics other);

void background(float v1, float v2, float v3, float alpha, PGraphics other);

void background(PImage img, PGraphics other);




*Ellipse

void ellipse(float px, float py, float sx, float sy, PGraphics other);

void ellipse(vec p, float x, float y);

void ellipse(vec p, float x, float y, PGraphics other);

void ellipse(vec p, float x);

void ellipse(vec p, float x, PGraphics other);


/**
main method
*/

void ellipse(vec p, vec s);

void ellipse(vec p, vec s, PGraphics other);







/**
Rect
*/

void rect(float px, float py, float sx, float sy, PGraphics other);

void rect(vec p, vec s);

void rect(vec p, vec s, PGraphics other);


/**
* triangle
* v 0.2.0
*/
void triangle(float x1, float y1, float x2, float y2, float x3, float y3, PGraphics other) ;
 
void triangle(vec a, vec b, vec c);

void triangle(vec a, vec b, vec c, PGraphics other);




/**
* Box
* v 0.2.0
*/
void box(float size, PGraphics other);

void box(float x, float y, float z, PGraphics other);
 
void box(vec3 p);

void box(vec3 p, PGraphics other);




/**
* sphere
*/

void sphere(float radius, PGraphics other);

void sphereDetail(int res, PGraphics other);

void sphereDetail(int ures, int vres, PGraphics other);



/**
* point
* v 0.2.0
*/
void point(float x, float y, float z, PGraphics other);

void point(float x, float y, PGraphics other);

void point(vec p);

void point(vec p, PGraphics other);





/**
Line
*/
void line(float x1, float y1, float x2, float y2, PGraphics other);

void line(float x1, float y1, float z1, float x2, float y2, float z2, PGraphics other);

void line(vec a, vec b);

void line(vec a, vec b, PGraphics other);




/**
* shape
* v 0.2.0
*/
void beginShape(PGraphics other);

void beginShape(int kind, PGraphics other);

void endShape(PGraphics other);

void endShape(int mode, PGraphics other);


/**
* vertex
* v 0.2.0
*/
void vertex(float x, float y, PGraphics other);

void vertex(float x, float y, float z, PGraphics other);

void vertex(float [] v, PGraphics other);

void vertex(float x, float y, float u, float v, PGraphics other);

void vertex(float x, float y, float z, float u, float v, PGraphics other);

void vertex(vec coord);

void vertex(vec coord, PGraphics other);

void vertex(vec2 coord, vec2 uv);

void vertex(vec2 coord, vec2 uv, PGraphics other);

void vertex(vec3 coord, vec2 uv);

void vertex(vec3 coord, vec2 uv, PGraphics other);




/**
* Bezier Vertex
* v 0.2.0
*/
void bezierVertex(float x2, float y2, float x3, float y3,  float x4, float y4, PGraphics other);

void bezierVertex(float x2, float y2, float z2, float x3, float y3, float z3, float x4, float y4, float z4, PGraphics other);


void bezierVertex(vec a, vec b, vec c);

void bezierVertex(vec a, vec b, vec c, PGraphics other);






/**
Quadratic Vertex
*/
void quadraticVertex(float cx, float cy, float x3, float y3, PGraphics other);

void quadraticVertex(float cx, float cy, float cz, float x3, float y3, float z3, PGraphics other);

void quadraticVertex(vec a, vec b);

void quadraticVertex(vec a, vec b, PGraphics other);





/**
Curve Vertex
*/
void curveVertex(float x, float y, float z, PGraphics other);

void curveVertex(float x, float y, PGraphics other);

void curveVertex(vec a);

void curveVertex(vec a, PGraphics other);






/**
* strokeWeight
*/
void strokeWeight(float v, PGraphics other);

void noFill(PGraphics other);

void noStroke(PGraphics other);



/**
* Fill
* v 0.2.0
*/
void fill(int rgb, PGraphics other);

void fill(int rgb, float alpha, PGraphics other);

void fill(float gray, PGraphics other);

void fill(float gray, float alpha, PGraphics other);

void fill(float v1, float v2, float v3, PGraphics other);

void fill(float v1, float v2, float v3, float alpha, PGraphics other);


// vec
void fill(vec2 c);

void fill(vec2 c, PGraphics other);

//
void fill(vec3 c);

void fill(vec3 c, PGraphics other);

//
void fill(vec3 c, float a);

void fill(vec3 c, float a, PGraphics other);

//
void fill(vec4 c);

void fill(vec4 c, PGraphics other);





/**
Stroke
*/
void stroke(int rgb, PGraphics other);

void stroke(int rgb, float alpha, PGraphics other);

void stroke(float gray, PGraphics other);

void stroke(float gray, float alpha, PGraphics other);

void stroke(float v1, float v2, float v3, PGraphics other);

void stroke(float v1, float v2, float v3, float alpha, PGraphics other);


// vec
void stroke(vec2 c);

void stroke(vec2 c, PGraphics other);

//
void stroke(vec3 c);

void stroke(vec3 c, PGraphics other);

//
void stroke(vec3 c, float a);

//
void stroke(vec4 c);

void stroke(vec4 c, PGraphics other);




/**
text
v 0.2.0
*/
void text(String s, float x, float y, PGraphics other);

void text(char c, float x, float y, PGraphics other);

void text(int i, float x, float y, PGraphics other);

void text(float f, float x, float y, PGraphics other);

void text(String s, float x, float y, float z, PGraphics other);

void text(char c, float x, float y, float z, PGraphics other);

void text(int i, float x, float y, float z, PGraphics other);

void text(float f, float x, float y, float z, PGraphics other);



void text(String s, vec pos);

void text(String s, vec pos, PGraphics other);

void text(char c, vec pos);

void text(char c, vec pos, PGraphics other);


void text(int i, vec pos);

void text(int i, vec pos, PGraphics other);

void text(float f, vec pos);

void text(float f, vec pos, PGraphics other);













/**
* Translate
* v 0.2.0
*/
void translate(float x, float y, float z, PGraphics other);

void translate(float x, float y, PGraphics other);


// vec
void translate(vec v);

void translate(vec v, PGraphics other);


// ivec
void translate(ivec3 v);

void translate(ivec3 v, PGraphics other);



// translate X
void translateX(float f);

void translateX(float f, PGraphics other);

// translate Y
void translateY(float f);

void translateY(float f, PGraphics other);

// translate Z
void translateZ(float f);

void translateZ(float f, PGraphics other);


/**
Rotate
*/
void rotate(float f, PGraphics other);


void rotateX(float f, PGraphics other);


void rotateY(float f, PGraphics other);

void rotateZ(float f, PGraphics other);


// vec
void rotateXY(vec2 rot);

void rotateXY(vec2 rot, PGraphics other);


void rotateXZ(vec2 rot);

void rotateXZ(vec2 rot, PGraphics other);

void rotateYZ(vec2 rot);

void rotateYZ(vec2 rot, PGraphics other);

void rotateXYZ(vec3 rot);

void rotateXYZ(vec3 rot, PGraphics other);








/**
Matrix
v 0.2.0
*/
// vec

void push_3D(vec pos, vec3 dir_cart);

void push_3D(vec pos, vec2 dir_polar);

void push_2D(vec pos, float orientation);







// push and pop
void push(PGraphics other);

void pop(PGraphics other);




