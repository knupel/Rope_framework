*COSTUME METHODE

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









*METHOD


*main

when the targeting costume is a pixel few possibility is no more available to use, like move in 3D, change thickness...because for pixel the methode set(x,y,c) from Processing is used, see Processing method.

void costume(float x, float y, float sx, float sy, Costume costume);

void costume(float x, float y, float z, float sx, float sy, Costume costume);

void costume(float x, float y, float z, float sx, float sy, float sz, Costume costume);

void costume(vec pos, vec size, float angle, vec3 dir, Costume costume);

void costume(vec pos, vec size, vec3 dir, Costume costume);

void costume(vec pos, int size, int Costume costume);

void costume(vec pos, vec size, int Costume costume);

// with other PGraphics
void costume(float x, float y, float sx, float sy, Costume costume, PGraphics pg);

void costume(float x, float y, float z, float sx, float sy, Costume costume, PGraphics pg);

void costume(float x, float y, float z, float sx, float sy, float sz, Costume costume, PGraphics pg);

void costume(vec pos, vec size, float angle, vec3 dir, Costume costume, PGraphics pg);

void costume(vec pos, vec size, vec3 dir, Costume costume, PGraphics pg);

void costume(vec pos, int size, int Costume costume, PGraphics pg);

void costume(vec pos, vec size, int Costume costume, PGraphics pg);

*method by id costume

void costume(float x, float y, float sx, float sy, int which);

void costume(float x, float y, float z, float sx, float sy, int which);

void costume(float x, float y, float z, float sx, float sy, float sz, int which);

void costume(vec pos, vec size, float angle, vec3 dir, int which);

void costume(vec pos, vec size, vec3 dir, int which);

void costume(vec pos, int size, int which);

void costume(vec pos, vec size, int which);

// with other PGraphics
void costume(float x, float y, float sx, float sy, int which, PGraphics pg);

void costume(float x, float y, float z, float sx, float sy, int which, PGraphics pg);

void costume(float x, float y, float z, float sx, float sy, float sz, int which, PGraphics pg);

void costume(vec pos, vec size, float angle, vec3 dir, int which, PGraphics pg);

void costume(vec pos, vec size, vec3 dir, int which, PGraphics pg);

void costume(vec pos, int size, int which, PGraphics pg);

void costume(vec pos, vec size, int which, PGraphics pg);

*Method String

void costume(float x, float y, float sx, float sy, String sentence);

void costume(float x, float y, float z, float sx, float sy, String sentence);

void costume(float x, float y, float z, float sx, float sy, float sz, String sentence);

void costume(vec pos, int size, float angle, String sentence);

void costume(vec2pos, vec size, float angle, String sentence);

void costume(vec pos, int size, String sentence);

void costume(vec pos, vec size, String sentence);

// with other PGraphics
void costume(float x, float y, float sx, float sy, String sentence, PGraphics pg);

void costume(float x, float y, float z, float sx, float sy, String sentence, PGraphics pg);

void costume(float x, float y, float z, float sx, float sy, float sz, String sentence, PGraphics pg);

void costume(vec pos, int size, float angle, String sentence, PGraphics pg);

void costume(vec2pos, vec size, float angle, String sentence, PGraphics pg);

void costume(vec pos, int size, String sentence, PGraphics pg);

void costume(vec pos, vec size, String sentence, PGraphics pg);







*List

void print_list_costume() ;
> return all the Integer constant ID, the name and the type of renderer.










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

void aspect_is(boolean fill_is, boolean stroke_is, boolean alpha_is);

void init_bool_aspect();

void aspect(int fill, int stroke, float thickness);

void aspect(int fill, int stroke, float thickness, PGraphics other);

void aspect(vec fill, vec stroke, float thickness);

void aspect(vec fill, vec stroke, float thickness, PGraphics other);


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
void star(vec position, vec size);

void star(vec position, vec size, PGraphics other);

void star_3D_is(boolean is_3D);

void star_summits(int summits);

void star_angle(float angle);

void star_ratio(float... ratio);


star argument
--
>Pos, you can send a 'vec2' or 'vec3'
>Size, you can use 'int' or 'vec2', in the 'int' case the value is the same for the width and height
>Summits is the quantity of the higher summits of your star, the num of star points is summits * 2
>angle, in the rotation angle of the star in radians.
>the ratio is the 'raidus' or 'size' multiplicator to make difference on the higher or lower points, note you can use a sequence to make something weird like a compass : 



CROSS
--
void cross_rect(ivec2 pos, int thickness, int radius);

void cross_box_2(vec2 size,float ratio);

void cross_box_3(vec3 size,float ratio);

void cross_rect(ivec2 pos, int thickness, int radius, PGraphics other);

void cross_box_2(vec2 size,float ratio, PGraphics other);

void cross_box_3(vec3 size,float ratio, PGraphics other);


VIRUS
--
void virus(vec pos, vec size, int node, int num) ;

void virus(vec pos, vec size, int node, int num, float angle)  ;

void virus(vec pos, vec size, int node, int num, int speed) ;

void virus(vec pos, vec size, int node, int num, int speed_mutation, float angle, int close) ;



FLOWER
--
void flower(vec pos, int diam, int petals_num);

void flower(vec pos, int diam, int petals_num, PGraphics other);

void flower_wind(vec2 petal_left, float strength_left, vec2 petal_right, float strength_right);

void flower_static(vec2 petal_left, float strength_left, vec2 petal_right, float strength_right);


