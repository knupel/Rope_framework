Colour guide
v 0.1.0
2017-2018

*colour list

CONSTRUCTOR

public ROPE_colour(int... c);

int[] get_color();

float[] get_hue();

float[] get_saturation();

float[] get_brightness();

float[] get_red();

float[] get_green();

float[] get_blue();

float[] get_alpha();



*get colorMode


float [] getColorMode();
>return an array float about your environment color : colorMode, component x, conponent y, component z

float [] getColorMode(boolean print_info_is);
>return an array float about your environment color : colorMode, component x, conponent y, component z, conponent a. Plus if print_info_is true you can read the info in the console.

camaieu
--
int camaieu(float max, float color_ref, float range);
>return int color around the color_ref, indeed you can use for the color or what you want, you wish...
>arg max, is the top value, after this value the algorithm restart from 0 to do a wheel
>arg color_ref is the average value to do camaieu
>arg range is used to contrain the method around the color_ref

color pool
--
The color give the possiblity to built a color palette.
the method work in colorMode(HSB,360,100,100,100) ;
remember that when attribute value to your `range` or `hue key`.

int [] color_pool(int num);
>return a list of color sort by hue component

int [] color_pool(int num, float key_hue);

int [] color_pool(int num, int num_group, float hue_range);
>return a list of color by hue component in camaieu group around your range.

int [] color_pool(int num, int num_group, float key_hue, float hue_range);
>return a list of color by hue component in camaieu group around your range, and where the first color hue if your key

int [] color_pool(int num, int num_group, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);
>return a list of color by hue component in camaieu group around your range, plus you can manage the saturation, brightness and the alpha.
>the vec2 comppent for the saturation, brightness and alpha is used like that, the 'vec.x' is the low value and the 'vec.y' value is the high value, after a random value is used to define the value of each color in your pool.

int [] color_pool(int num, int num_group, float key_hue, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);
>you can also use a hue key value to start your palette, the value is between 0,360

>You can use the methode with vec4 too with value HSB or RGB

vec4 [] color_pool_HSB(int num);

vec4 [] color_pool_HSB(int num, float key_hue);

vec4 [] color_pool_HSB(int num, int num_group, float hue_range);

vec4 [] color_pool_HSB(int num, int num_group, float key_hue, float hue_range);

vec4 [] color_pool_HSB(int num, int num_group, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);

vec4 [] color_pool_HSB(int num, int num_group, float key_hue, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);

vec4 [] color_pool_RGB(int num);

vec4 [] color_pool_RGB(int num, float key_hue);

vec4 [] color_pool_RGB(int num, int num_group, float hue_range);

vec4 [] color_pool_RGB(int num, int num_group, float key_hue, float hue_range);

vec4 [] color_pool_RGB(int num, int num_group, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);

vec4 [] color_pool_RGB(int num, int num_group, float key_hue, float hue_range, vec2 sat_range, vec2 bright_range, vec2 alpha_range);


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

int color_context(int color_ref, int threshold, int clear, int dark);
>return new int color with a brightness threshold
>arg color_ref is the color of the object
>arg threshold is the moment where the color must change
>arg clear is the new color
>arg dark is the new color



*CONTEXT

int color_context(int colorRef, int threshold, int clear, int dark);
>return a color different of the context color, useful for the text by the way.




