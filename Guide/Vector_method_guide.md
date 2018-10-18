iVec method
--
Addition
--
iVec2 iadd(iVec2 a, iVec2 b);

iVec3 iadd(iVec3 a, iVec3 b);

iVec4 iadd(iVec4 a, iVec4 b);

iVec2 iadd(iVec2 a, int arg);

iVec3 iadd(iVec3 a, int arg);

iVec4 iadd(iVec4 a, int arg);


Multiplication
--
iVec2 imult(iVec2 a, iVec2 b);

iVec3 imult(iVec3 a, iVec3 b);

iVec4 imult(iVec4 a, iVec4 b);

iVec2 imult(iVec2 a, int arg);

iVec3 imult(iVec3 a, int arg);

iVec4 imult(iVec4 a, int arg);


Division
--
iVec2 idiv(iVec2 a, iVec2 b);

iVec3 idiv(iVec3 a, iVec3 b);

iVec4 idiv(iVec4 a, iVec4 b);

iVec2 idiv(iVec2 a, int arg);

iVec3 idiv(iVec3 a, int arg);

iVec4 idiv(iVec4 a, int arg);


Substraction
--
iVec2 isub(iVec2 a, iVec2 b);

iVec3 isub(iVec3 a, iVec3 b);

iVec4 isub(iVec4 a, iVec4 b);

iVec2 isub(iVec2 a, int arg);

iVec3 isub(iVec3 a, int arg);

iVec4 isub(iVec4 a, int arg);









Vec method
--
Addition
--
Vec2 add(Vec2 a, Vec2 b);

Vec3 add(Vec3 a, Vec3 b);

Vec4 add(Vec4 a, Vec4 b);

Vec2 add(iVec2 a, iVec2 b);

Vec3 add(iVec3 a, iVec3 b);

Vec4 add(iVec4 a, iVec4 b);

Vec2 add(Vec2 a, float arg);

Vec3 add(Vec3 a, float arg);

Vec4 add(Vec4 a, float arg);

Vec2 add(iVec2 a, float arg);

Vec3 add(iVec3 a, float arg);

Vec4 add(iVec4 a, float arg);


Multiplication
--
Vec2 mult(Vec2 a, Vec2 b);

Vec3 mult(Vec3 a, Vec3 b);

Vec4 mult(Vec4 a, Vec4 b);

Vec3 mult(iVec3 a, iVec3 b);

Vec4 mult(iVec4 a, iVec4 b);

Vec2 mult(Vec2 a, float arg);

Vec3 mult(Vec3 a, float arg);

Vec4 mult(Vec4 a, float arg);

Vec2 mult(iVec2 a, float arg);

Vec3 mult(iVec3 a, float arg);

Vec4 mult(iVec4 a, float arg);


Division
--
Vec2 div(Vec2 a, Vec2 b) 

Vec3 div(Vec3 a, Vec3 b);

Vec4 div(Vec4 a, Vec4 b);

Vec2 div(iVec2 a, iVec2 b);

Vec3 div(iVec3 a, iVec3 b);

Vec4 div(iVec4 a, iVec4 b);

Vec2 div(Vec2 a, float arg);

Vec3 div(Vec3 a, float arg);

Vec4 div(Vec4 a, float arg);

Vec2 div(iVec2 a, float arg);

Vec3 div(iVec3 a, float arg);

Vec4 div(iVec4 a, float arg);


Substraction
--
Vec2 sub(Vec2 a, Vec2 b);

Vec3 sub(Vec3 a, Vec3 b);

Vec4 sub(Vec4 a, Vec4 b);

Vec2 sub(iVec2 a, iVec2 b);

Vec3 sub(iVec3 a, iVec3 b);

Vec4 sub(iVec4 a, iVec4 b);

Vec2 sub(Vec2 a, float arg);

Vec3 sub(Vec3 a, float arg);

Vec4 sub(Vec4 a, float arg);

Vec2 sub(iVec2 a, float arg);

Vec3 sub(iVec3 a, float arg);

Vec4 sub(iVec4 a, float arg);


Cross
--
Vec3 cross(Vec3 v1, Vec3 v2);




Compare
--
boolean compare(Vec2 a, Vec2 b);

boolean compare(Vec3 a, Vec3 b);

boolean compare(Vec4 a, Vec4 b) ;

boolean compare(Vec2 a, Vec2 b, Vec2 area);

boolean compare(Vec3 a, Vec3 b, Vec3 area);

boolean compare(Vec4 a, Vec4 b, Vec4 area);




Map
--
Vec2 map_vec(Vec2 v,float minIn, float maxIn, float minOut, float maxOut);

Vec3 map_vec(Vec3 v,float minIn, float maxIn, float minOut, float maxOut);

Vec4 map_vec(Vec4 v,float minIn, float maxIn, float minOut, float maxOut);


Magnitude or length
--
float mag(Vec2 a);

float mag(Vec2 a, Vec2 b);

float mag(Vec3 a);

float mag(Vec3 a, Vec3 b);

float mag(Vec4 a);

float mag(Vec4 a, Vec4 b);



Distance
--
float dist(Vec2 a, Vec2 b);

float dist(Vec3 a, Vec3 b);

float dist(Vec4 a, Vec4 b);


Barycenter
--
Vec2 barycenter(Vec2... v);

Vec3 barycenter(Vec3... v);

Vec4 barycenter(Vec4... v);



Jitter
--
Vec2 jitter_2D(int range);

Vec2 jitter_2D(Vec2 range);

Vec2 jitter_2D(int range_x, int range_y);

Vec3 jitter_3D(int range);

Vec3 jitter_3D(Vec3 range);

Vec3 jitter_3D(int range_x, int range_y, int range_z);

Vec4 jitter_4D(int range);

Vec4 jitter_4D(Vec4 range);

Vec4 jitter_4D(int range_x, int range_y, int range_z, int range_w);


Normalize
--
Vec2 norm_rad(float angle);

Vec2 norm_deg(float angle);

Vec2 norm_dir(String type, float direction);


Color
--
Vec4 color_HSBA(int c);

Vec4 color_RGBA(int c);

Vec3 color_HSB(int c);

Vec3 color_RGB(int c);



















Return a new bVec
--

bVec2 bVec2();

Vec2(false,false);

bVec2 bVec2(boolean b);

bVec2 bVec2(boolean x, boolean y);

bVec2 bVec2(boolean [] array);

bVec2 bVec2(bVec b);

bVec3 bVec3();

bVec3 bVec3(boolean b);

bVec3 bVec3(boolean x, boolean y, boolean z);

bVec3 bVec3(boolean [] array);

bVec3 bVec3(bVec b);

bVec4 bVec4();

bVec4 bVec4(boolean b);

bVec4 bVec4(boolean x, boolean y, boolean z, boolean w);

bVec4 bVec4(boolean [] array);

bVec4 bVec4(bVec b);

bVec5 bVec5();

bVec5 bVec5(boolean b);

bVec5 bVec5(boolean a, boolean b, boolean c, boolean d, boolean e);

bVec5 bVec5(boolean [] array);

bVec5 bVec5(bVec b);

bVec6 bVec6();

bVec6 bVec6(boolean b);

bVec6 bVec6(boolean a, boolean b, boolean c, boolean d, boolean e, boolean f);

bVec6 bVec6(boolean [] array);

bVec6 bVec6(bVec b);










Return a new iVec
--
iVec2 iVec2();

iVec2 iVec2(int v);

iVec2 iVec2(int x, int y);

iVec2 iVec2(int [] array);

iVec2 iVec2(iVec p);

iVec3 iVec3();

iVec3 iVec3(int v);

iVec3 iVec3(int x, int y, int z);

iVec3 iVec3(int [] array);

iVec3 iVec3(iVec p);

iVec4 iVec4();

iVec4 iVec4(int v);

iVec4 iVec4(int x, int y, int z, int w);

iVec4 iVec4(int [] array);

iVec4 iVec4(iVec p);

iVec5 iVec5();

iVec5 iVec5(int v);

iVec5 iVec5(int a, int b, int c, int d, int e);

iVec5 iVec5(int [] array);

iVec5 iVec5(iVec p);

iVec6 iVec6();

iVec6 iVec6(int v);

iVec6 iVec6(int a, int b, int c, int d, int e, int f);

iVec6 iVec6(int [] array);

iVec6 iVec6(iVec p);










Return a new Vec
--
Vec2 Vec2();

Vec2 Vec2(float x, float y);

Vec2 Vec2(float [] array);

Vec2 Vec2(int [] array);

Vec2 Vec2(float v);

Vec2 Vec2(PVector p);

Vec2 Vec2(Vec p);

Vec2 Vec2(iVec p);

Vec3 Vec3();

Vec3 Vec3(float x, float y, float z);

Vec3 Vec3(float [] array);

Vec3 Vec3(int [] array);

Vec3 Vec3(float v);

Vec3 Vec3(PVector p);

Vec3 Vec3(Vec p);

Vec3 Vec3(iVec p);

Vec4 Vec4();

Vec4 Vec4(float x, float y, float z, float w);

Vec4 Vec4(float [] array);

Vec4 Vec4(int [] array);

Vec4 Vec4(float v);

Vec4 Vec4(PVector p);

Vec4 Vec4(Vec p);

Vec4 Vec4(iVec p);

Vec5 Vec5();

Vec5 Vec5(float a, float b, float c, float d, float e);

Vec5 Vec5(float [] array);

Vec5 Vec5(int [] array);

Vec5 Vec5(float v);

Vec5 Vec5(PVector p);

Vec5 Vec5(Vec p);

Vec5 Vec5(iVec p);

Vec6 Vec6();

Vec6 Vec6(float a, float b, float c, float d, float e, float f);

Vec6 Vec6(float [] array);

Vec6 Vec6(int [] array);

Vec6 Vec6(float v);

Vec6 Vec6(PVector p);

Vec6 Vec6(Vec p);

Vec6 Vec6(iVec p);





Return a new random range Vec 
@see Vector class guide for more detail
--
Vec2 Vec2(String s, int x, int y);

Vec2 Vec2(String s, int a, int b, int c, int d);

Vec2 Vec2(String s, int v);

Vec3 Vec3(String s, int x, int y, int z);

Vec3 Vec3(String s, int a, int b, int c, int d, int e, int f);

Vec3 Vec3(String s, int v);

Vec4 Vec4(String s, int x, int y, int z, int w);

Vec4 Vec4(String s, int a, int b, int c, int d, int e, int f, int g, int h);

Vec4 Vec4(String s, int v);

Vec5 Vec5(String s, int a, int b, int c, int d, int e);

Vec5 Vec5(String s, int a, int b, int c, int d, int e, int f, int g, int h, int i, int j);

Vec5 Vec5(String s, int v);

Vec6 Vec6(String s, int a, int b, int c, int d, int e, int f);

Vec6 Vec6(String s, int a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l);

Vec6 Vec6(String s, int v);






