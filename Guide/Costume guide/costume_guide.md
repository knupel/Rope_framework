*COSTUME

v 1.2.0
2016-2019
--
Mini library give a bestiary shape, in 2D or 3D

When use pass a float angle, that must be in radians -PI to PI

Ypu can pas the position and size with the class vec,
vec2 or vec3, if you'r are in Processing 2D and use vec3, no matter Processing understand and only use the component 'x' and 'y' of your vec

--
To choice the shape use method costume_rope()
to change the aspect like fill, stroke or strokeWeight use aspect_rope();
--


*CLASS


*PRIMITIVE

Create a regular polygon with "n" summits
--
Primitive primtive = new Primtive()

draw
--
draw do void calc(), plus void show();

void draw(float diam, int summits);

void draw(vec pos, float diam, int summits);

void draw(vec pos, float diam, int summits, float angle);

void draw(vec pos, float diam, int summits, vec2 polar_coord);

void draw(vec pos, float diam, int summits, float orientation, vec2 polar_coord);


calc
--
compute the points

void calc(float diam, int summits);

void calc(vec pos, float diam, int summits);

void calc(vec pos, float diam, int summits, float angle);

void calc(vec pos, float diam, int summits, vec2 polar_coord);

void calc(vec pos, float diam, int summits, float orientation, vec2 polar_coord);

show
--
void show();

get
--
vec3 [] get_normal();
> return the normal position of the primitive

vec3 get_pos();
> return the real position of the primitive

vec2 get_dir();
> return the polar coord, don't work for the moment

float get_diam();

float get_radius();

int get_summits();

float get_angle();


*STAR

documentation comming before 2028



*HOUSE

documentation comming before 2028



*VIRUS

documentation comming before 2028




























*METHOD


$*main

when the targeting costume is a pixel few possibility is no more available to use, like move in 3D, change thickness...because for pixel the methode set(x,y,c) from Processing is used, see Processing method.

void costume(float x, float y, float sx, float sy, Costume costume);

void costume(float x, float y, float z, float sx, float sy, Costume costume);

void costume(float x, float y, float z, float sx, float sy, float sz, Costume costume);

void costume(vec pos, vec size, float angle, vec3 dir, Costume costume);

void costume(vec pos, vec size, vec3 dir, Costume costume);

void costume(vec pos, int size, int Costume costume);

void costume(vec pos, vec size, int Costume costume)

*method by id costume

void costume(float x, float y, float sx, float sy, int which);

void costume(float x, float y, float z, float sx, float sy, int which);

void costume(float x, float y, float z, float sx, float sy, float sz, int which);

costume(vec pos, vec size, float angle, vec3 dir, int which);

void costume(vec pos, vec size, vec3 dir, int which);

void costume(vec pos, int size, int which);

void costume(vec pos, vec size, int which);

*Method String

void costume(float x, float y, float sx, float sy, String sentence);

void costume(float x, float y, float z, float sx, float sy, String sentence);

void costume(float x, float y, float z, float sx, float sy, float sz, String sentence);

void costume(vec pos, int size, float angle, String sentence);

void costume(vec2pos, vec size, float angle, String sentence);

void costume(vec pos, int size, String sentence);

void costume(vec pos, vec size, String sentence);







*List

void print_list_costume() ;
> return all the Integer constant ID, the name and the type of renderer.








*Aspect

void aspect_is(boolean fill_is, boolean stroke_is) ;
>used before aspect_rope() to display fill or stroke

void aspect(int fill, int stroke, float strokeWeight) ;

void aspect(int fill, int stroke, float strokeWeight, int costume) ;
>Note, in case where the costume POINT_ROPE is used, it's not the stroke is used but the fill component.

void aspect(vec fill, vec stroke, float strokeWeight) ;
>can be used with vec2, vec3 or vec4

void aspect(vec fill, vec stroke, float strokeWeight, int costume) ;
>can be used with vec2, vec3 or vec4

*Text

void costume_text(String s) ;
>use to set the text

*Costume available

costumes_size() ;
>return the quantity of costumes available.


*ID costume

int get_costume(int target)
>return ID of the costume at this rank, if this one don't exist, that return 0. 0 is ID of 'point'


COSTUME LIST
--
@see file costume_list.txt
























*ASPECT

>aspect method classic

void aspect_rope(int fill, int stroke, float thickness)
>manage the fill, stroke and strokeWeight

void aspect_rope(vec4 fill, vec4 stroke, float thickness)
>manage the fill, stroke and strokeWeight

>aspect work with the mini library costume for the id catalogue

void aspect_rope(int fill, int stroke, float thickness, int id_costume)
>manage the fill, stroke and strokeWeight

void aspect_rope(vec4 fill, vec4 stroke, float thickness, int id_costume)
>manage the fill, stroke and strokeWeight

float get_fill_rope();
>return the fill component

float get_stroke_rope();
>return the stroke component

float get_thickness_rope();
>return the strokeWeight / thickness component





*RATIO SIZE

void set_ratio_costume_size(value);
>it's opssible to set the ratio size, to change multiply the size of all elements,
actullly available only for the CROSS_BOX_2_ROPE et CROSS_BOX_3_ROPE










*SHAPE CATALOGUE


STAR
--
void star(vec pos, int size_XY, int summits) ;

void star(vec pos, int size_XY, int summits, float angle) ;

void star(vec pos, int size_XY, int summits, float angle, float... ratio) ;

void star(vec pos, vec2 size, int summits) ;

void star(vec pos, vec2 size, int summits, float angle) ;

void star(vec pos, vec2 size, int summits, float angle, float... ratio) ;

void star(vec pos, vec2 size, int summits, float angle, float[] ratio) ;
--
star argument
--
>Pos, you can send a 'vec2' or 'vec3'
>Size, you can use 'int' or 'vec2', in the 'int' case the value is the same for the width and height
>Summits is the quantity of the higher summits of your star, the num of star points is summits * 2
>angle, in the rotation angle of the star in radians.
>the ratio is the 'raidus' or 'size' multiplicator to make difference on the higher or lower points, note you can use a sequence to make something weird like a compass : 

star(pos, size, summits, 2., .5, 1., .5, 1., .5) ;

CROSS
--
void cross_rect(ivec2 pos, int thickness, int radius);

void cross_box_2(vec2 size,float ratio);

void cross_box_3(vec3 size,float ratio);

VIRUS
--
void virus(vec pos, vec size, int node, int num) ;

void virus(vec pos, vec size, int node, int num, float angle)  ;

void virus(vec pos, vec size, int node, int num, int speed) ;

void virus(vec pos, vec size, int node, int num, int speed_mutation, float angle, int close) ;


