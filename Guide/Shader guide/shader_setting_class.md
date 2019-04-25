*CLASS FX

This class can be use to set and manage fx easily

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







