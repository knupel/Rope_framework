
Class ROPE_svg 1.2.5
--
>author Stan le Punk
>see other Processing work on https://github.com/StanLepunK
>2016-2016
>inspirated from Processing PShape code


HEY MAN !
--
Illusttator CC : Rope SVG support tag style SVG version 2, this tag is used by Illustrator CC
--
Text: It's possible to use text in your SVG, but only for the colour, font and size.. no other modification will be used by Processing
--


FIRST, build your SVG vertex
--
create your object
--
ROPE_svg svg ;

CONSTRUCTOR
--
String path = "pirate_couleur.svg" ;
>to load your object

String name = "pirate" ;
>name use to create a specific folder to stock the SVG brick

svg = new ROPE_svg(PApplet p5, String path, String name) ;
ROPE_svg(PApplet p5, String path)



void build() ;
>create your shape, the adress to load the orginal svg is equal to place where the brick is saved

void build(String path_import, String path_brick) ;
>use this method if the address is different between the load and the saved



SET SVG
--
void mode(int mode)
>choice between CENTER or CORNER


SHOW YOUR SVG
--

CHANGE
--
Permanente change
--

svg.add_def(int ID, Vec3 [] value)
> You can add value to your original list of point, this list of value is add in the order to the original. This effect is permanent.
For the shape with path or polygone all the points list will be change, pro the primitive ellipse, circle and rect it's position will be change.


Temporary change 
--
method, place before svg.draw() method
--
void pos(float x) ;

void pos(Vec2 pos) ;

void pos(float x, float y) ;

void pos(Vec3 pos) ;

void pos(float x, float y, float z) ;

> used to set the position of your PShape
--

void scaling(float x) ;

void scaling(Vec2 scale) ;

void scaling(float x, float y) ;

void scaling(Vec3 scale) ;

void scaling(float x, float y, float z) ;

> used to scale your shape, the value 1. is a full size
--
void jitter(float x) ;

void jitter(Vec2 jitter) ;

void jitter(int x, int y) ;

void jitter(Vec3 jitter) ;

void jitter(int x, int y, int z) ;

> used to add a jitting effect on your point


ASPECT
--
void original_style(boolean fill_original, boolean stroke_original) ;

void original_fill(boolean fill_original) ;

svg.original_stroke(boolean fill_original) ;
> to enable or disable the original aspect fill and stroke

Fill of your brick
--
void noFill() ;

void fill(int color); 

void fill(float grey); 

void fill(float grey, float alpha); 

void fill(float x, float y, float z); 

void fill(float x, float y, float z, float alpha); 

void fill(Vec2 c) ; 
> field grey & alpha

void fill(Vec3 c) ;
> field red, blue and green

void fill(Vec4 c) ; 
> field red, blue, green and alpha

Stroke setting of your brick
--
void noStroke() ;

void stroke(int color); 

void stroke(float grey) ; 

void stroke(float grey, float alpha) ; 

void stroke(float x, float y, float z) ; 

void stroke(float x, float y, float z, float alpha) ; 

void stroke(Vec2 c) ; 
> field grey & alpha

void stroke(Vec3 c) ; 
> field red, blue and green

void stroke(Vec4 c) ; 
> field red, blue, green and alpha


StrokeWeight setting of your brick
--
void strokeWeight(float x) ; 



Opacity
--
void opacity(float a_fill, float a_stroke) ;

void opacityStroke(float a) ;

void opacityFill(float a) ;






Factor 'Normalize' color value
--
> use value from '0' to '1' is better !

void fill_factor(float x, float y, float z, float a) ; 

void fill_factor(Vec4 f) ; 

void stroke_factor(float x, float y, float z, float a) ; 

void stroke_factor(Vec4 f) ; 


DISPLAY
--
void draw () ;
> full display

void draw (int ID_brick) ;
> choice a brick in the list of them, each brick is a part of your svg, the smallest shape as possible.

void draw (String layer_name) ;
> display all the brick in the layer groupe names, don't use number or special charactere when you name your layer in your svg editor.








By group or layer
--
Whith the part SVG, you can use the method start() and end() to use the all the method change on the bricks of your choice.

svg.start() ;
> note : the method start is not an obligation, because the methods change and original_style active the modification, but only for the next brick, if you want keep the modification for more brick you must use 'start()' and 'stop()'


svg.stop() ;









INFO
--

int Info
--
svg.num_brick()
> return the num of elements of your SVG



Float info
--
svg.width() ;

svg.width(int target) ;
> return the width of your SVG, if this one is be loaded

svg.height_SVG() ;

svg.height_SVG(int target) ;
> return the height of your SVG, if this one is be loaded

svg.canvas_SVG() ;

svg.canvas_SVG(int target) ;
> return the width and the height of your SVG in Vec2, if this one is be loaded


String info
--
svg.name() ; 
> return String with the name given in your declaration.

svg.name_brick() ; 

svg.family_brick() ;

svg.kind_brick() ;
> return String list


svg.name_brick(ID)) ;

svg.family_brick(ID)) ;

svg.kind_brick(ID)) ;
> return String


Vec3 list point of interest, like position or vertex coord
--
svg.list_svg_Vec(ID)) ;
> return array [] Vec3 

svg.list_svg_PVector(ID)) ;
> return array [] PVector 



