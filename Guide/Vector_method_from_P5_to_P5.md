*Method from Processing who used vector class
Very helpful sometime !

you can use the few Procesing method with vec2 and vec3
method that you can use
the thing good with the vec3, you can use the the "z" position !!!!
--

*colorMode

void colorMode(vec5 component);
>the first compoent is used for the colorMode environment, the others for x,y,z,a compoent RGB_A or HSB_A

void colorMode(int mode, vec4 component);
> component x,y,z,a is use for RGB_A or HSB_A

void colorMode(int mode, vec3 component);
> component x,y,z is use for RGB or HSB

void colorMode(int mode, vec2 component);
>int compoent.x is used for RGB or HSB and component.y is use for ALPHA

*floor

vec2 floor(vec2 arg);

vec3 floor(vec3 arg);

vec4 floor(vec4 arg);

*round

vec2 round(vec2 arg);

vec3 round(vec3 arg);

vec4 round(vec4 arg);


*ceil

vec2 ceil(vec2 arg);

vec3 ceil(vec3 arg);

vec4 ceil(vec4 arg);



*max

vec2 max(vec2 a, vec2 b);

vec3 max(vec3 a, vec3 b);

vec4 max(vec4 a, vec4 b);

ivec2 max(ivec2 a, ivec2 b);

ivec3 max(ivec3 a, ivec3 b);

ivec4 max(ivec4 a, ivec4 b);


*min

vec2 min(vec2 a, vec2 b);

vec3 min(vec3 a, vec3 b);

vec4 min(vec4 a, vec4 b);

ivec2 min(ivec2 a, ivec2 b);

ivec3 min(ivec3 a, ivec3 b);

ivec4 min(ivec4 a, ivec4 b);



*set

void set(ivec2 pos, int c);

void set(vec2 pos, int c);


*random

float random (vec2 v);

float random (ivec2 v);


*text
processing improve

text(String s, vec pos);

text(char c, vec pos);

text(int num, vec pos);

text(float num, vec pos);

text(String s, ivec pos);

text(char c, ivec pos);

text(int num, ivec pos);

text(float num, ivec pos);


*IMAGE 
processing improve

void image(Pimage img, ivec pos) ;

void image(Pimage img, ivec pos, ivec2 size) ;

void image(Pimage img, vec pos) ;

void image(Pimage img, vec pos, vec2 size) ;


*GEOMETRY

processing improve
If for any reason a vec3 or ivec3 for the position is use and Processing have P3D rendering the component `Z` give the third dimension position

ellipse(ivec pos, ivec size);

ellipse(ivec pos, int size_x);

ellipse(ivec pos, int size_x, int size_y);

ellipse(ivec pos, float size_x);

ellipse(ivec pos, float size_x, float size_y);

ellipse(vec pos, vec size);


rect(vec pos, vec size);

rect(ivec pos, ivec size);


box(vec p);

box(ivec p);


line(vec a, vec b);

line(ivec a, ivec b);


point(vec p);

point(ivec p);


vertex(vec p);

vertex(ivec p);

bezierVertex(vec a, vec b, vec c);

bezierVertex(ivec a, ivec b, ivec c);

curveVertex(vec a);

curveVertex(ivec a);

quadraticVertex(vec a, vec b);

quadraticVertex(ivec a, ivec b);







*background

processing improve

background(vec2 c) ; 
>'x' color value and 'y' is alpha value

background(vec3 c) ;
>x,y,z color value

>background(vec4 c) 
x,y,z color value and alpha value

background(ivec2 c) ; 
>'x' color value and 'y' is alpha value

background(ivec3 c) ;
>x,y,z color value

>background(ivec4 c) 
x,y,z color value and alpha value



*ASPECT

processing improve

fill (vec2 grey_alpha);

fill (vec3 colour);

fill (vec3 colour, float alpha);

fill (vec4 colour_alpha);

stroke (vec2 grey_alpha);

stroke (vec3 colour);

stroke (vec3 colour, float alpha);

stroke (vec4 colour_alpha);

fill (ivec2 grey_alpha);

fill (ivec3 colour);

fill (ivec3 colour, float alpha);

fill (ivec4 colour_alpha);

stroke (ivec2 grey_alpha);

stroke (ivec3 colour);

stroke (ivec3 colour, float alpha);

stroke (ivec4 colour_alpha);


*MATRIX

processing improve

translate
--
translate(vec t) ;

translate(ivec t) ;

translateX(float t) ;

translateY(float t) ;

translateZ(float t) ;

rotate
--
rotateXY(vec2 rot) ;

rotateXZ(vec2 rot) ;

rotateYZ(vec2 rot) ;

rotateXYZ(vec3 rot) ;

rotateXY(ivec2 rot) ;

rotateXZ(ivec2 rot) ;

rotateYZ(ivec2 rot) ;

rotateXYZ(ivec3 rot) ;



*New Matrix method

start_matrix() ;

stop_matrix() ;

start_matrix_2D(vec2 pos, float orientation) ;
>use matrix 2D with cartesian coord

start_matrix_3D(vec3 pos, vec3 dir_cart) ;
>use matrix 3D with cartesian coord

start_matrix_3D(vec3 pos, vec2 dir_polar) ;
>use matrix 3D with polar coord

start_matrix_2D(ivec2 pos, float orientation) ;
>use matrix 2D with cartesian coord

start_matrix_3D(ivec3 pos, ivec3 dir_cart) ;
>use matrix 3D with cartesian coord

start_matrix_3D(ivec3 pos, ivec2 dir_polar) ;
>use matrix 3D with polar coord


DEPRECATED
Matrix_start & matrix_end is 
--
matrix_start() ;
matrix_end() ;

matrix_2D_start(vec2 pos, float orientation);
>use matrix 2D with cartesian coord

matrix_3D_start(vec3 pos, vec3 dir_cart);
>use matrix 3D with cartesian coord

matrix_3D_start(vec3 pos, vec2 dir_polar);
>use matrix 3D with polar coord










































