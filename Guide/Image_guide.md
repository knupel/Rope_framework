*IMAGE GUIDE
2015–2018

Rope – Romanesco Processing Environment

All the methods similare or closer of Processing is writing in 'camelCase' the really Rope methods are write with '_underscore_' !


*PATTERN GENERATOR

PGraphics pattern_noise(int witdh, int height, float... inc_color_arg);
>arg int  width and int height define of your pattern
>arg float array inc_color_arg define the incrementation of each color arg, must between 1 and 4
if the array have length : 1 black and white / 2 black and white + alpha / 3 color / 4 color + alpha.
for the case the pattern is black and white the maximum value to generate is g.colorModeZ




*LAYER PGraphics

void init_layer(int x, int y, String type);
>create the PGraphics layer
>parameters 
float x is the width
float y is the height
String type is the rendering P3D, P2D, JAVAFX...

void begin_layer();
>put this method at the top of your method, often is the draw to start recording

void end_layer();
>put this method at the bottom of your method, often is the draw to stop recording

PGraphics get_layer();
>return PGraphics layers






*CANVAS

main
--
void new_canvas(int num) ;


void create_canvas(int w, int h, int type);
>you can use this method when you create only one canvas, if you do that you don't need to use the method void new_canvas()

void create_canvas(int w, int h, int type, int which) ;

int canvas_size();
>retunr the quantity of canvas available

void select_canvas(int which_one);

void clean_canvas(int which_canvas);
>make the canvas blank

void clean_canvas(int which_canvas, int colour);
>make the canvas to your colour choice

PImage get_canvas(int which) ;

PImage get_canvas() ;

int get_canvas_id() ;

void update_canvas(PImage img) ;

void update_canvas(PImage img, int which_one);


canvas effect
--
void alpha_canvas(int target_canvas, float change);
>in target, to select on which canvas where the alpha is modified
>float change, value add to the alpha.


canvas show
--
void set_show() ;

void show_canvas(int num) ;

iVec2 get_offset_canvas() ;
>return the offset of canvas when there is a fullscreen mode

int get_offset_canvas_x() ;
>return the offset of canvas when there is a fullscreen mode

int get_offset_canvas_y() ;
>return the offset of canvas when there is a fullscreen mode




















*IMAGE

METHOD RESIZE PImage
--
void image_resize(PImage src);
>resize Pimage to window sketch size proportionaly

void image_resize(PImage src, boolean fullfit);
>resize Pimage to window sketch size proportionaly

void image_resize(PImage src, PGraphics pg, boolean fullfit);
>resize Pimage to PGraphics size proportionaly

>Parameters 
PImage src : the image targeting
boolean fulfit : if it's false, only one part of image is consider to fit, the result is a fullscreen picture, but not all the image is display, if it's true all the image is resizing.
PGraphics pg: it's your canvas where your want fit.


METHOD COPY WINDOW
--
PImage image_copy_window(PImage src, int where) 
>return a crop PImage display in size window sketch
>int where can be used with CENTER, TOP, LEFT, RIGHT and BOTTOM constant

PImage image_copy_window(PImage src, PGraphics pg, int where);
>return a crop PImage from the PGraphcics size
>int where can be used with CENTER, TOP, LEFT, RIGHT and BOTTOM constant


METHOD DISPLAY PImage
--
void image(PImage img);
>display image in coord 0,0

void image(PImage img, int what);
> if param int what == CENTER || what == TOP || what == BOTTOM || what ==LEFT || what == RIGHT
the img take this pecific position
> if param what == FIT || what == SCREEN || what == PORTRAIT || what == LANDSCAPE
> PImage img is centered and fitting in accordance

void image(PImage img, float coor);
>display img with 'x' and 'y' with coor value


void image(PImage img, iVec pos);

void image(PImage img, iVec pos, iVec2 size);

void image(PImage img, Vec pos);

void image(PImage img, Vec pos, Vec2 size);

Effect
--
PImage reverse(PImage img) ;

PImage mirror(PImage img);

PImage paste(PImage img, int entry, int [] array_pix, boolean verticale_is) ;
>paste array int to a specific entry in the pixels array of your image
>PImage img: is your final imge that be rework
>int entry, it's pixel rank where the paste can begin
>int[] array_pix, is the length of pixel must be copied
>boolean vertical_is: give the direction to display the pixel, horizontal or vertical.












*CLASS IMAGE MANAGER

class ROPImage_Manager;
>This little class giv you a possibility to make a dynamic bank image



method
--
The name used for the loadImage, it's this one without the path and the extension, only the file name.

void load(String... img_src_path);
>here path all the images path you need !

void select(int which_one);
>select image can be used for current image

void select(String which_target_name);
>select image can be used for current image

int size();
>return the length of the library

void clear()
>clear the library

ArrayList<ROPImage> list();
> return the list of component ROPImage

void add(PImage pg)
>add PImage or PGraphics to library

void add(PImage pg, String name)
>add PImage or PGraphics to library

void set(PImage pg, int target) 
>replane an image by an other one

void set(PImage pg, String target_name) 
>replane an image by an other one

int get_rank(String target);
> return the rank of the target

String get_name();
> return String name of the current ROPImage

String get_name(int target);
> return the String name of the target ROPImage

PImage get();
>return the current image

PImage get(int target);
>return a specific image from the bank image

PImage get(String target_name);
>return a specific image from the bank image




















































*BACKGROUND

Normalize background, with those methods use value between 0 and 1
--
void background_norm(float grey, float alpha) ;

void background_norm(float grey) ;

void background_norm(float red, float green, float blue) ;

void background_norm(float red, float green, float blue, float alpha) ;

void background_norm(Vec2 grey_alpha) ;

void background_norm(Vec3 red_green_blue) ;

void background_norm(Vec4 red_green_blue_alpha) ;


Normal value, use values from your color environment
--

void background_rope(int colour);

void background_rope(int colour, float alpha);

void background_rope(float grey);

void background_rope(float grey, float alpha);

void background_rope(float red, float green, float blue, float alpha) ;

void background_rope(float red, float green, float blue) ;

void background_rope(Vec2 grey_alpha) ;

void background_rope(Vec3 red_green_blue) ;

void background_rope(Vec4 red_green_blue_alpha) ;


















*SCREEN / WINDOW

void set_window(int px, int py, int sx, int sy);

void set_window(int px, int py, int sx, int sy, int target);

void set_window(iVec2 pos, iVec2 size);

void set_window(iVec2 pos, iVec2 size, int target);

void set_window(iVec2 pos, iVec2 size, iVec2 pos_screen);
>to move and set window size, very helpfull with fullscreen for example.


iVec2 screen_size() ;
>return the width and the height of current display

iVec2 screen_size(int target_screen)
>return the width and the height of target display, if this one is available, if it's not the method return the size of the current display


iVec2 screen_location() ;
>return location x and y of current screen

iVec2 screen_location(int target_screen)
>return location x, y of target screeny, if no one is available, if it's not the method return the location of the current screen


int get_screen_num();
>return the number of screen available
Processing renderer

iVec2 get_sketch_location()
>return the iVec2 of your sketch location

int get_sketch_location_x() {
>return your sketch location in x

int get_sketch_location_y()
>return your sketch location in y


String get_renderer();
>return String name of the current rendering mode

String get_renderer(PGraphics pg) ;
>return String name of the rendering mode

boolean renderer_P3D() ;
>retrun boolean true if the mode is P3D, return false with other renderers.















