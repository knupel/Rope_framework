*IMAGE GUIDE
2015–2019

Rope – Romanesco Processing Environment

All the methods similare or closer of Processing is writing in 'camelCase' the really Rope methods are write with '_underscore_' !


*ENTRY for PIXEL ARRAY

return an entry pixel in the range of the array pixel of the current PGraphics by default is 'g'.

boolean constrain_is an be use to constrain the rank between '0' and the pixel array length, or to return on the begin or end of length array pixel.


int entry(ivec2 pos, boolean constrain_is);

int entry(vec2 pos, boolean constrain_is);

int entry(float x, float y, boolean constrain_is);

int entry(int rank, boolean constrain_is);

int entry(PGraphics pg, ivec2 pos, boolean constrain_is);

int entry(PGraphics pg, vec2 pos, boolean constrain_is);

int entry(PGraphics pg, float x, float y, boolean constrain_is);

int entry(PGraphics pg, int rank, boolean constrain_is);




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

ivec2 get_offset_canvas() ;
>return the offset of canvas when there is a fullscreen mode

int get_offset_canvas_x() ;
>return the offset of canvas when there is a fullscreen mode

int get_offset_canvas_y() ;
>return the offset of canvas when there is a fullscreen mode




















*IMAGE

METHOD RESIZE PImage
--
void image_resize(PImage src);
>resize PImage to window sketch size proportionaly

void image_resize(PImage src, boolean fullfit);
>resize PImage to window sketch size proportionaly

void image_resize(PImage src, PGraphics pg, boolean fullfit);
>resize PImage to PGraphics size proportionaly

void image_resize(PImage src, int target_width, int target_height, boolean fullfit);
>resize PImage to PGraphics size proportionaly

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


void image(PImage img, ivec pos);

void image(PImage img, ivec pos, ivec2 size);

void image(PImage img, vec pos);

void image(PImage img, vec pos, vec2 size);

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

class R_Image_Manager;
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



void add(PImage pg)
>add PImage or PGraphics to library

void add(PImage pg, String name)
>add PImage or PGraphics to library

void set(PImage pg, int target) 
>replane an image by an other one

void set(PImage pg, String target_name) 
>replane an image by an other one


get
--
ArrayList<R_Image> list();
>return the list of component ROPImage

R_Image [] get() 
>return all PImage available from the library list

PImage get_current();
>return the current PImage is there is, if not return the first PImage from the list

PImage get(int target);
>return a specific image from the bank image

PImage get(String target_name);
>return a specific image from the bank image

R_Image rand();
>return a random R_image from the library list


int get_rank(String target);
> return the rank of the target

String get_current name();
> return String name of the current R_Image


String get_name(int target);
> return the String name of the target R_Image





*CLASS IMAGE


contructor
--
R_Image(String path);

R_Image(PImage img);

R_Image(PImage img, String name, int id);
  
methodes
--
R_Image get();

int get_id() 

String get_name();

PImage get_image();
















































*BACKGROUND

void background(vec4 c);

void background(vec3 c);

void background(vec2 c);

void background(ivec4 c);

void background(ivec3 c);

void background(ivec2 c);

*BACKGROUND IMAGE

method to improve Processing method background(PImage img)
WARNING: only work in P2D or P3D rendering mode
3 mode : CENTER, SCREEN, r.SCALE
the mode SCALE is for set position and scale
the color compoent use RGB colorMode

void background(PImage img, int mode);

void background(PImage img, int mode, float red, float green, float blue);

void background(PImage img, float px, float py, float red, float green, float blue);

void background(PImage img, float px, float py, float scale_x, float red, float green, float blue);

void background(PImage img, float px, float py, float scale_x, float red, float green, float blue, float curtain_position);

void background(PImage img, vec2 pos, vec2 scale, vec3 colour_background, vec4 pos_curtain, int mode);


*BACKGROUND NORM

Normalize background, use value between 0 and 1,
this background work with alpha.

void background_norm(float grey, float alpha);

void background_norm(float grey);

void background_norm(float red, float green, float blue);

void background_norm(float red, float green, float blue, float alpha);

void background_norm(vec2 grey_alpha);

void background_norm(vec3 red_green_blue);

void background_norm(vec4 red_green_blue_alpha);

*BACKGROUND ROPE

this mode supply the alpha problem of classic background

void background_rope(int colour);

void background_rope(int colour, float alpha);

void background_rope(float grey);

void background_rope(float grey, float alpha);

void background_rope(float red, float green, float blue, float alpha);

void background_rope(float red, float green, float blue);

void background_rope(vec2 gray_alpha);

void background_rope(vec3 rgb);

void background_rope(vec4 rgba);


















*SCREEN / WINDOW

void set_window(int px, int py, int sx, int sy);

void set_window(int px, int py, int sx, int sy, int target);

void set_window(ivec2 pos, ivec2 size);

void set_window(ivec2 pos, ivec2 size, int target);

void set_window(ivec2 pos, ivec2 size, ivec2 pos_screen);
>to move and set window size, very helpfull with fullscreen for example.


ivec2 screen_size();
>return the width and the height of current display

ivec2 screen_size(int target_screen)
>return the width and the height of target display, if this one is available, if it's not the method return the size of the current display


ivec2 screen_location() ;
>return location x and y of current screen

ivec2 screen_location(int target_screen)
>return location x, y of target screeny, if no one is available, if it's not the method return the location of the current screen


int get_screen_num();
>return the number of screen available
Processing renderer

ivec2 get_sketch_location()
>return the ivec2 of your sketch location

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

String graphics_is(Object obj);
return PIMage is the object is a Movie, Video or PImage
return PGraphics is the object is a PGraphics, PGraphics2D, PGraphics3D, PGraphicsFX2D
in the other case return null;















