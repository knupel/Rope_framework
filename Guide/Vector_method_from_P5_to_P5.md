*Method from Processing who used Vector class
Very helpful sometime !

you can use the few Procesing method with Vec2 and Vec3
method that you can use
the thing good with the Vec3, you can use the the "z" position !!!!
--

*colorMode

void colorMode(Vec5 component);
>the first compoent is used for the colorMode environment, the others for x,y,z,a compoent RGB_A or HSB_A

void colorMode(int mode, Vec4 component);
> component x,y,z,a is use for RGB_A or HSB_A

void colorMode(int mode, Vec3 component);
> component x,y,z is use for RGB or HSB

void colorMode(int mode, Vec2 component);
>int compoent.x is used for RGB or HSB and component.y is use for ALPHA

*floor

Vec2 floor(Vec2 arg);

Vec3 floor(Vec3 arg);

Vec4 floor(Vec4 arg);

*round

Vec2 round(Vec2 arg);

Vec3 round(Vec3 arg);

Vec4 round(Vec4 arg);


*ceil

Vec2 ceil(Vec2 arg);

Vec3 ceil(Vec3 arg);

Vec4 ceil(Vec4 arg);



*max

Vec2 max(Vec2 a, Vec2 b);

Vec3 max(Vec3 a, Vec3 b);

Vec4 max(Vec4 a, Vec4 b);

iVec2 max(iVec2 a, iVec2 b);

iVec3 max(iVec3 a, iVec3 b);

iVec4 max(iVec4 a, iVec4 b);


*min

Vec2 min(Vec2 a, Vec2 b);

Vec3 min(Vec3 a, Vec3 b);

Vec4 min(Vec4 a, Vec4 b);

iVec2 min(iVec2 a, iVec2 b);

iVec3 min(iVec3 a, iVec3 b);

iVec4 min(iVec4 a, iVec4 b);



*set

void set(iVec2 pos, int c);

void set(Vec2 pos, int c);


*random

float random (Vec2 v);

float random (iVec2 v);


*text
processing improve

text(String s, Vec pos);

text(char c, Vec pos);

text(int num, Vec pos);

text(float num, Vec pos);

text(String s, iVec pos);

text(char c, iVec pos);

text(int num, iVec pos);

text(float num, iVec pos);


*IMAGE 
processing improve

void image(Pimage img, iVec pos) ;

void image(Pimage img, iVec pos, iVec2 size) ;

void image(Pimage img, Vec pos) ;

void image(Pimage img, Vec pos, Vec2 size) ;


*GEOMETRY

processing improve
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







*background

processing improve

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



*ASPECT

processing improve

fill (Vec2 grey_alpha);

fill (Vec3 colour);

fill (Vec3 colour, float alpha);

fill (Vec4 colour_alpha);

stroke (Vec2 grey_alpha);

stroke (Vec3 colour);

stroke (Vec3 colour, float alpha);

stroke (Vec4 colour_alpha);

fill (iVec2 grey_alpha);

fill (iVec3 colour);

fill (iVec3 colour, float alpha);

fill (iVec4 colour_alpha);

stroke (iVec2 grey_alpha);

stroke (iVec3 colour);

stroke (iVec3 colour, float alpha);

stroke (iVec4 colour_alpha);


*MATRIX

processing improve

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



*New Matrix method

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










































