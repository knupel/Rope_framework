vec and ivec Rope
--
vec is class and method to use vector and operation with float componenet

ivec is class to store Integer component



CLASS bvec
v 0.0.1
--
> Not necessary to use 'new' to build your vec

bvec3 b = bvec3() ;

bvec3 b = bvec3(false) ;

bvec3 b = bvec3(true,false,true) ;

method
--

set
--
your_bvec.set(boolean x, boolean y) ;

your_bvec.set(boolean x, boolean y, boolean z) ;

your_bvec.set(boolean x, boolean y, boolean z, boolean w) ;

your_bvec.set(boolean a, boolean b, boolean c, boolean c, boolean e) ;

your_bvec.set(boolean a, boolean b, boolean c, boolean c, boolean e, boolean f) ;

get
--
boolean [] get_array();
> return the list of component in an array




CLASS ivec
v 0.2.3
--
> Not necessary to use 'new' to build your vec

ivec3 v = ivec3();

ivec3 v = ivec3(0);

ivec3 v = ivec3(1,2,3);

method set global
--
ivec set(int x, int y);

ivec set(int x, int y, int z);

ivec set(int x, int y, int z, int w);

ivec set(int a, int b, int c, int c, int e);

ivec set(int a, int b, int c, int c, int e, int f);


method set specific
--
ivec set_x(int arg);
The method exist for each element of the class
ivec2 : [x,y], [s,t], [u,v]
ivec3 : [x,y,z], [r,v,b], [s,t,p]
ivec4 : [x,y,z,w], [r,v,b,a], [s,t,p,q]
ivec5 : [a,b,c,d,e]
ivec6 : [a,b,c,d,e,f]




get
--
int [] get_array();
> return the list of component in an array int, available for bvec type


int get_num();
> return the number of componant of this vec, ivec or bvec, this availaple in the upper class don't need to cast or check the instance to know it.




OPERATION
--
> available for ivec2, ivec3 and ivec4

Sum
--
ivec.sum();
>return the sum of all component, available for ivec type

--
Multiplication
-- 

--
@ return ivec2, ivec3 or ivec4
>multiplication vector by a same int

ivec2.mult(int value,int value);

ivec3.mult(int value,int value,int value);

ivec4.mult(int value,int value,int value,int value);

ivec.mult(int value);
ivec.mult(ivec v);

--
Division
--
available for vec2, vec3 and vec4
--
@ return vec2, vec3 or vec4
>division vector by int

ivec2.div(int value,int value);
ivec3.div(int value,int value,int value);
ivec4.div(int value,int value,int value,int value);

ivec.div(int value);
ivec.div(ivec v);


Addition
--
>available for vec2, vec3 and vec4, 
>Each vec can accept any vec. 
>For example, if you add a vec2 in vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@return vec2, vec3 or vec4
>add int value to the original

ivec2.add(int value,int value);
ivec3.add(int value,int value,int value);
ivec4.add(int value,int value,int value,int value);

ivec.add(int value);
ivec.add(ivec v);


Substraction
--
>available for vec2, vec3 and vec4.
>Each vec can accept any vec. 
>For example, if you add a vec2 in vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@ return vec2, vec3 or vec4
>sub int value to the original

ivec2.sub(int value,int value);
ivec3.sub(float value,int value,int value);
ivec4.sub(int value,int value,int value,int value);

ivec.sub(int value);
ivec.sub(ivec v);


Equals
--
available for ivec2, ivec3 and ivec4
--
> compares ivec too an other one, is like equals and sure in the future this method will be deprecated.
@ return boolean

ivec.equals(int target);

ivec.equals(ivec2 target);
>you must compare same type of ivec

ivec2.equals(int target_x, int target_y);

ivec3.equals(int target_x, int target_y, int target_z);

ivec4.equals(int target_x, int target_y, int target_z, int target_w);


Copy
--
ivec copy()
>return a copy of the ivec





















Class vec

--
inspirated by GLSL and PVector Method of Daniel Shiffman
--

Like PVector, but closer of GLSL method.
It's used to store float value than below and for differents math process.

Link about vector
http://acko.net/files/dump/tiles/fieldlines.html


BE CAREFUL
--
When you built vec you don't use "new" like with PVector,
you have acces to three type of vector, with boolean precision, interger precision and float precision. Like in GLSL, the name is bvec, ivec and vec.
You can create the three type like below, excepte the random method, only for vec type.

CATCH
--
vec2, ivec2
>x,y / s,t / u,v

bvec2
>x,y,a,b

vec3, ivec3
>x,y,z / r,g,b,s,t,p

bvec3
>x,y,z / a,b,c

vec4, ivec4
>x,y,z,w / r,g,b,a / s,t,p,q

bvec3
>x,y,z,w / a,b,c,d

vec5, ivec5, bvec5
>a,b,c,d,e

VeC, ivec6, bvec6
>a,b,c,d,e,f


vector 2
--
vec2();

vec2(float value);

vec2(float x, float y);

vec2(float [] array);

vec2(int value);

vec2(int x, int y);

vec2(int [] array);

vec2(PVector p);

vec2(vec vec);

vec2(ivec ivec);

vector 3
--
vec3();

vec3(float value);

vec3(float x, float y,float z);

vec3(float [] array);

vec3(int value);

vec3(int x, int y, int z);

vec3(int [] array);

vec3(PVector p);

vec3(vec vec);

vec3(ivec ivec);


vector 4
--
vec4();

vec4(float value);

vec4(float x,float y, float z, float w);

vec4(float [] array);

vec4(int value);

vec4(int x, int y, int z, int w);

vec4(int [] array);

vec4(PVector p);

vec4(vec vec);

vec4(ivec ivec);


vector 5
--
vec5();

vec5(float value);

vec5(float a,float b, float c, float d, float e);

vec5(int value);

vec5(int a, int b, int c, int d, int e);

vec5(int [] array);

vec5(PVector p);

vec5(vec vec);

vec5(ivec ivec);


vector 6
--
vec6();

vec6(float value);

vec6(float a,float b, float c, float d, float e, float f);

vec6(int value);

vec6(int a, int b, int c, int d, int e, int f);

vec6(int [] array);

vec6(PVector p);

vec6(vec vec);

vec6(ivec ivec);





vec2 Random build
--
new vec2(String arg, float value);
>String arg = "RANDOM" or "RANDOM ZERO"  

>also use contante RANDOM or RANDOM_ZERO

new vec2(String arg, float x, float y);
>String arg = "RANDOM" or "RANDOM ZERO" or "RANDOM RANGE" 

>also use contante RANDOM or RANDOM_ZERO

new vec2(String arg, float a1, float a2, float b1, float b2)  ;
>arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>String arg = "RANDOM" if the String arg is equal to "RANDOM" the construtor a random value between float value and float value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2




vec3 Random build
--
vec3(String arg, float value);
>arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new vec3(String arg, float x, float y, float z);
>arg = "RANDOM" or "RANDOM ZERO" 

>also use use contante RANDOM or RANDOM_ZERO

new vec3(String arg, float a1, float a2, float b1, float b2, float c1, float c2);
>arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>arg = "RANDOM" if the String arg is equal to "RANDOM" the construtor a random value between float -value and float value

>arg = "RANDOM ZERO" if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2




vec4 Random build
--
new vec4(String arg, float value);
>String arg = "RANDOM" or "RANDOM ZERO" or use contante RANDOM or RANDOM_ZERO

new vec4(String arg, float x, float y, float z, float z);
>arg = "RANDOM" or "RANDOM ZERO" or use contante RANDOM or RANDOM_ZERO

new vec4(String arg, float a1, float a2, float b1, float b2, float c1, float c2, float d1, float d2); 
>String arg = "RANDOM RANGE" or use constante RANDOM_RANGE

>String arg = "RANDOM" 		if the String arg is equal to "RANDOM" the construtor a random value between float -value and float value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2




vec5 Random build
--
new vec5(String arg, float value) 
>String arg = "RANDOM" or "RANDOM ZERO" 
>also use contante RANDOM or RANDOM_ZERO

new vec5(String arg, float a, float b, float c, float d, float e) ;
>String arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new vec5(String arg, float a1, float a2, float b1, float b2, float c1, float c2, float d1, float d2, float e1, float e2) ;
>String arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>String arg = "RANDOM" 		if the String arg is equal to "RANDOM" the construtor a random value between float -value and float value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between float 0 and float value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between float value_1 and float value_2






vec6 Random build
--
new vec6(String arg, float value)  ;
>String arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new vec6(String arg, float a, float b, float c, float d, float e, float f) ;
>String arg = "RANDOM" or "RANDOM ZERO" 

>also use contante RANDOM or RANDOM_ZERO

new vec6(String arg, float a1, float a2, float b1, float b2, float c1, float c2, float d1, float d2, float e1, float e2, float f1, float f2) ;
>String arg = "RANDOM RANGE" 

>also use constante RANDOM_RANGE

>String arg = "RANDOM" 		if the String arg is equal to "RANDOM" the construtor a random value between int -value and int value

>String arg = "RANDOM ZERO" 	if the String arg is equal to "RANDOM ZERO" the construtor a random value between int 0 and int value

>String arg = "RANDOM RANGE" if the String arg is equal to "RANDOM RANGE" the construtor a random value between int value_1 and int value_2





method set global
--
> set you vec from vec2 to vec6
vec set(float value);

vec set(float x, float y);

vec set(vec a);

vec set(float [] list);


method set specific
--
vec set_x(int arg);
The method exist for each element of the class
vec2 : [x,y], [s,t], [u,v]
vec3 : [x,y,z], [r,v,b], [s,t,p]
vec4 : [x,y,z,w], [r,v,b,a], [s,t,p,q]
vec5 : [a,b,c,d,e]
vec6 : [a,b,c,d,e,f]


GET
--
float [] get_array();
>return the list of component in an array float, available for vec type



OPERATION
--

Sum
--

ivec.sum();
>return the sum of all component, available for vec2, vec3 and vec4

--
Multiplication
-- 
available for vec2, vec3 and vec4
--
@ return vec2, vec3 or vec4
>multiplication vector by a same float

vec2.mult(float value,float value);

vec3.mult(float value,float value,float value);

vec4.mult(float value,float value,float value,float value);

vec.mult(int value);

vec.mult(float value);

vec.mult(vec v);

vec.mult(ivec v);

--
Division
--
available for vec2, vec3 and vec4
--
@ return vec2, vec3 or vec4
>division vector by float

vec2.div(float value,float value);

vec3.div(float value,float value,float value);

vec4.div(float value,float value,float value,float value);

vec.div(int value);

vec.div(float value);

vec.div(vec v);

vec.div(ivec v);


--
Addition
--
>available for vec2, vec3 and vec4, 
>Each vec can accept any vec. 
>For example, if you add a vec2 in vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@return vec2, vec3 or vec4
>add float value to the original

vec2.add(float value,float value);

vec3.add(float value,float value,float value);

vec4.add(float value,float value,float value,float value);

vec.add(int value);

vec.add(float value);

vec.add(vec v);

vec.add(ivec v);


--
Substraction
--
>available for vec2, vec3 and vec4.
>Each vec can accept any vec. 
>For example, if you add a vec2 in vec3 the last compent is '0' in the other case the last compoenent is not used.
--
@ return vec2, vec3 or vec4
>sub float value to the original

vec2.sub(float value,float value);

vec3.sub(float value,float value,float value);

vec4.sub(float value,float value,float value,float value);

vec.sub(int value);

vec.sub(float value);

vec.sub(vec v);

vec.sub(ivec v);



--
Average
--
>available for vec2, vec3, vec4

float vec.average();
>return the average of all components



--
Direction normal
--
available for vec2, vec3 and vec4
--
> give a normal and cartesian direction of your vector
@return vec2
your_vec2.dir();

vec2.dir(float x, float y);

vec2.dir(vec2 origin);

@return vec3
your_vec3.dir();

your_vec3.dir(float x, float y, float z);

your_vec3.dir(vec3 origin);

@return vec4
your_vec4.dir();

your_vec4.dir(float x, float y, float z,float w);

your_vec4.dir(vec4 origin);



Dot
--
available for vec2, vec3 and vec4
--
@ float
>return float of the vector dot

vec2.dot(vec2 target);

vec2.dot(float x, float y);

vec3.dot(vec3 target);

vec3.dot(float x, float y, float z);

vec4.dot(vec4 target);

vec4.dot(float x, float y, float z, float w);


Pow
--
available for vec2, vec3 and vec4
--
@ vec
>return vec of pow of each component

vec pow(int n);
>available for vec2, vec3 and vec4

vec2 pow (int pow_x, int pow_y);

vec3 pow(int pow_x, int pow_y, int pow_z);

vec4 pos(int pow_x, int pow_y, int pow_z, int pow_w);



--
MISC
--
--


normalize
--
>available for vec2, vec3 and vec4.
>Each vec can accept any vec. 
>For example, if you add a vec2 in vec3 the last compent is '0' in the other case the last compoenent is not used.
--
>return vec2, vec3 or vec4
  
vec2 normalize(vec target);

vec2 normalize();

Map
--
>available for vec2, vec3 and vec4.
>return vec2, vec3 or vec4

vec map_vec(float minIn, float maxIn, float minOut, float maxOut) ;

vec map_vec(vec2 minIn, vec2 maxIn, vec2 minOut, vec2 maxOut);


--
cross
--
@ vec3
your_vec3.cross(vec3 a, vec3 target);
>return the cross of vectors


Tangent
--
>return a vec2 normal direction of the tangent of your vector target

vec2 tan();

vec2 tan(vec2 target);

vec2 tan(float target_x, float target_y);
>the method tan with target, give the possibility to find the tan between two vectors in any position

vec3 tan(vec3 vector_to_make_plane_ref);

vec3 tan(float vector_to_make_plane_ref, float ref_y, float ref_z);




Magnitude
--
available for vec2, vec3 and vec4
--
@ return float
>magnitude of the vectors 

your_vec.mag();
>magnitude of vector

your_vec.mag(vec2 v);
>magnitude of two vectors, between himself and the target vector

your_vec.magSq();



Limit
--
available for vec2, vec3 and vec4

vec limit();


Angle
--
float heading();
>return float angle

float angle();
>return float angle



Distance
--
available for vec2, vec3 and vec4

>Each vec can accept any vec. 
>For example, if you add a vec2 in vec3 the last compent is '0' in the other case the last compoenent is not used.
--
> distance between himself and the target vector

float dist(vec v_target) ;




Max and Min component of vector
--
available for vec2 to vec6

float min_vec();

float max_vec();



Copy
--
available from vec2 to vec6

vec copy();
>return a copy of himself




















--
Normalize
--
available for vec2, vec3 and vec4
--
>map vec on different scale

>return a normalize vec 

vec2 method

vec.normalize(vec2 min, vec2 max);

vec.normalize(vec2 max); // zero is the min value

vec.normalize();

vec3 method
--
vec.normalize(vec3 min, vec3 max);

vecnormalize(vec3 max); // zero is the min value

vec.normalize();

vec4 method
--
vec.normalize(vec4 min, vec4 max);

vec.normalize(vec4 max); // zero is the min value

vec.normalize();



Map
--
available for vec2, vec3 and vec4
--
>map vec on different scale

vec.mapvec(float minIn, float maxIn, float minOut, float maxOut);

vec.mapvec(float minIn, float maxIn, float minOut, float maxOut);

vec.mapvec(float minIn, float maxIn, float minOut, float maxOut);





--
Change or new methods
--
Equals
--
available for vec2, vec3 and vec4
--
> compares vec too an other one, is like equals and sure in the future this method will be deprecated.
@ return boolean
vec.equals(float target);

vec.equals(vec2 target);

vec.equals(float target_x, float target_y);

vec.equals(vec3 target);

vec.equals(float target_x, float target_y, float target_z);

vec.equals(vec4 target);

vec.equals(float target_x, float target_y, float target_z, float target_w);



Revolution
--
@ return vec2
>the vector position make a circular move around a center positon

vec.revolution(int radius, int speed);

vec.revolution(int rx, int ry, int speed);

vec.revolution(vec2 radius, int speed);

@ return a vec3
>the vector position make a circular move around a center positon

vec.revolutionX(int radius, int speed);

vec.revolutionX(int rx, int ry, int speed);

vec.revolutionX(vec2 radius, int speed);

--
vec.revolutionY(int radius, int speed);

vec.revolutionY(int rx, int ry, int speed);

vec.revolutionY(vec2 radius, int speed);

--
vec.revolutionZ(int radius, int speed);

vec.revolutionZ(int rx, int ry, int speed);

vec.revolutionZ(vec2 radius, int speed);



Jitter
--
available for vec2, vec3 and vec4
--
> Return is a random gaussian vector with value between the pos minus the range and pos plus the range, some time the value can be greater or lesser of the range.
--
@ return a vec2
vec.jitter(int range);

vec.jitter(int range_x, int range_y);

vec.jitter(vec2 range);


@ return a vec3
vec.jitter(int range);

vec.jitter(int range_x, int range_y,, int range_z);

vec.jitter(vec3 range);


@ return a vec4
vec.jitter(int range);

vec.jitter(int range_x, int range_y, int range_z, int range_w) ;

vec.jitter(vec4 range) ;



