Colour guide
v 0.2.0
2017-2019




*palette

void palette(int... arg);

int [] get_palette();
>return int array setting with colour(int.. arg);






*CLASS R_COLOUR


*CONSTRUCTOR

R_Colour(PApplet pa, int... list_colour);

R_Colour(PApplet pa);


*METHOD

void add(int colour);

void add(int [] colour);

void add(int group, int [] colour);

void add(int group, int colour);

void add_group();
> add single colour group

void add_group(int n);
> add 'n' colour group



void set(int index, int colour);
>set colour to specific index in the first group

void set(int group, int index, int colour);
>set colour to specific index in specific group




void clear();

void clear(int group);

void remove(int target);

void remove( int group, int target);


*GET

*if no group is targeted by default the group '0' is targeted

int [] get();

int [] get(int group);

int rand();
>return a random colour from all colours available

int rand(in group);
>return random colour from available colour of a specific group

int get_colour(int index);

int get_colour(int group, int index);


*SIMPLE COMPONENT COLOUR

// single component
float get_hue(int index);

float get_hue(int group, int index);

float get_saturation(int group, int index);
  
float get_brightness(int group, int index);

float get_red(int group, int index);

float get_green(int group, int index);

float get_alpha(int group, int index);

// multi component
vec3 get_hsb(int group, int index);

vec4 get_hsba(int group, int index);

vec3 get_rgb(int group, int index);

vec4 get_rgba(int group, int index);
  

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

*mixer

int mixer(int color_0, int color_1, float normal_threshold);
The method make the difference between the two colors, this difference is multiply by the threshold, it's reason why this one must be normal from 0 to 1.
>return an int color argument
>arg color_0 : is the original color
>arg color_1 : is the targeting color
>arg normal_threshold


*plot

set pixel color with alpha and PGraphics management, the alpha must hava a normal value.
This method is like set() from processing but faster because the pixel is not updated, so when you use it, you must loadPixels() and updatePixels() by yourself

void plot(int x, int y, int colour);

void plot(int x, int y, int colour, Pgraphics pg);

void plot(int x, int y, int colour, float alpha);

void plot(int x, int y, int colour, float alpha, PGraphics pg);





*simple hue colour generator

int [] hue_palette(int master_colour, int num_group, int num_colour, float spectrum);
>note the spectrum is linked with the colorMode environment, usualy with the g.colorModeX


*color pool

The color give the possiblity to built a color palette.
the method work in colorMode(HSB);
but the max value to set is from the curent g.colorModeX, ...Y, ...Z , ...A
remember that when attribute value to your `range` or `hue key`.

parameter :
int num is the number of color return in your range of color

int num_group is the number of group of color created, the color wheel is divide by the number of group.

vec2 range the first compoent is used for min and the last for the max

float range it's use to calculate the min and the max around the target color.

int [] color_pool(int num_colour);

int [] color_pool(int num_colour, float key_hue, float hue_range);

int [] color_pool(int num_group, int num_colour, float key_hue, float hue_range);

int [] color_pool(int num_group, int num_colour, float key_hue, float hue_range, vec2 sat_range, vec2 bright_range);


int [] color_pool(int num_colour, int colour, float hue_range, float sat_range, float bri_range);

int [] color_pool(int num_group, int num_colour, int colour, float hue_range, float sat_range, float bri_range);

int [] color_pool(int num_group, int num_colour, float key_hue, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);


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




