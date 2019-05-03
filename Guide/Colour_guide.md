Colour guide
v 0.1.0
2017-2019

*R_COLOUR


*CONSTRUCTOR
R_Colour(PApplet pa, int... list_colour);


*METHOD

void add(int [] colour);

void add(int [] colour, int group);

void add(int colour, int group);

void add(int colour);



void clear();

void clear(int group);

void remove(int target);

void remove(int target, int group);


*GET

*if no group is targeted by default the group '0' is targeted

int [] get();

int [] get(int group);

int get_colour(int target);

int get_colour(int target, int group);


*SIMPLE COMPONENT COLOUR

// single component
float get_hue(int target);

float get_hue(int target, int group);
  
float get_saturation(int target);

float get_saturation(int target, int group);
  
float get_brightness(int target);

float get_brightness(int target, int group);

float get_red(int target);

float get_red(int target, int group);
  
float get_green(int target);

float get_green(int target, int group);

float get_blue(int target);

float get_alpha(int target);

float get_alpha(int target, int group);

// multi component
vec3 get_hsb(int target);

vec3 get_hsb(int target, int group);

vec4 get_hsba(int target);

vec4 get_hsba(int target, int group);

vec3 get_rgb(int target);

vec3 get_rgb(int target, int group);
  
vec4 get_rgba(int target);

vec4 get_rgba(int target, int group);
  

*ARRAY COMPONENT COLOUR

// single compoent colour 
float [] hue();

float [] hue(int group);

float [] saturation();

float [] saturation(int group);

float [] brightness();

float [] brightness(int group);

float [] red();

float [] red(int group);

float [] green();

float [] green(int group);
  
float [] blue();

float [] blue(int group);

float [] alpha();

float [] alpha(int group);

// multi component colour
vec3 [] hsb();
  
vec3 [] hsb(int group);
  
vec3 [] rgb();

vec3 [] rgb(int group);

vec4 [] hsba();

vec4 [] hsba(int group);
  
vec4 [] rgba();

vec4 [] rgba(int group);







*get colorMode

float [] getColorMode();
>return an array float about your environment color : colorMode, component x, conponent y, component z

float [] getColorMode(boolean print_info_is);
>return an array float about your environment color : colorMode, component x, conponent y, component z, conponent a. Plus if print_info_is true you can read the info in the console.

*camaieu

int camaieu(float max, float color_ref, float range);
>return int color around the color_ref, indeed you can use for the color or what you want, you wish...
>arg max, is the top value, after this value the algorithm restart from 0 to do a wheel
>arg color_ref is the average value to do camaieu
>arg range is used to contrain the method around the color_ref







*simple hue colour generator

int [] hue_palette(int master_colour, int num_colour, int num_group, float spectrum);


*color pool

The color give the possiblity to built a color palette.
the method work in colorMode(HSB,360,100,100,100) ;
remember that when attribute value to your `range` or `hue key`.

parameter :
int num is the number of color return in your range of color

int num_group is the number of group of color created, the color wheel is divide by the number of group.

vec2 range the first compoent is used for min and the last for the max

float range it's use to calculate the min and the max around the target color.

int [] color_pool(int num);

int [] color_pool(int num, float key_hue, float hue_range);

int [] color_pool(int num, int num_group, float key_hue, float hue_range);

int [] color_pool(int num, int num_group, float key_hue, float hue_range, vec2 sat_range, vec2 bright_range);

int [] color_pool(int num, int colour, float hue_range, float sat_range, float bri_range);

int [] color_pool(int num, int num_group, int colour, float hue_range, float sat_range, float bri_range);

int [] color_pool(int num, int num_group, float key_hue, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);


*check component color

>float min is the minium to be in
>float max is the maximum to be in
>int color is your color argument

boolean alpha_range(float min, float max, int colour);

boolean red_range(float min, float max, int colour);

boolean green_range(float min, float max, int colour);

boolean blue_range(float min, float max, int colour);

boolean saturation_range(float min, float max, int colour);

boolean brightness_range(float min, float max, int colour);

boolean hue_range(float min, float max, int colour);





*CONVERT

vec3 hsb_to_rgb(float hue, float saturation, float brightness);

vec4 to_cmyk(int c);

vec4 rgb_to_cmyk(float red, float green, float blue);

vec3 cmyk_to_rgb(float cyan, float magenta, float yellow, float black);

vec3 to_hsb(int c);

vec4 to_rgba(int c);

vec3 to_rgb(int c);

vec4 to_hsba(int c);
int color_context(int color_ref, int threshold, int clear, int dark);
>return new int color with a brightness threshold
>arg color_ref is the color of the object
>arg threshold is the moment where the color must change
>arg clear is the new color
>arg dark is the new color



*CONTEXT

int color_context(int colorRef, int threshold, int clear, int dark);
>return a color different of the context color, useful for the text by the way.




