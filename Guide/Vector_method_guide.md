*ivec method

*Addition

ivec2 iadd(ivec2 a, ivec2 b);

ivec3 iadd(ivec3 a, ivec3 b);

ivec4 iadd(ivec4 a, ivec4 b);

ivec2 iadd(ivec2 a, int arg);

ivec3 iadd(ivec3 a, int arg);

ivec4 iadd(ivec4 a, int arg);


*Multiplication

ivec2 imult(ivec2 a, ivec2 b);

ivec3 imult(ivec3 a, ivec3 b);

ivec4 imult(ivec4 a, ivec4 b);

ivec2 imult(ivec2 a, int arg);

ivec3 imult(ivec3 a, int arg);

ivec4 imult(ivec4 a, int arg);


*Division

ivec2 idiv(ivec2 a, ivec2 b);

ivec3 idiv(ivec3 a, ivec3 b);

ivec4 idiv(ivec4 a, ivec4 b);

ivec2 idiv(ivec2 a, int arg);

ivec3 idiv(ivec3 a, int arg);

ivec4 idiv(ivec4 a, int arg);


*Substraction

ivec2 isub(ivec2 a, ivec2 b);

ivec3 isub(ivec3 a, ivec3 b);

ivec4 isub(ivec4 a, ivec4 b);

ivec2 isub(ivec2 a, int arg);

ivec3 isub(ivec3 a, int arg);

ivec4 isub(ivec4 a, int arg);









*vec method

*Addition

vec2 add(vec2 a, vec2 b);

vec3 add(vec3 a, vec3 b);

vec4 add(vec4 a, vec4 b);

vec2 add(ivec2 a, ivec2 b);

vec3 add(ivec3 a, ivec3 b);

vec4 add(ivec4 a, ivec4 b);

vec2 add(vec2 a, float arg);

vec3 add(vec3 a, float arg);

vec4 add(vec4 a, float arg);

vec2 add(ivec2 a, float arg);

vec3 add(ivec3 a, float arg);

vec4 add(ivec4 a, float arg);


*Multiplication

vec2 mult(vec2 a, vec2 b);

vec3 mult(vec3 a, vec3 b);

vec4 mult(vec4 a, vec4 b);

vec3 mult(ivec3 a, ivec3 b);

vec4 mult(ivec4 a, ivec4 b);

vec2 mult(vec2 a, float arg);

vec3 mult(vec3 a, float arg);

vec4 mult(vec4 a, float arg);

vec2 mult(ivec2 a, float arg);

vec3 mult(ivec3 a, float arg);

vec4 mult(ivec4 a, float arg);


*Division

vec2 div(vec2 a, vec2 b) 

vec3 div(vec3 a, vec3 b);

vec4 div(vec4 a, vec4 b);

vec2 div(ivec2 a, ivec2 b);

vec3 div(ivec3 a, ivec3 b);

vec4 div(ivec4 a, ivec4 b);

vec2 div(vec2 a, float arg);

vec3 div(vec3 a, float arg);

vec4 div(vec4 a, float arg);

vec2 div(ivec2 a, float arg);

vec3 div(ivec3 a, float arg);

vec4 div(ivec4 a, float arg);


*Substraction

vec2 sub(vec2 a, vec2 b);

vec3 sub(vec3 a, vec3 b);

vec4 sub(vec4 a, vec4 b);

vec2 sub(ivec2 a, ivec2 b);

vec3 sub(ivec3 a, ivec3 b);

vec4 sub(ivec4 a, ivec4 b);

vec2 sub(vec2 a, float arg);

vec3 sub(vec3 a, float arg);

vec4 sub(vec4 a, float arg);

vec2 sub(ivec2 a, float arg);

vec3 sub(ivec3 a, float arg);

vec4 sub(ivec4 a, float arg);


*Cross

vec3 cross(vec3 v1, vec3 v2);




*Compare

boolean compare(ivec2 a, ivec2 b); 
> see equal in GLSL_method.md guide

boolean compare(ivec3 a, ivec3 b);
> see equal in GLSL_method.md guide

boolean compare(ivec4 a, ivec4 b);
> see equal in GLSL_method.md guide

boolean compare(ivec2 a, ivec2 b, ivec2 area);

boolean compare(ivec3 a, ivec3 b, ivec3 area);

boolean compare(ivec4 a, ivec4 b, ivec4 area);


boolean compare(vec2 a, vec2 b);
> see equal in GLSL_method.md guide

boolean compare(vec3 a, vec3 b);
> see equal in GLSL_method.md guide

boolean compare(vec4 a, vec4 b);
> see equal in GLSL_method.md guide

boolean compare(vec2 a, vec2 b, vec2 area);

boolean compare(vec3 a, vec3 b, vec3 area);

boolean compare(vec4 a, vec4 b, vec4 area);




*Map

vec2 map(vec2 v,float minIn, float maxIn, float minOut, float maxOut);

vec3 map(vec3 v,float minIn, float maxIn, float minOut, float maxOut);

vec4 map(vec4 v,float minIn, float maxIn, float minOut, float maxOut);


*Magnitude or length

float mag(vec2 a);

float mag(vec2 a, vec2 b);

float mag(vec3 a);

float mag(vec3 a, vec3 b);

float mag(vec4 a);

float mag(vec4 a, vec4 b);



*Distance

float dist(vec2 a, vec2 b);

float dist(vec3 a, vec3 b);

float dist(vec4 a, vec4 b);


*Barycenter

vec2 barycenter(vec2... v);

vec3 barycenter(vec3... v);

vec4 barycenter(vec4... v);



*Jitter

vec2 jitter_2D(int range);

vec2 jitter_2D(vec2 range);

vec2 jitter_2D(int range_x, int range_y);

vec3 jitter_3D(int range);

vec3 jitter_3D(vec3 range);

vec3 jitter_3D(int range_x, int range_y, int range_z);

vec4 jitter_4D(int range);

vec4 jitter_4D(vec4 range);

vec4 jitter_4D(int range_x, int range_y, int range_z, int range_w);


*Normalize

vec2 norm_rad(float angle);

vec2 norm_deg(float angle);

vec2 norm_dir(String type, float direction);














*Return a new bvec


bvec2 bvec2();

vec2(false,false);

bvec2 bvec2(boolean b);

bvec2 bvec2(boolean x, boolean y);

bvec2 bvec2(boolean [] array);

bvec2 bvec2(bvec b);

bvec3 bvec3();

bvec3 bvec3(boolean b);

bvec3 bvec3(boolean x, boolean y, boolean z);

bvec3 bvec3(boolean [] array);

bvec3 bvec3(bvec b);

bvec4 bvec4();

bvec4 bvec4(boolean b);

bvec4 bvec4(boolean x, boolean y, boolean z, boolean w);

bvec4 bvec4(boolean [] array);

bvec4 bvec4(bvec b);

bvec5 bvec5();

bvec5 bvec5(boolean b);

bvec5 bvec5(boolean a, boolean b, boolean c, boolean d, boolean e);

bvec5 bvec5(boolean [] array);

bvec5 bvec5(bvec b);

bvec6 bvec6();

bvec6 bvec6(boolean b);

bvec6 bvec6(boolean a, boolean b, boolean c, boolean d, boolean e, boolean f);

bvec6 bvec6(boolean [] array);

bvec6 bvec6(bvec b);










*Return a new ivec

ivec2 ivec2();

ivec2 ivec2(int v);

ivec2 ivec2(int x, int y);

ivec2 ivec2(int [] array);

ivec2 ivec2(ivec p);

ivec2 ivec2(float v);

ivec2 ivec2(float x, float y);

ivec2 ivec2(float [] array);

ivec2 ivec2(vec p);

ivec2 ivec2(PGraphics media);

ivec2 ivec2(PImage media);

--

ivec3 ivec3();

ivec3 ivec3(int v);

ivec3 ivec3(int x, int y, int z);

ivec3 ivec3(int [] array);

ivec3 ivec3(ivec p);

ivec3 ivec3(float v);

ivec3 ivec3(float x, float y, float z);

ivec3 ivec3(float [] array);

ivec3 ivec3(vec p);

--

ivec4 ivec4();

ivec4 ivec4(int v);

ivec4 ivec4(int x, int y, int z, int w);

ivec4 ivec4(int [] array);

ivec4 ivec4(ivec p);

ivec4 ivec4(float v);

ivec4 ivec4(float x, float y, float z, float w);

ivec4 ivec4(float [] array);

ivec4 ivec4(vec p);

--

ivec5 ivec5();

ivec5 ivec5(int v);

ivec5 ivec5(int a, int b, int c, int d, int e);

ivec5 ivec5(int [] array);

ivec5 ivec5(ivec p);

ivec5 ivec5(vec p);

--

ivec6 ivec6();

ivec6 ivec6(int v);

ivec6 ivec6(int a, int b, int c, int d, int e, int f);

ivec6 ivec6(int [] array);

ivec6 ivec6(ivec p);

ivec6 ivec6(vec p);










*Return a new vec

vec2 vec2();

vec2 vec2(float x, float y);

vec2 vec2(float [] array);

vec2 vec2(int [] array);

vec2 vec2(float v);

vec2 vec2(PVector p);

vec2 vec2(vec p);

vec2 vec2(ivec p);

vec2 vec2(PGraphics media);

vec2 vec2(PImage media);


vec3 vec3();

vec3 vec3(float x, float y, float z);

vec3 vec3(float [] array);

vec3 vec3(int [] array);

vec3 vec3(float v);

vec3 vec3(PVector p);

vec3 vec3(vec p);

vec3 vec3(ivec p);

vec4 vec4();

vec4 vec4(float x, float y, float z, float w);

vec4 vec4(float [] array);

vec4 vec4(int [] array);

vec4 vec4(float v);

vec4 vec4(PVector p);

vec4 vec4(vec p);

vec4 vec4(ivec p);

vec5 vec5();

vec5 vec5(float a, float b, float c, float d, float e);

vec5 vec5(float [] array);

vec5 vec5(int [] array);

vec5 vec5(float v);

vec5 vec5(PVector p);

vec5 vec5(vec p);

vec5 vec5(ivec p);

vec6 vec6();

vec6 vec6(float a, float b, float c, float d, float e, float f);

vec6 vec6(float [] array);

vec6 vec6(int [] array);

vec6 vec6(float v);

vec6 vec6(PVector p);

vec6 vec6(vec p);

vec6 vec6(ivec p);





*Return a new random range vec 

@see vector class guide for more detail

vec2 vec2(String s, int x, int y);

vec2 vec2(String s, int a, int b, int c, int d);

vec2 vec2(String s, int v);

vec3 vec3(String s, int x, int y, int z);

vec3 vec3(String s, int a, int b, int c, int d, int e, int f);

vec3 vec3(String s, int v);

vec4 vec4(String s, int x, int y, int z, int w);

vec4 vec4(String s, int a, int b, int c, int d, int e, int f, int g, int h);

vec4 vec4(String s, int v);

vec5 vec5(String s, int a, int b, int c, int d, int e);

vec5 vec5(String s, int a, int b, int c, int d, int e, int f, int g, int h, int i, int j);

vec5 vec5(String s, int v);

vec6 vec6(String s, int a, int b, int c, int d, int e, int f);

vec6 vec6(String s, int a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l);

vec6 vec6(String s, int v);






