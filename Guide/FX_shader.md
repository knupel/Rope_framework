*SHADER FX



*FX BACKGROUND


*FX BG CELLULAR
PGraphics fx_bg_cellular(FX fx);
PGraphics fx_bg_cellular(ivec2 canvas, boolean on_g, vec4 colour, int num, vec2 speed, float quality);


*FX BG HEART
PGraphics fx_bg_heart(FX fx);
PGraphics fx_bg_heart(ivec2 canvas, boolean on_g, vec3 colour, int num, float speed, float quality, float strength) ;


*FX BG NECKLACE
PGraphics fx_bg_necklace(FX fx);
PGraphics fx_bg_necklace(ivec2 canvas, boolean on_g, vec2 pos, vec2 size, float alpha, int num, float speed);


*FX BG NEON
PGraphics fx_bg_neon(FX fx);
PGraphics fx_bg_neon(ivec2 canvas, boolean on_g, vec2 pos, float speed);


*FX BG PSY
PGraphics fx_bg_psy(FX fx);
PGraphics fx_bg_psy(ivec2 canvas, boolean on_g, int num, float speed);


*FX BG SNOW
PGraphics fx_bg_snow(FX fx);
PGraphics fx_bg_snow(ivec2 canvas, boolean on_g, vec2 pos, vec3 colour, float speed, float quality);


*FX BG VORONOI
PGraphics fx_bg_voronoi_hex(FX fx);
PGraphics fx_bg_voronoi_hex(ivec2 canvas, boolean on_g, float size, vec3 colour, float speed_mutation,float speed_colour, float strength, float threshold, int mode);










*FX POST FX


*FX POST RENDERING BLUR CIRCULAR
PGraphics fx_blur_circular(PImage source, FX fx);
PGraphics fx_blur_circular(PImage source, boolean on_g, vec3 strength, int num);


*FX POST RENDERING BLUR GAUSSIAN
PGraphics fx_blur_gaussian(PImage source, FX fx)
PGraphics fx_blur_gaussian(PImage source, boolean on_g, boolean second_pass, ivec2 resolution, float strength);


*FX POST RENDERING BLUR RADIAL
PGraphics fx_blur_radial(PImage source, FX fx);
PGraphics fx_blur_radial(PImage source, boolean on_g, vec2 pos, float strength, float scale);




*FX POST RENDERING COLOUR CHANGE A
PGraphics fx_colour_change_a(PImage source, FX fx);
PGraphics fx_colour_change_a(PImage source, boolean on_g, int num, vec3... mat);


*FX POST RENDERING COLOUR CHANGE B
PGraphics fx_colour_change_b(PImage source, FX fx);
PGraphics fx_colour_change_b(PImage source, boolean on_g, float angle, float strength);





*FX POST RENDERING DITHER BAYER 8
PGraphics fx_dither_bayer_8(PImage source, FX fx);
PGraphics fx_dither_bayer_8(PImage source, boolean on_g, vec3 level, int mode);





*FX POST RENDERING GRAIN
PGraphics fx_grain(PImage source, FX fx);
PGraphics fx_grain(PImage source, boolean on_g, float offset, int mode);


*FX POST RENDERING GRAIN SCATTER
PGraphics fx_grain_scatter(PImage source, FX fx);
PGraphics fx_grain_scatter(PImage source, boolean on_g,float strength);





*FX POST RENDERING HALFTONE DOT
PGraphics fx_halftone_dot(PImage source, FX fx);
PGraphics fx_halftone_dot(PImage source, boolean on_g, vec2 pos, float size, float angle, float threshold);


*FX POST RENDERING HALFTONE LINE
PGraphics fx_halftone_line(PImage source, FX fx);
PGraphics fx_halftone_line(PImage source, boolean on_g, vec2 pos, vec3 angle, int mode, int num, float quality, vec3 threshold);


*FX POST RENDERING HALFTONE MULTI
PGraphics fx_halftone_multi(PImage source, FX fx);
PGraphics fx_halftone_multi(PImage source, boolean on_g, vec2 pos, float size, float angle, float quality, float threshold, float saturation, int mode);








*FX POST RENDERING IMAGE
PGraphics fx_image(PImage source, FX fx);
PGraphics fx_image(PImage source, boolean on_g, vec2 pos, vec2 scale, vec3 colour_background, vec4 pos_curtain, int mode);


*FX POST RENDERING LEVEL
PGraphics fx_level(PImage source, FX fx);
PGraphics fx_level(PImage source, boolean on_g, int mode, float... level);


*FX POST RENDERING MIX
> MODE
> -2 main
> -1 layer 
> 0 ?
> 1 multiply
> 2 screen
> 3 exclusion
> 4 overlay
> 5 hard_light
> 6 soft_light
> 7 color_dodge
> 8 color_burn
> 9 linear_dodge
> 10 linear_burn
> 11 vivid_light
> 12 linear_light
> 13 pin_light
> 14 hard_mix
> 15 subtract
> 16 divide
> 17 addition
> 18 difference
> 19 darken
> 20 lighten
> 21 invert
> 22 invert_rgb
> 23 main
> 24 layer
*
PGraphics fx_mix(PImage source, PImage layer, FX fx);
PGraphics fx_mix(PImage source, PImage layer, boolean on_g, int mode, vec3 level_source, vec3 level_layer);






*FX POST RENDERING PIXEL
PGraphics fx_pixel(PImage source, FX fx);
PGraphics fx_pixel(PImage source, boolean on_g, ivec2 size, int num, vec3 level_source, boolean effect_is);





*FX POST RENDERING REACTION DIFFUSION
WARNING
the g part is not not not not optimized...too slow :((((((
*
PGraphics fx_reaction_diffusion(PImage source, FX fx);
PGraphics fx_reaction_diffusion(PImage source, boolean on_g, vec2 conc_uv, vec2 kf, vec2 scale, vec3 rgb, int num, boolean event);






*FX POST RENDERING SPLIT RGB
PGraphics fx_split_rgb(PImage source, FX fx);
PGraphics fx_split_rgb(PImage source, boolean on_g, vec2 offset_red, vec2 offset_green, vec2 offset_blue);






*FX POST RENDERING THRESHOLD
PGraphics fx_threshold(PImage source, FX fx);
PGraphics fx_threshold(PImage source, boolean on_g, vec3 level, int mode);






*FX POST RENDERING WARP PROCEDURAL
PGraphics fx_warp_proc(PImage source, FX fx);
PGraphics fx_warp_proc(PImage source, boolean on_g, float strength);



*FX POST RENDERING WARP TEXTURAL A
PGraphics fx_warp_tex_a(PImage source, PImage velocity, PImage direction, FX fx);
PGraphics fx_warp_tex_a(PImage source, PImage velocity, PImage direction, boolean on_g, int mode, float strength);


*FX POST RENDERING WARP TEXTURAL B
PGraphics fx_warp_tex_b(PImage source, PImage layer, FX fx);
PGraphics fx_warp_tex_b(PImage source, PImage layer, boolean on_g,float strength);












*CLASS FX
public FX () {}


*SET

void set_on_g(boolean is);

void set_canvas(int x, int y);

void set_type(int type);

void set_id(int id);

void set_name(String name);

void set_name_slider(String... name);

void set_name_button(String... name);

void set_author(String author);

void set_pack(String pack);

void set_version(String version);

void set_revision(int revision);


*SET PARAM

public void set(int which, Object... arg);
> this method check which set_method() must be used, nice to autogenerate the setting
int mode; // 0
int num; // 1 
float quality; // 2

vec2 scale; // 10
vec2 resolution; // 11

vec3 strength; // 20
vec3 angle; // 21
vec3 threshold; // 22
vec3 pos; // 23
vec3 size; // 24
vec3 offset; // 25
vec3 speed; // 26

vec4 level_source; // 30
vec4 level_layer; // 31
vec4 colour; // 32
vec4 cardinal; // 33 > north, east, south, west > top, right, bottom, left

float hue; // 200
float saturation; // 201
float brightness; // 202

float red; // 300
float green; // 301
float blue; // 302

float alpha; // 400

vec3 [] matrix; // 40 > 42
vec2 [] pair; // 50 > 42
boolean [] event; // 10O-102

*SET SPECIFIC PARAM

void set_mode(int mode);

void set_num(int num);

void set_quality(float quality);

void set_scale(float... arg);

void set_resolution(float... arg);

void set_strength(float... arg);

void set_angle(float... arg);

void set_threshold(float... arg);

 void set_pos(float... arg);

void set_size(float... arg);

void set_offset(float... arg);

void set_speed(float... arg);

void set_level_source(float... arg);

void set_level_layer(float... arg);

void set_colour(float... arg);

void set_cardinal(float... arg);

void set_hue(float hue);

void set_saturation(float saturation);

void set_brightness(float brightness);

void set_red(float red);

void set_green(float green);

void set_blue(float blue);

void set_alpha(float alpha);

void set_matrix(int which, float... arg);

void set_pair(int which, float... arg);

void set_event(int which, boolean is);



*GET

boolean on_g();

String get_name();

ivec2 get_canvas();

String [] get_name_slider();

String [] get_name_button();

int get_id();

String get_author();

String get_pack();

String get_version();

int get_revision();

int get_type();

int get_mode();

int get_num();

float get_quality();

vec2 get_scale();

vec2 get_resolution();

vec3 get_strength();

vec3 get_angle();

vec3 get_threshold();

vec3 get_pos();

vec3 get_size();

vec3 get_offset();

vec3 get_speed();

vec4 get_level_source();

vec4 get_level_layer();

vec4 get_colour();

vec4 get_cardinal();

float get_hue();

float get_saturation();

float get_brightness();

float get_red();

float get_green();

float get_blue();

float get_alpha();

vec3 get_matrix(int which);

vec3 [] get_matrix();

vec2 get_pair(int which);

vec2 [] get_pair();

boolean get_event(int which) ;

boolean [] get_event();






