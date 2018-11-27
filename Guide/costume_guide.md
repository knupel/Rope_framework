RPE Costume 
v 1.2.0
2016-2018
--
Mini library give a bestiary shape, in 2D or 3D

When use pass a float angle, that must be in radians -PI to PI

Ypu can pas the position and size with the class Vec,
Vec2 or Vec3, if you'r are in Processing 2D and use Vec3, no matter Processing understand and only use the component 'x' and 'y' of your Vec

--
To choice the shape use method costume_rope()
to change the aspect like fill, stroke or strokeWeight use aspect_rope();
--











Method shape
--
when the targeting costume is a pixel few possibility is no more available to use, like move in 3D, change thickness...because for pixel the methode set(x,y,c) from Processing is used, see Processing method.

costume(Vec pos, Vec size, float angle, Vec3 dir, Costume costume);

void costume(Vec pos, Vec size, Vec3 dir, Costume costume);

void costume(Vec pos, int size, int Costume costume);

void costume(Vec pos, Vec size, int Costume costume)

method by id costume
--
costume(Vec pos, Vec size, float angle, Vec3 dir, int which_costume);

void costume(Vec pos, Vec size, Vec3 dir, int which_costume);

void costume(Vec pos, int size, int which_costume);

void costume(Vec pos, Vec size, int which_costume);

Method String
--
void costume(Vec pos, int size, float angle, String sentence);

void costume(Vec2pos, Vec size, float angle, String sentence);

void costume(Vec pos, int size, String sentence);

void costume(Vec pos, Vec size, String sentence);










List
--
void print_list_costume() ;
> return all the Integer constant ID, the name and the type of renderer.












Aspect
--
void aspect_is(boolean fill_is, boolean stroke_is) ;
>used before aspect_rope() to display fill or stroke

void aspect(int fill, int stroke, float strokeWeight) ;

void aspect(int fill, int stroke, float strokeWeight, int costume) ;
>Note, in case where the costume POINT_ROPE is used, it's not the stroke is used but the fill component.

void aspect(Vec fill, Vec stroke, float strokeWeight) ;
>can be used with Vec2, Vec3 or Vec4

void aspect(Vec fill, Vec stroke, float strokeWeight, int costume) ;
>can be used with Vec2, Vec3 or Vec4

Text
--
void costume_text(String s) ;
>use to set the text

Costume available
--
costumes_size() ;
>return the quantity of costumes available.


ID costume
--
int get_costume(int target)
>return ID of the costume at this rank, if this one don't exist, that return 0. 0 is ID of 'point'


COSTUME LIST
--
@see file costume_list.txt



ASPECT
--
>aspect method classic

void aspect_rope(int fill, int stroke, float thickness)
>manage the fill, stroke and strokeWeight

void aspect_rope(Vec4 fill, Vec4 stroke, float thickness)
>manage the fill, stroke and strokeWeight

>aspect work with the mini library costume for the id catalogue

void aspect_rope(int fill, int stroke, float thickness, int id_costume)
>manage the fill, stroke and strokeWeight

void aspect_rope(Vec4 fill, Vec4 stroke, float thickness, int id_costume)
>manage the fill, stroke and strokeWeight

float get_fill_rope();
>return the fill component

float get_stroke_rope();
>return the stroke component

float get_thickness_rope();
>return the strokeWeight / thickness component





RATIO SIZE
--
void set_ratio_costume_size(value);
>it's opssible to set the ratio size, to change multiply the size of all elements,
actullly available only for the CROSS_BOX_2_ROPE et CROSS_BOX_3_ROPE





SHAPE CATALOGUE
method and class
--
--
STAR
--
void star(Vec pos, int size_XY, int summits) ;

void star(Vec pos, int size_XY, int summits, float angle) ;

void star(Vec pos, int size_XY, int summits, float angle, float... ratio) ;

void star(Vec pos, Vec2 size, int summits) ;

void star(Vec pos, Vec2 size, int summits, float angle) ;

void star(Vec pos, Vec2 size, int summits, float angle, float... ratio) ;

void star(Vec pos, Vec2 size, int summits, float angle, float[] ratio) ;
--
star argument
--
>Pos, you can send a 'Vec2' or 'Vec3'
>Size, you can use 'int' or 'Vec2', in the 'int' case the value is the same for the width and height
>Summits is the quantity of the higher summits of your star, the num of star points is summits * 2
>angle, in the rotation angle of the star in radians.
>the ratio is the 'raidus' or 'size' multiplicator to make difference on the higher or lower points, note you can use a sequence to make something weird like a compass : 

star(pos, size, summits, 2., .5, 1., .5, 1., .5) ;

CROSS
--
void cross_rect(iVec2 pos, int thickness, int radius);

void cross_box_2(Vec2 size,float ratio);

void cross_box_3(Vec3 size,float ratio);

VIRUS
--
void virus(Vec pos, Vec size, int node, int num) ;

void virus(Vec pos, Vec size, int node, int num, float angle)  ;

void virus(Vec pos, Vec size, int node, int num, int speed) ;

void virus(Vec pos, Vec size, int node, int num, int speed_mutation, float angle, int close) ;

