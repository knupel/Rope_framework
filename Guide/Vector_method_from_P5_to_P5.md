Method from Processing who used Vector class
Very helpful sometime !
--
you can use the few Procesing method with Vec2 and Vec3
method that you can use
the thing good with the Vec3, you can use the the "z" position !!!!
--

colorMode
--
void colorMode(Vec5 component);
>the first compoent is used for the colorMode environment, the others for x,y,z,a compoent RGB_A or HSB_A

void colorMode(int mode, Vec4 component);
> component x,y,z,a is use for RGB_A or HSB_A

void colorMode(int mode, Vec3 component);
> component x,y,z is use for RGB or HSB

void colorMode(int mode, Vec2 component);
>int compoent.x is used for RGB or HSB and component.y is use for ALPHA

floor
--
iVec2 floor(Vec2 arg);

iVec3 floor(Vec3 arg);

iVec4 floor(Vec4 arg);

round
--
iVec2 round(Vec2 arg);

iVec3 round(Vec3 arg);

iVec4 round(Vec4 arg);


ceil
--
iVec2 ceil(Vec2 arg);

iVec3 ceil(Vec3 arg);

iVec4 ceil(Vec4 arg);



set
--
void set(iVec2 pos, int c);

void set(Vec2 pos, int c);


random
--
float random (Vec2 v);

float random (iVec2 v);

--
TEXT
processing improve
--
text(String s, Vec pos);

text(char c, Vec pos);

text(int num, Vec pos);

text(float num, Vec pos);

text(String s, iVec pos);

text(char c, iVec pos);

text(int num, iVec pos);

text(float num, iVec pos);

--
IMAGE 
processing improve
--
void image(Pimage img, iVec pos) ;

void image(Pimage img, iVec pos, iVec2 size) ;

void image(Pimage img, Vec pos) ;

void image(Pimage img, Vec pos, Vec2 size) ;

--
GEOMETRY
processing improve
--
If for any reason a Vec3 or iVec3 for the position is use and Processing have P3D rendering the component `Z` give the third dimension position

ellipse(iVec pos, iVec size);

ellipse(iVec pos, int size_x);

ellipse(iVec pos, int size_x, int size_y);

ellipse(iVec pos, float size_x);

ellipse(iVec pos, float size_x, float size_y);

ellipse(Vec pos, Vec size);


rect(Vec pos, Vec size);

rect(iVec pos, iVec size);


box(Vec p);

box(iVec p);


line(Vec a, Vec b);

line(iVec a, iVec b);


point(Vec p);

point(iVec p);


vertex(Vec p);

vertex(iVec p);

bezierVertex(Vec a, Vec b, Vec c);

bezierVertex(iVec a, iVec b, iVec c);

curveVertex(Vec a);

curveVertex(iVec a);

quadraticVertex(Vec a, Vec b);

quadraticVertex(iVec a, iVec b);






--
BACKGROUND
processing improve
--
background(Vec2 c) ; 
>'x' color value and 'y' is alpha value

background(Vec3 c) ;
>x,y,z color value

>background(Vec4 c) 
x,y,z color value and alpha value

background(iVec2 c) ; 
>'x' color value and 'y' is alpha value

background(iVec3 c) ;
>x,y,z color value

>background(iVec4 c) 
x,y,z color value and alpha value


--
ASPECT
processing improve
--
fill (Vec2 grey_alpha) ;

fill (Vec3 colour) ;

fill (Vec3 colour, float alpha) ;

fill (Vec4 colour_alpha) ;

stroke (Vec2 grey_alpha) ;

stroke (Vec3 colour) ;

stroke (Vec3 colour, float alpha) ;

stroke (Vec4 colour_alpha) ;

fill (iVec2 grey_alpha) ;

fill (iVec3 colour) ;

fill (iVec3 colour, float alpha) ;

fill (iVec4 colour_alpha) ;

stroke (iVec2 grey_alpha) ;

stroke (iVec3 colour) ;

stroke (iVec3 colour, float alpha) ;

stroke (iVec4 colour_alpha) ;


--
MATRIX
processing improve
--
translate
--
translate(Vec t) ;

translate(iVec t) ;

translateX(float t) ;

translateY(float t) ;

translateZ(float t) ;

rotate
--
rotateXY(Vec2 rot) ;

rotateXZ(Vec2 rot) ;

rotateYZ(Vec2 rot) ;

rotateXYZ(Vec3 rot) ;

rotateXY(iVec2 rot) ;

rotateXZ(iVec2 rot) ;

rotateYZ(iVec2 rot) ;

rotateXYZ(iVec3 rot) ;






New Matrix method
--
start_matrix() ;

stop_matrix() ;

start_matrix_2D(Vec2 pos, float orientation) ;
>use matrix 2D with cartesian coord

start_matrix_3D(Vec3 pos, Vec3 dir_cart) ;
>use matrix 3D with cartesian coord

start_matrix_3D(Vec3 pos, Vec2 dir_polar) ;
>use matrix 3D with polar coord

start_matrix_2D(iVec2 pos, float orientation) ;
>use matrix 2D with cartesian coord

start_matrix_3D(iVec3 pos, iVec3 dir_cart) ;
>use matrix 3D with cartesian coord

start_matrix_3D(iVec3 pos, iVec2 dir_polar) ;
>use matrix 3D with polar coord


DEPRECATED
Matrix_start & matrix_end is 
--
matrix_start() ;
matrix_end() ;

matrix_2D_start(Vec2 pos, float orientation);
>use matrix 2D with cartesian coord

matrix_3D_start(Vec3 pos, Vec3 dir_cart);
>use matrix 3D with cartesian coord

matrix_3D_start(Vec3 pos, Vec2 dir_polar);
>use matrix 3D with polar coord








































--
--
GLOBALE METHOD
--
--

Create Vec ext
--
@ return Vec2, Vec3, Vec4, Vec5
To create an random vector : 
use String "RANDOM"  for vector between negative value and positive one.
or "RANDOM_ZERO" ,for a value from zero to value
or "RANDOM_RANGE", for value between two others

Vec2 constructor
-- 
Vec2() ;

Vec2(float x, float y) ;

Vec2(float v) ;

Vec3(Vec2 v) ;

Vec3(String type_random, int x, int y, int z) ;

Vec3(String type_random, int v) ;

Vec4 constructor
-- 
Vec4() ;

Vec4(float x, float y, float z, float w) ;

Vec4(float v) ;

Vec4(Vec4 v) ;

Vec4(Vec3 v) ;

Vec4(Vec2 v) ;

Vec4(Vec2 v,Vec2 v) ;

Vec4(String type_random, int x, int y, int z, int w) ;

Vec4(String type_random, int v) ;

Vec5 constructor
-- 
Vec5() ;

Vec5(float a, float b, float c, float d, float e) ;

Vec5(float v) ;

Vec5(Vec5 v) ;

Vec5(Vec4 v) ;

Vec5(Vec3 v) ;

Vec5(Vec2 v) ;

Vec5(Vec2 v,Vec2 v) ;

Vec5(Vec3 v,Vec2 v) ;

Vec5(Vec2 v,Vec3 v) ;

Vec5(String type_random, int a, int b, int c, int d, int e) ;

Vec5(String type_random, int v) ;

Vec6 constructor
-- 
Vec6() ;

Vec6(float a, float b, float c, float d, float e, float f) ;

Vec6(float v) ;

Vec6(Vec6 v) ;

Vec6(Vec5 v) ;

Vec6(Vec4 v) ;

Vec6(Vec3 v) ;

Vec6(Vec2 v) ;

Vec6(Vec2 v,Vec2 v) ;

Vec6(Vec3 v,Vec2 v) ;

Vec6(Vec4 v,Vec2 v) ;

Vec6(Vec2 v,Vec3 v) ;

Vec6(Vec2 v,Vec4 v) ;

Vec6(Vec3 v,Vec3 v) ;

Vec6(Vec2 v,Vec2 v,Vec2 v) ;

Vec6(String type_random, int a, int b, int c, int d, int e, int f) ;

Vec6(String type_random, int v) ;




Addition
--
available for Vec2, Vec3 and Vec4
--
Vec add(Vec v1, Vec2 v2) ;

Vec add(Vec v1, float n) ;


Substraction
--
available for Vec2, Vec3 and Vec4
--
Vec sub(Vec v1, Vec2 v2) ;

Vec sub(Vec v1, float n) ;


Multiplication
--
available for Vec2, Vec3 and Vec4
--
Vec mult(Vec v1, Vec v2) ;

mult(Vec v1, float n) ;



Division
--
available for Vec2, Vec3 and Vec4
--
Vec div(Vec v1, Vec v2) ;

Vec div(Vec v1, float n) ;




Map
--
available for Vec2, Vec3 and Vec4
--
@ return Vec2, Vec3 or Vec4
>return a mapping Vec on different scale

Vec mapVec(Vec v, float minIn, float maxIn, float minOut, float maxOut) ;



Equals
--
available for Vec2, Vec3 and Vec4
compare two vectors, return true when those are equals.
you can also compare those two vector in area, return true if those vectors are in the area of each other.
the method equals don't work when it's nested in the class, instead used method compare.
--
boolean equals(Vec v1, Vec v2);

boolean equals(Vec v1, Vec v2, Vec area);

boolean compare(Vec v1, Vec v2);

boolean compare(Vec v1, Vec v2, Vec area);





Cross product
--
Vec3 cross(Vec3 v_a, Vec3 v_b);



Magnitude
--
@return float
>return Magnitude of vector or length, available for Vec2, Vec2 or Vec4

mag(Vec v);


>magnitude of two vectors, between himself and the target vector

mag(Vec2 v1, Vec2 v2) ;

mag(Vec3 v1, Vec3 v2) ;

mag(Vec4 v1, Vec4 v2) ;


Distance
--
@return float
>add two vectors

dist(Vec2 v_a, Vec2 v_b) ;

dist(Vec3 v_a, Vec3 v_b) ;

dist(Vec4 v_a, Vec4 v_b) ;





Barycenter
--
Now this method is used instead middle()
--
@ return Vec2, Vec3 or Vec4
> find the middle position between two vectors

barycenter(Vec2... arg) ;

barycenter(Vec3... arg) ;

barycenter(Vec4... arg) ;

barycenter(Vec5... arg) ;

barycenter(Vec6... arg) ;







Jitter 
--
@ return Vec2, Vec3 or Vec4
> Return is a random gaussian vector with value between the pos minus the range and pos plus the range, some time the value can be greater or lesser of the range.

Jitter 2D
--
jitter_2D(int range);

jitter_2D(Vec2 range);

jitter_2D(int range_x, int range_y) ;

Jitter 3D
--
jitter_3D(int range);

jitter_3D(Vec3 range);

jitter_3D(int range_x, int range_y, int range_z);

Jitter 4D
--
jitter_4D(int range);

jitter_4D(Vec4 range);

jitter_4D(int range_x, int range_y, int range_z, int range_w);


Normalize vector from angle
--
@return Vec2
>return vector position from an angle, this method work only with Vec2

norm_rad(float angle) ;

norm_deg(float angle) ;

> with this method you must indicate the String Name of the unit "DEG" for degrees or "RAD" for radians

norm_dir(String type, float angle) ;


Translate cor int
--
Vec4 color_HSB_a(int c) ;

Vec4 color_RGB_a(int c) ;

Vec3 color_HSB(int c) ;

Vec3 color_RGB(int c) ;


Copy PVector to Vec
--
@ return Vec3
> transforme PVector to Vec3

copyPVectorToVec(PVector v)
