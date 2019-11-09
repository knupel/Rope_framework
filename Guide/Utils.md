


*UTILS ROPE

2015–2019
Rope – Romanesco Processing Environment
All the methods similare or closer of Processing is writing in 'camelCase' the really Rope methods are write with '_underscore_' !





*TEMPO

void tempo(float... tempo);
>define the tempo partition

float sum_tempo();
>return the sum of all elements of tempo partition

float get_tempo(float time);
>return value of the tempo of the value on the tempo line

int get_tempo_pos(float time);
>return position of the value on the tempo line

float [] tempo();
return value of each value of tempo partion








*CREATE METHOD

void template_method(String name, PApplet pa, Class... classes);

booleans method_is();
>return true if the method exist, need to use just after method() because it's refresh in this one.

void method(String name, PApplet pa, Object... args);
>call the method you've add before... don't forget to write this one to can use it!
see example : 


*WINDOW SIZE

boolean window_change_is();
>return true if the window sketch size is different.





*PRINT CONSTANTS

void print_constants_rope();

void print_constants_colour_rope();

void print_constants_processing();

public void print_constants();








*SELECT FOLDER and INPUT

type: "default",
			"image","media","shape","shape","text","video",
      "load",
      "preference","setting"
>there is few available type to load input, that's can be use to make different filtering or keep easily the diffente path or file for each type.


void print_extension_filter()
>return all the current filter extension

void print_extension_filter(String type)
>return the current filter extension for this type


void set_filter_input(String type, String... ext);
>set the filtering extension by type.


*INPUT

void select_input();
>Open window to select input

void select_input(String type);
>select input by selecting the type of input you want.


print_input()
>print type and extensions files accepted if a specific input type is used.

*default

boolean input_is();
>return true if a input is selected

void reset_input();
>make the input_selected be "false"

void input_is(boolean is)
>set the input state

String input();
>return the String path of the last input selected

File input_file();
>return File of the last input selected


*by type

boolean input_is(String type);
>return true if a input is selected

void reset_input(String type);
>make the input_selected be "false"

void input_is(String type, boolean is)
>set the input state

String input(String type);
>return the String path of the last input selected

File input_file(String type);
>return File of the last input selected







*FOLDER

void select_folder();
>Open window to select folder

void select_folder(String message);
>Open window to select folder
>String message is the sentence write on your window when the method is used

boolean folder_is();
>Return true if a folder is selected

void folder_is(boolean is);
>Set folder to is state;

void reset_folder();
>Make the folder_selected be "false"

String folder();
>Return the String path of the last folder selected

void explore_folder(String path, String... extension);

void explore_folder(String path, boolean sub_folder, String... extension);
>this method create a list a file of a class File
>You need to give the path of the main folder or input selected
>With the boolean sub_folder you can ask to explorer the subfolder or not, only with the method void select_folder()
>and you can add each extension you want add in your list, like "jpg" and "wave" for example.

ArrayList<File> get_files()
>Return the list of file selected with the method explore_folder();

String [] get_files_sort()
>Return list of absolutePath sort from down to up;







































*METHOD SAVE LOAD FRAME

LOAD FRAME
--
PImage load_image_BMP(String fileName);




SAVE FRAME
--
Actually work for 'jpg' and 'bmp'

void save_frame(String where, String filename, PImage img) ;

void save_frame(String where, String filename) ;

void save_frame(String where, String filename, float compression);

void save_frame(String where, String filename, float compression, PImage img);
>String where is the path where you want save your file, from the sketchPath
>String filenam is the name of your file, don't add the extension
>float compression, in cas you save a jpeg, you can choice the rate compression from '0' to '1'
>PImage if you don't want same all the window you can save PImage.








PDF
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



PNG
--
>For the PNG, if you want use a default setting, you don't need to use a method 'start_PNG()'

void save_PNG(String path_folder, String name_file) ;
>save your PNG, put this method at the end of list of method must be save

void save_PNG();
>save frame in data folder


void event_PNG() ;
>Make true the boolean that give autorisation to shot !
















































*MISC

freeze
--
void freeze();
>method to switch on or off the thread draw of Processing, use it in method don't be stop :), not in the draw obvioulsy.


pixel array
--
int [][] loadPixels_array_2D()
>return 2D array pixel of the window






*Test value in range

booelan in_range(float min, float max, float value) ;
>return boolean, test value in univers with low and hight value

boolean in_range_wheel(float min, float max, float roof_max, float value) ;
>return boolean, test value in univers with no low and hight value, whe the value is hight of the max that's return to the min value.




*GET TYPE

String get_type(Object obj);
> return the name of the type var you send, can be use with generic var like Object, can beturn if it's PVector, vec or Ivec too.




*GET OS

String get_OS()
> return the exact OS

String get_OS_family()
>return the family OS: "mac","win","unix","solaris"
































*PRINT 

void printErr(Object... arg);

void printErrTempo(int tempo, Object arg);

void printTempo(int tempo, Object... var);

void printArrayTempo(int tempo, Object[] array);
>Parameters
>tempo: it's frequence of printl in frame
>var: it's your variables must be write in the println













*MAP

float map_cycle(float value, float min, float max)
>return value who restart from the min value, when the value is over tha maximum.

float map_locked(float value, float sourceMin, float sourceMax, float targetMin, float targetMax)
>return value who is locked when the value is over the maximum or the minimum

float map(float value, float sourceMin, float sourceMax, float targetMin, float targetMax, int begin, int end)
>return float value with non linear curve for the start and the end, like "S", use level value to change the curve
>the arg begin and end determine the power of curve in each area

float map_begin(float value, float sourceMin, float sourceMax, float targetMin, float targetMax, int level)
>return float value with non linear curve from start, use level value to change the curve

float map_end(float value, float sourceMin, float sourceMax, float targetMin, float targetMax, int level)
>return float value with non linear curve to end, use level value to change the curve







*STRING

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





File util
--
String file_name(String s);
> return the raw file name without the path


String extension(String filename);
> return the extension of your file


boolean extension_is(String path, String... extension);
>compare the extension of path with the array String extension.



















*CONVERT

atoi
--
int atoi(String str);
> return int from String to classic method atoi from C language, by example
if you have "gfg-+--33.12fr" the value -33 is return

atof
--
float atof(String str);
> return float from String to classic method atoi from C language, by example
if you have "gfg-+--33.12fr" the value -33.12 is return




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


primitive
--
String int_to_String(int data) ;
>translate an Integer in String

int int_from_byte(Byte b);

Boolean boolean_from_bytes(byte... array_byte);

Character char_from_bytes(byte [] array_byte);

Short short_from_bytes(byte [] array_byte);

Integer int_from_bytes(byte [] array_byte);

Long long_from_bytes(byte [] array_byte);

Float float_from_bytes(byte [] array_byte);

Double double_from_bytes(byte [] array_byte);

@Deprecated // this method return a short because it's reordering by LITTLE_ENDIAN to used by getShort()
Integer int_from_4_bytes(byte [] array_byte, boolean little_endian) ;

@Deprecated // because infine is a byte thread like a short
int int_from_2_bytes(byte [] array_byte);


byte
--
byte[] bytes_2_from_int(int x);
  
byte[] bytes_4_from_int(int size);

byte[] to_byte(Object obj);

PVector
--
convert vec and ivec

PVector to_PVector(Object obj);



vec4
--
vec4 array_to_vec4_rgba(float... f);
>It's a special converter
if f[] array length equal 1, the vec4 is vec4(f[0],f[0],f[0],f[0]);
if f[] array length equal 2, the vec4 is vec4(f[0],f[0],f[0],f[1]);
if f[] array length equal 3, the vec4 is vec4(f[1],f[2],f[3],1);
if f[] array length equal 4, the vec4 is vec4(f[1],f[2],f[3],f[4]);
else the array is null or beyond 4 component the  vec4(1,1,1,1);









FLOAT
--
float to string
--
String float_to_String_1(float data) ;

String float_to_String_2(float data) ;

String float_to_String_3(float data) ;
> return String with one, two or three decimal







































