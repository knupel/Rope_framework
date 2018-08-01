Vec and iVec Rope
--
Vec is class and method to use vector and operation with float componenet

iVec is class to store Integer component



CLASS bVec
v 0.0.1
--
> Not necessary to use 'new' to build your Vec

bVec3 b = bVec3() ;

bVec3 b = bVec3(false) ;

bVec3 b = bVec3(true,false,true) ;

method
--

set
--
your_bVec.set(boolean x, boolean y) ;

your_bVec.set(boolean x, boolean y, boolean z) ;

your_bVec.set(boolean x, boolean y, boolean z, boolean w) ;

your_bVec.set(boolean a, boolean b, boolean c, boolean c, boolean e) ;

your_bVec.set(boolean a, boolean b, boolean c, boolean c, boolean e, boolean f) ;

get
--
boolean [] get_array();
> return the list of component in an array




CLASS iVec
v 0.2.3
--
> Not necessary to use 'new' to build your Vec

iVec3 v = iVec3();

iVec3 v = iVec3(0);

iVec3 v = iVec3(1,2,3);

method set global
--
iVec set(int x, int y);

iVec set(int x, int y, int z);

iVec set(int x, int y, int z, int w);

iVec set(int a, int b, int c, int c, int e);

iVec set(int a, int b, int c, int c, int e, int f);


method set specific
--
iVec set_x(int arg);
The method exist for each element of the class
iVec2 : [x,y], [s,t], [u,v]
iVec3 : [x,y,z], [r,v,b], [s,t,p]
iVec4 : [x,y,z,w], [r,v,b,a], [s,t,p,q]
iVec5 : [a,b,c,d,e]
iVec6 : [a,b,c,d,e,f]




get
--
int [] get_array();
> return the list of component in an array int, available for bVec type


int get_num();
> return the number of componant of this Vec, iVec or bVec, this availaple in the upper class don't need to cast or check the instance to know it.




OPERATION
--
> available for iVec2, iVec3 and iVec4

Sum
--
iVec.sum();
>return the sum of all component, available for iVec type

--
Multiplication
-- 

--
@ return iVec2, iVec3 or iVec4
>multiplication vector by a same int

iVec2.mult(int value,int value);

iVec3.mult(int value,int value,int value);

iVec4.mult(int value,int value,int value,int value);

iVec.mult(int value);
iVec.mult(iVec v);

--
Division
--
available for Vec2, Vec3 and Vec4
--
@ return Vec2, Vec3 or Vec4
>division vector by int

iVec2.div(int value,int value);
iVec3.div(int value,int value,int value);
iVec4.div(int value,int value,int value,int value);

iVec.div(int value);
iVec.div(iVec v);


Addition
--
>available for Vec2, Vec3 and Vec4, 
>Each Vec can accept any Vec. 
>For example, if you add a Vec2 in Vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@return Vec2, Vec3 or Vec4
>add int value to the original

iVec2.add(int value,int value);
iVec3.add(int value,int value,int value);
iVec4.add(int value,int value,int value,int value);

iVec.add(int value);
iVec.add(iVec v);


Substraction
--
>available for Vec2, Vec3 and Vec4.
>Each Vec can accept any Vec. 
>For example, if you add a Vec2 in Vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@ return Vec2, Vec3 or Vec4
>sub int value to the original

iVec2.sub(int value,int value);
iVec3.sub(float value,int value,int value);
iVec4.sub(int value,int value,int value,int value);

iVec.sub(int value);
iVec.sub(iVec v);


Equals
--
available for iVec2, iVec3 and iVec4
--
> compares iVec too an other one, is like equals and sure in the future this method will be deprecated.
@ return boolean

iVec.equals(int target);

iVec.equals(iVec2 target);
>you must compare same type of iVec

iVec2.equals(int target_x, int target_y);

iVec3.equals(int target_x, int target_y, int target_z);

iVec4.equals(int target_x, int target_y, int target_z, int target_w);


Copy
--
iVec copy()
>return a copy of the iVec





















Class Vec

--
inspirated by GLSL and PVector Method of Daniel Shiffman
--

Like PVector, but closer of GLSL method.
It's used to store float value than below and for differents math process.

Link about vector
http://acko.net/files/dump/tiles/fieldlines.html


BE CAREFUL
--
When you built Vec you don't use "new" like with PVector,
you have acces to three type of vector, with boolean precision, interger precision and float precision. Like in GLSL, the name is bVec, iVec and Vec.
You can create the three type like below, excepte the random method, only for Vec type.

CATCH
--
Vec2, iVec2
>x,y / s,t / u,v

bVec2
>x,y,a,b

Vec3, iVec3
>x,y,z / r,g,b,s,t,p

bVec3
>x,y,z / a,b,c

Vec4, iVec4
>x,y,z,w / r,g,b,a / s,t,p,q

bVec3
>x,y,z,w / a,b,c,d

Vec5, iVec5, bVec5
>a,b,c,d,e

VeC, iVec6, bVec6
>a,b,c,d,e,f


Vector 2
--
Vec2();

Vec2(float value);

Vec2(float x, float y);

Vec2(float [] array);

Vec2(int value);

Vec2(int x, int y);

Vec2(int [] array);

Vec2(PVector p);

Vec2(Vec vec);

Vec2(iVec ivec);

Vector 3
--
Vec3();

Vec3(float value);

Vec3(float x, float y,float z);

Vec3(float [] array);

Vec3(int value);

Vec3(int x, int y, int z);

Vec3(int [] array);

Vec3(PVector p);

Vec3(Vec vec);

Vec3(iVec ivec);


Vector 4
--
Vec4();

Vec4(float value);

Vec4(float x,float y, float z, float w);

Vec4(float [] array);

Vec4(int value);

Vec4(int x, int y, int z, int w);

Vec4(int [] array);

Vec4(PVector p);

Vec4(Vec vec);

Vec4(iVec ivec);


Vector 5
--
Vec5();

Vec5(float value);

Vec5(float a,float b, float c, float d, float e);

Vec5(int value);

Vec5(int a, int b, int c, int d, int e);

Vec5(int [] array);

Vec5(PVector p);

Vec5(Vec vec);

Vec5(iVec ivec);


Vector 6
--
Vec6();

Vec6(float value);

Vec6(float a,float b, float c, float d, float e, float f);

Vec6(int value);

Vec6(int a, int b, int c, int d, int e, int f);

Vec6(int [] array);

Vec6(PVector p);

Vec6(Vec vec);

Vec6(iVec ivec);





Vec2 Random build
--
new Vec2(String arg, float value);
>String arg = "RANDOM" or "RANDOM ZERO"  

>also use contante RANDOM or RANDOM_ZERO

new Vec2(String arg, float x, float y);
>String arg = "RANDOM" or "RANDOM ZERO" or "RANDOM RANGE" 

>also use contante RANDOM or RANDOM_ZERO

new Vec2(String arg, float a1, float a2, float b1, float b2)  ;
>arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>String arg = "RANDOM" if the String arg is equal to "RANDOM" the construtor a random value between float value and float value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2




Vec3 Random build
--
Vec3(String arg, float value);
>arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new Vec3(String arg, float x, float y, float z);
>arg = "RANDOM" or "RANDOM ZERO" 

>also use use contante RANDOM or RANDOM_ZERO

new Vec3(String arg, float a1, float a2, float b1, float b2, float c1, float c2);
>arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>arg = "RANDOM" if the String arg is equal to "RANDOM" the construtor a random value between float -value and float value

>arg = "RANDOM ZERO" if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2




Vec4 Random build
--
new Vec4(String arg, float value);
>String arg = "RANDOM" or "RANDOM ZERO" or use contante RANDOM or RANDOM_ZERO

new Vec4(String arg, float x, float y, float z, float z);
>arg = "RANDOM" or "RANDOM ZERO" or use contante RANDOM or RANDOM_ZERO

new Vec4(String arg, float a1, float a2, float b1, float b2, float c1, float c2, float d1, float d2); 
>String arg = "RANDOM RANGE" or use constante RANDOM_RANGE

>String arg = "RANDOM" 		if the String arg is equal to "RANDOM" the construtor a random value between float -value and float value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2




Vec5 Random build
--
new Vec5(String arg, float value) 
>String arg = "RANDOM" or "RANDOM ZERO" 
>also use contante RANDOM or RANDOM_ZERO

new Vec5(String arg, float a, float b, float c, float d, float e) ;
>String arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new Vec5(String arg, float a1, float a2, float b1, float b2, float c1, float c2, float d1, float d2, float e1, float e2) ;
>String arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>String arg = "RANDOM" 		if the String arg is equal to "RANDOM" the construtor a random value between float -value and float value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2






Vec6 Random build
--
new Vec6(String arg, float value)  ;
>String arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new Vec6(String arg, float a, float b, float c, float d, float e, float f) ;
>String arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new Vec6(String arg, float a1, float a2, float b1, float b2, float c1, float c2, float d1, float d2, float e1, float e2, float f1, float f2) ;
>String arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>String arg = "RANDOM" 		if the String arg is equal to "RANDOM" the construtor a random value between int -value and int value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between int 0 and int value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between int value_1 and int value_2





method set global
--
> set you Vec from Vec2 to Vec6
Vec set(float value);

Vec set(float x, float y);

Vec set(Vec a);

Vec set(float [] list);


method set specific
--
Vec set_x(int arg);
The method exist for each element of the class
Vec2 : [x,y], [s,t], [u,v]
Vec3 : [x,y,z], [r,v,b], [s,t,p]
Vec4 : [x,y,z,w], [r,v,b,a], [s,t,p,q]
Vec5 : [a,b,c,d,e]
Vec6 : [a,b,c,d,e,f]


GET
--
float [] get_array();
>return the list of component in an array float, available for Vec type



OPERATION
--

Sum
--

iVec.sum();
>return the sum of all component, available for Vec2, Vec3 and Vec4

--
Multiplication
-- 
available for Vec2, Vec3 and Vec4
--
@ return Vec2, Vec3 or Vec4
>multiplication vector by a same float

vec2.mult(float value,float value);

vec3.mult(float value,float value,float value);

vec4.mult(float value,float value,float value,float value);

vec.mult(int value);

vec.mult(float value);

vec.mult(Vec v);

vec.mult(iVec v);

--
Division
--
available for Vec2, Vec3 and Vec4
--
@ return Vec2, Vec3 or Vec4
>division vector by float

vec2.div(float value,float value);

vec3.div(float value,float value,float value);

vec4.div(float value,float value,float value,float value);

vec.div(int value);

vec.div(float value);

vec.div(Vec v);

vec.div(iVec v);


--
Addition
--
>available for Vec2, Vec3 and Vec4, 
>Each Vec can accept any Vec. 
>For example, if you add a Vec2 in Vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@return Vec2, Vec3 or Vec4
>add float value to the original

vec2.add(float value,float value);

vec3.add(float value,float value,float value);

vec4.add(float value,float value,float value,float value);

vec.add(int value);

vec.add(float value);

vec.add(Vec v);

vec.add(iVec v);


--
Substraction
--
>available for Vec2, Vec3 and Vec4.
>Each Vec can accept any Vec. 
>For example, if you add a Vec2 in Vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@ return Vec2, Vec3 or Vec4
>sub float value to the original

vec2.sub(float value,float value);

vec3.sub(float value,float value,float value);

vec4.sub(float value,float value,float value,float value);

vec.sub(int value);

vec.sub(float value);

vec.sub(Vec v);

vec.sub(iVec v);



--
Average
--
>available for Vec2, Vec3, Vec4

float vec.average();
>return the average of all components



--
Direction normal
--
available for Vec2, Vec3 and Vec4
--
> give a normal and cartesian direction of your vector
@return Vec2
your_vec2.dir();

Vec2.dir(float x, float y);

Vec2.dir(Vec2 origin);

@return Vec3
your_vec3.dir();

your_vec3.dir(float x, float y, float z);

your_vec3.dir(Vec3 origin);

@return Vec4
your_vec4.dir();

your_vec4.dir(float x, float y, float z,float w);

your_vec4.dir(Vec4 origin);



Dot
--
available for Vec2, Vec3 and Vec4
--
@ float
>return float of the vector dot

Vec2.dot(Vec2 target);

Vec2.dot(float x, float y);

Vec3.dot(Vec3 target);

Vec3.dot(float x, float y, float z);

Vec4.dot(Vec4 target);

Vec4.dot(float x, float y, float z, float w);


Pow
--
available for Vec2, Vec3 and Vec4
--
@ Vec
>return Vec of pow of each component

Vec pow(int n);
>available for Vec2, Vec3 and Vec4

Vec2 pow (int pow_x, int pow_y);

Vec3 pow(int pow_x, int pow_y, int pow_z);

Vec4 pos(int pow_x, int pow_y, int pow_z, int pow_w);



--
MISC
--
--


normalize
--
>available for Vec2, Vec3 and Vec4.
>Each Vec can accept any Vec. 
>For example, if you add a Vec2 in Vec3 the last compent is '0' in the other case the last compoenent is not used.
--
>return Vec2, Vec3 or Vec4
  
Vec2 normalize(Vec target);

Vec2 normalize();

Map
--
>available for Vec2, Vec3 and Vec4.
>return Vec2, Vec3 or Vec4

Vec map_vec(float minIn, float maxIn, float minOut, float maxOut) ;

Vec map_vec(Vec2 minIn, Vec2 maxIn, Vec2 minOut, Vec2 maxOut);


--
cross
--
@ Vec3
your_vec3.cross(Vec3 a, Vec3 target);
>return the cross of vectors


Tangent
--
>return a Vec2 normal direction of the tangent of your vector target

Vec2 tan();

Vec2 tan(Vec2 target);

Vec2 tan(float target_x, float target_y);
>the method tan with target, give the possibility to find the tan between two vectors in any position

Vec3 tan(Vec3 vector_to_make_plane_ref);

Vec3 tan(float vector_to_make_plane_ref, float ref_y, float ref_z);




Magnitude
--
available for Vec2, Vec3 and Vec4
--
@ return float
>magnitude of the vectors 

your_vec.mag();
>magnitude of vector

your_vec.mag(Vec2 v);
>magnitude of two vectors, between himself and the target vector

your_vec.magSq();



Limit
--
available for Vec2, Vec3 and Vec4

Vec limit();


Angle
--
float heading();
>return float angle

float angle();
>return float angle



Distance
--
available for Vec2, Vec3 and Vec4

>Each Vec can accept any Vec. 
>For example, if you add a Vec2 in Vec3 the last compent is '0' in the other case the last compoenent is not used.
--
> distance between himself and the target vector

float dist(Vec v_target) ;




Max and Min component of Vector
--
available for Vec2 to Vec6

float min_vec();

float max_vec();



Copy
--
available from Vec2 to Vec6

Vec copy();
>return a copy of himself




















--
Normalize
--
available for Vec2, Vec3 and Vec4
--
>map Vec on different scale

>return a normalize Vec 

Vec2 method

vec.normalize(Vec2 min, Vec2 max);

vec.normalize(Vec2 max); // zero is the min value

vec.normalize();

Vec3 method
--
vec.normalize(Vec3 min, Vec3 max);

vecnormalize(Vec3 max); // zero is the min value

vec.normalize();

Vec4 method
--
vec.normalize(Vec4 min, Vec4 max);

vec.normalize(Vec4 max); // zero is the min value

vec.normalize();



Map
--
available for Vec2, Vec3 and Vec4
--
>map Vec on different scale

vec.mapVec(float minIn, float maxIn, float minOut, float maxOut);

vec.mapVec(float minIn, float maxIn, float minOut, float maxOut);

vec.mapVec(float minIn, float maxIn, float minOut, float maxOut);





--
Change or new methods
--
Equals
--
available for Vec2, Vec3 and Vec4
--
> compares Vec too an other one, is like equals and sure in the future this method will be deprecated.
@ return boolean
vec.equals(float target);

vec.equals(Vec2 target);

vec.equals(float target_x, float target_y);

vec.equals(Vec3 target);

vec.equals(float target_x, float target_y, float target_z);

vec.equals(Vec4 target);

vec.equals(float target_x, float target_y, float target_z, float target_w);



Revolution
--
@ return Vec2
>the vector position make a circular move around a center positon

vec.revolution(int radius, int speed);

vec.revolution(int rx, int ry, int speed);

vec.revolution(Vec2 radius, int speed);

@ return a Vec3
>the vector position make a circular move around a center positon

vec.revolutionX(int radius, int speed);

vec.revolutionX(int rx, int ry, int speed);

vec.revolutionX(Vec2 radius, int speed);

--
vec.revolutionY(int radius, int speed);

vec.revolutionY(int rx, int ry, int speed);

vec.revolutionY(Vec2 radius, int speed);

--
vec.revolutionZ(int radius, int speed);

vec.revolutionZ(int rx, int ry, int speed);

vec.revolutionZ(Vec2 radius, int speed);



Jitter
--
available for Vec2, Vec3 and Vec4
--
> Return is a random gaussian vector with value between the pos minus the range and pos plus the range, some time the value can be greater or lesser of the range.
--
@ return a Vec2
vec.jitter(int range);

vec.jitter(int range_x, int range_y);

vec.jitter(Vec2 range);


@ return a Vec3
vec.jitter(int range);

vec.jitter(int range_x, int range_y,, int range_z);

vec.jitter(Vec3 range);


@ return a Vec4
vec.jitter(int range);

vec.jitter(int range_x, int range_y, int range_z, int range_w) ;

vec.jitter(Vec4 range) ;



