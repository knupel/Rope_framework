UTILS ROPE
2015–2018
--
Rope – Romanesco Processing Environment

All the methods similare or closer of Processing is writing in 'camelCase' the really Rope methods are write with '_underscore_' !






LAYER PGraphics
--
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










PRINT CONSTANTS
--
void print_constants_rope();

void print_constants_processing();

public void print_constants();












CANVAS
--
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














SELECT FOLDER and INPUT
--
INPUT
--
void select_input();
>Open window to select input

void select_input(String message);
>Open window to select input
>String message is the sentence write on your window when the method is used

boolean input_selected_is();
>return true if a input is selected

void reset_input_selection();
>make the input_selected be "false"

String input();
>return the String path of the last input selected


FOLDER
--
void select_folder();
>Open window to select folder

void select_folder(String message);
>Open window to select folder
>String message is the sentence write on your window when the method is used

boolean folder_selected_is();
>return true if a folder is selected

void reset_folder_selection();
>make the folder_selected be "false"

String folder();
>return the String path of the last folder selected



FOLDER and INPUT
--
void explore_folder(String path, String... extension);

void explore_folder(String path, boolean sub_folder, String... extension);
>this method create a list a file of a class File
>You need to give the path of the main folder or input selected
> With the boolean sub_folder you can ask to explorer the subfolder or not, only with the method void select_folder()
> and you can add each extension you want add in your list, like "jpg" and "wave" for example.

ArrayList<File> get_files()
> return the list of file selected with the method explore_folder();

String [] get_files_sort()
> return list of absolutePath sort from down to up;





























IMAGE
--
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




METHOD FILTER SHADER
--
void shader_folder_filter(String path);
>to change the default path of shader

Gaussian blur
--
void blur(PImage tex, float intensity);

void blur(PGraphics p, PImage tex, float intensity);


Multiply
--
void multiply_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void multiply_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void multiply_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void multiply(PImage tex, PImage inc);

void multiply(PImage tex, PImage inc, Vec2 ratio);

void multiply(PImage tex, PImage inc, Vec3 ratio);

void multiply(PImage tex, PImage inc, Vec4 ratio);

void multiply(PImage tex, PImage inc, float... ratio);

void multiply(PGraphics p, PImage tex, PImage inc);

void multiply(PGraphics p, PImage tex, PImage inc, Vec2 ratio);

void multiply(PGraphics p, PImage tex, PImage inc, Vec3 ratio);

void multiply(PGraphics p, PImage tex, PImage inc, Vec4 ratio);

void multiply(PGraphics p, PImage tex, PImage inc, float... ratio);


Overlay
--
void overlay_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void overlay_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void overlay_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void overlay(PImage tex, PImage inc);

void overlay(PImage tex, PImage inc, Vec2 ratio);

void overlay(PImage tex, PImage inc, Vec3 ratio);

void overlay(PImage tex, PImage inc, Vec4 ratio);

void overlay(PImage tex, PImage inc, float... ratio);

void overlay(PGraphics p, PImage tex, PImage inc);

void overlay(PGraphics p, PImage tex, PImage inc, Vec2 ratio);

void overlay(PGraphics p, PImage tex, PImage inc, Vec3 ratio);

void overlay(PGraphics p, PImage tex, PImage inc, Vec4 ratio);

void overlay(PGraphics p, PImage tex, PImage inc, float... ratio);


Blend
--
void blend_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void blend_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void blend_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void blend(PImage tex, PImage inc, float blend, Vec2 ratio);

void blend(PImage tex, PImage inc, float blend, Vec3 ratio);

void blend(PImage tex, PImage inc, float blend, Vec4 ratio);

void blend(PImage tex, PImage inc, float blend, float... ratio);

void blend(PGraphics p, PImage tex, float blend, PImage inc);

void blend(PGraphics p, PImage tex, PImage inc, float blend, Vec2 ratio);

void blend(PGraphics p, PImage tex, PImage inc, float blend, Vec3 ratio);

void blend(PGraphics p, PImage tex, PImage inc, float blend, Vec4 ratio);

void blend(PGraphics p, PImage tex, PImage inc, float blend, float... ratio);


Mix
--
void mix_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void mix_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void mix_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void mix(PImage tex, PImage inc);

void mix(PImage tex, PImage inc, Vec2 ratio);

void mix(PImage tex, PImage inc, Vec3 ratio);

void mix(PImage tex, PImage inc, Vec4 ratio);

void mix(PImage tex, PImage inc, float... ratio);

void mix(PGraphics p, PImage tex, PImage inc);

void mix(PGraphics p, PImage tex, PImage inc, Vec2 ratio);

void mix(PGraphics p, PImage tex, PImage inc, Vec3 ratio);

void mix(PGraphics p, PImage tex, PImage inc, Vec4 ratio);

void mix(PGraphics p, PImage tex, PImage inc, float... ratio);


Level
--
void level_flip(boolean bx, boolean by);
>change the orientation of the image

void level(PImage tex, Vec2 level);

void level(PImage tex, Vec3 level);

void level(PImage tex, Vec4 level);

void level(PImage tex, float... ratio);

void level(PGraphics p, PImage tex, PImage inc);

void level(PGraphics p, PImage tex, Vec2 ratio);

void level(PGraphics p, PImage tex, Vec3 ratio);

void level(PGraphics p, PImage tex, Vec4 ratio);

void level(PGraphics p, PImage tex, float... ratio);






METHOD SAVE LOAD FRAME
--
SAVE FRAME
--
Actually work for 'jpg' and 'bmp'

void saveFrame(String where, String filename, PImage img) ;

void saveFrame(String where, String filename) ;

void saveFrame(String where, String filename, float compression);

void saveFrame(String where, String filename, float compression, PImage img);
>String where is the path where you want save your file, from the sketchPath
>String filenam is the name of your file, don't add the extension
>float compression, in cas you save a jpeg, you can choice the rate compression from '0' to '1'
>PImage if you don't want same all the window you can save PImage.

LOAD FRAME
--
PImage loadImageBMP(String fileName);







CLASS IMAGE MANAGER
--
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






































MISC
--
freeze
--
void freeze();
>method to switch on or off the thread draw of Processing, use it in method don't be stop :), not in the draw obvioulsy.


pixel array
--
int [][] loadPixels_array_2D()
>return 2D array pixel of the window

MOTION
--
inertia
--
void stop_inertia() ;

Inertia with Vec2

Vec2 apply_inertia(Vec2 current_pos, Vec2 my_pos, float braking, float max_speed)  ;

Vec2 inertia(Vec2 current_pos, float braking, float max_speed) ;

Inertia with Vec3

Vec3 apply_inertia(Vec3 current_pos, Vec3 my_pos, float braking, float max_speed) ;

Vec3 inertia(Vec3 current_pos, float braking, float max_speed) ;

>Vec current_pos is use to pass the mouse coord or other coord
>Vec my_pos is use to pass the coord of your item
>float braking is the value to slow item, a value under '1' is good, but it's your choice
>float max speed, is the maximum of pixel possible by frame for your item.





























SCREEN SHOT 0.0.2
--
>Make a shot of your work easily, in PDf or PNG

pdf shot
--
>start_PDF() use at the top of draw() to start the recording.
>stop_PDF() use at the end of draw() to recard the display

To make a shot use the method 'event_PDF()', for instance used in void keyPressed() 

>Note, if you want save the background for your PDF, you must use the method 'background_rope()', it 's almost the same as 'background()' of Processing.


void start_PDF() ;
>Save in default folder, with a default ranking file name.

void start_PDF(String name_file) ;
>Choose a file name for your file

void start_PDF(String path_folder, String name_file) ;
>Choose a folder and file name for yours shots.

void event_PDF() ;
>make true the boolean: give authorization to shot !

void save_PDF() ;
>save your PNG, put this method at the end of list of method must be save

png shot
--
>For the PNG, if you want use a default setting, you don't need to use a method 'start_PNG()'

void start_PNG(String path_folder, String name_file) ;
>Choose a folder and file name for yours shots.

void event_PNG() ;
>Make true the boolean that give autorisation to shot !

void save_PNG() ;
>save your PNG, put this method at the end of list of method must be save













BACKGROUND
--
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







RANDOM
--
>Return random value smooth around the target, like gaussian curve, by default the range around the value is 40%, but it's the extreme case and it's very very rare.

float random_gaussian(float value);

float random_gaussian(float value, float range);
>arg value is your value must be processing
>arg range is use to contrain the gaussian random, by default the range is '.4' who give somethinf 20% up and down your value.



float random_next_gaussian();
>return a real gausian random from -1 to 1

float random_next_gaussian(power n);
>return a real gausian random from -1 to 1 but a the power 'n'

float random_next_gaussian(float range);
>return a real gausian random from '-range' to 'range'

float random_next_gaussian(float range, power n);
>return a real gausian random from '-range' to 'range' but at the power 'n'









TABLE METHOD 0.0.3
--
build
--
void buildTable(Table table, TableRow [] tableRow, String [] col_name, String [] row_name) ;

void buildTable(Table table, String [] col_name) ;
>build your table with the collumn name that you need until 7 col, the first is always for the data type. Be caraful, used the method in the SETUP()


set
--
void setTable(Table table, TableRow [] rows, Info_obj... info) ;

add rows with info that you need.
Here we use the Class Info_obj to put every thing what you need in each row, no matter if it's String, float, int...
the first param of Info is in String and be use in the first col, the other are Object type and be use in the next col.


void setRow(Table table, Info_obj info) ;
>Set a specific row.




PRINT 
--
void printErr(Object... arg);

void printErrTempo(int tempo, Object arg);

void printTempo(int tempo, Object... var);

void printArrayTempo(int tempo, Object[] array);
>Parameters
>tempo: it's frequence of printl in frame
>var: it's your variables must be write in the println






INFO DICT 0.2.3
--
Generic Dict_list
--
Object
Info_dict your_dict = new Info_dict() ;

Be careful Info_dict return only var of type Object. So before use it, you must check the type before cast it.
Plus the method get() don't work in Dict_list, instead use catch_all() or catch_obj(int arg)

Special Dict_list
--
Integer
Info_int_dict your_dict = new Info_int_dict() ;

Float
Info_float_dict your_dict = new Info_float_dict() ;

String
Info_String_dict your_dict = new Info_String_dict() ;

Vec
Info_Vec_dict your_dict = new Info_Vec_dict() ;




add value
--
dict.add(String name, Type var) ;
> from '1' var... to '6' vars

your_dict.add(String name, Type var, Type var, Type var, Type var, Type var, Type var) ;

read value
--
your_dict.read() ;
> return the name, the vars and the type of var used

size
--
your_dict.size() ;
> return the size of your dict

get value
--
your_dict.get("name")) ;
> return Array list of info with the target name

your_dict.get(-1)) ;
> return Object info

remove Info
--
your_dict.remove("name") ;
> remove all entries with this entry name

your_dict.remove(0) ;
>remove this entry from the list

clear
--
your_dict.clear() ;
>empty the list




INFO 0.1.0
--
>class structure and build to return:
>String + String(s) / String + int(s) / String + float(s) / String + Vec(s) / String + Object(s)


>Info_String, Info_float, Info_int, Info_Vec, Info_obj.

like that
--
Info info = new Info_int(String name,int... arg);

Info info = new Info_String(String name,String... arg);

Info info = new Info_float(String name,float... arg);

Info info = new Info_vec(String name,Vec... arg);

Info info = new Info_obj(String name,Object... a);




You can catch or get the value with:
--
Object [] catch_all() ;
>return array with all objects

Object catch_obj(int target);
>return a var from type Object

You can also get the value with

variable [] get() ;
>return array with all argument of the info type.

variable [] get(int target) ;
>return a argument of the type info

Can work with float, int, String and Vec class
--
Info(String name,type a);

Info(String name,type a,type  b);

Info(String name,type a,type b,type c);

Info(String name,type a,type b,type c,type  d);

Info(String name, type a,type b,type c,type d,type e);

Info(String name,type a,type b,type c,type d,type e,type f);

Info(String name,type  a,type b,type c,type d,type e,type f,type g);
>if you mix different type of var in you Constructor, the class considere all param like Object type.









SCREEN / WINDOW
--
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









MISC
--
Test value in range
--
booelan in_range(float min, float max, float value) ;
>return boolean, test value in univers with low and hight value

boolean in_range_wheel(float min, float max, float roof_max, float value) ;
>return boolean, test value in univers with no low and hight value, whe the value is hight of the max that's return to the min value.












MAP
--
float map_cycle(float value, float min, float max)
>return value who restart from the min value, when the value is over tha maximum.

float map_locked(float value, float sourceMin, float sourceMax, float targetMin, float targetMax)
>return value who is locked when the value is over the maximum or the minimum

float map_smooth(float value, float sourceMin, float sourceMax, float targetMin, float targetMax, int level)
>return float value with non linear curve for the start and the end, like "S", use level value to change the curve

float map_smooth_start(float value, float sourceMin, float sourceMax, float targetMin, float targetMax, int level)
>return float value with non linear curve from start, use level value to change the curve

float map_smooth_end(float value, float sourceMin, float sourceMax, float targetMin, float targetMax, int level)
>return float value with non linear curve to end, use level value to change the curve







STRING
--
write message
--
String write_message(Object... obj);
> return String with all your object separate by String mark = " ";

String write_message_sep(String mark, Object... obj)
> return String with all your object separate by your String mark parameter;


remove element of the sketchPath
--
String sketchPath(int minus);
>param : int minus is the num of folder remove of the sketch path

longest in letter
--
int longest_String(String[] string_list) {
> return the num of char of the longest word in specific part of list

int longest_String(String[] string_list, int start, int finish)
> return the num of char of the longest word in specific part of list

longest in pixel, compute based on PFont
--
int longest_String_pixel(PFont font, String[] string_list);

int longest_String_pixel(PFont font, String[] string_list, int... size_font);

int longest_String_pixel(PFont font, String[] string_list, int [] size_font, int start, int finish);
> return the size in pixel of the longest word


longest in pixel, compute based on String Font_name
--
int longest_String_pixel(String font_name, String[] string_list, int... size_font);

int longest_String_pixel(String font_name, String[] string_list, int size_font, int start, int finish);

int longest_String_pixel(String font_name, String[] string_list, int [] size_font, int start, int finish);
> return the size in pixel of the longest word

>parameter
String[] string_list : must be  sort
PFont font : font used to compute the size of the longest String
int [] size_font : In case you want specify a specific font size for each compoennt of array String list
int start : point to start the sort, for the case you don't want compute all the list
int finish : point to finish the sort, for the case you don't want compute all the list




length in pixel of String or char
--
int width_String(String target, int size) ;
>use default font

int width_String(PFont font, String target, int size) ;
> return width in pixel of target String

int width_String(String font_name, String target, int size) ;
> return width in pixel of target String

int width_char(char target, int size) ;
> use default font

int width_char(Pfont font, char target, int size) ;
> return width in pixel of target char

int width_char(String font_name, char target, int size) ;
> return width in pixel of target char




remove
--
String remove_part_String(String research, String target) ;
>return a String without the part of your choice, if it's possible. If it's not possible return info to explain.




research
--
boolean research_in_String(String research, String target) ;
>return a boolean if String is find in an other String




split
--
String [] split_text(String textToSplit, String separator)
>return array String

int longestWord( String[] listWordsToSort)
> return the num of char of the longest word


join
--
String join_int_to_String(int []data, String separator) 
> return a simple String with data int, with the separator of your choice

String join_int_to_String(float []data, String separator) 
> return a simple String with data float, with the separator of your choice




Check
--
boolean research_in_String(String research, String target)
> return true if a specific String is in the String target


String get_type(Object obj);
> return the name of the type var you send, can be use with generic var like Object, can beturn if it's PVector, Vec or Ivec too.


File util
--
String file_name(String s);
> return the raw file name without the path


String extension(String filename);
> return the extension of your file





CONVERT
--

float truncate(float x) ;
> return float with two decimals

float truncate(float x, int num) ;
> return float with two decimals, where num is quantity of digit after coma, maximum is 5




float
--
String float_to_String_1(float data) ;

String float_to_String_2(float data) ;

String float_to_String_3(float data) ;

String float_to_String_4(float data) ;
>translate a float to String with "1" float or with "4", weird must look inside


int
--
String int_to_String(int data) ;
>translate an Integer in String

int int_from_2_bytes(byte [] array_byte) ;
>return int value from two bytes

int int_from_4_bytes(byte [] array_byte) ;
>return int value from four bytes

int int_from_byte(Byte b) ;
>Be careful here we use the class Byte, not the primitive byte  'B' vs 'b'


byte
--
byte[] bytes_2_from_int(int x) 
>return couple byte from int
  
byte[] bytes_4_from_int(int size)
>return four byte from int value



Vec4
--
Vec4 array_to_Vec4_rgba(float... f);
>It's a special converter
if f[] array length equal 1, the Vec4 is Vec4(f[0],f[0],f[0],f[0]);
if f[] array length equal 2, the Vec4 is Vec4(f[0],f[0],f[0],f[1]);
if f[] array length equal 3, the Vec4 is Vec4(f[1],f[2],f[3],1);
if f[] array length equal 4, the Vec4 is Vec4(f[1],f[2],f[3],f[4]);
else the array is null or beyond 4 component the  Vec4(1,1,1,1);





























FLOAT
--
float to string
--
String float_to_String_1(float data) ;

String float_to_String_2(float data) ;

String float_to_String_3(float data) ;
> return String with one, two or three decimal




