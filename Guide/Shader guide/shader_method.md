*SHADER METHOD


FX get_fx(ArrayList<FX> fx_list, int target);

FX get_fx(ArrayList<FX> fx_list, String name);

void init_fx(ArrayList<FX> fx_list, String name, int type);

void init_fx(ArrayList<FX> fx_list, String name, int type, int id, String author, String pack, String version, int revision, String [] name_slider, String [] name_button);

void select_fx_post(PImage main, PImage layer_a, PImage layer_b, FX... fx);

void select_fx_background(FX fx);

*setting fx

// single
void fx_set_mode(ArrayList<FX> fx_list, String name, int mode);

void fx_set_num(ArrayList<FX> fx_list, String name, int num);

void fx_set_quality(ArrayList<FX> fx_list, String name, float quality);

void fx_set_time(ArrayList<FX> fx_list, String name, float time);

// double
void fx_set_scale(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_resolution(ArrayList<FX> fx_list, String name, float... arg);

// triple
void fx_set_strength(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_angle(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_threshold(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_pos(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_size(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_offset(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_speed(ArrayList<FX> fx_list, String name, float... arg);

// quadruple
void fx_set_level_source(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_level_layer(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_colour(ArrayList<FX> fx_list, String name, float... arg);

void fx_set_cardinal(ArrayList<FX> fx_list, String name, float... arg);

// single
void fx_set_hue(ArrayList<FX> fx_list, String name, float hue);

void fx_set_saturation(ArrayList<FX> fx_list, String name, float saturation);

void fx_set_brightness(ArrayList<FX> fx_list, String name, float brightness);

void fx_set_red(ArrayList<FX> fx_list, String name, float red);

void fx_set_green(ArrayList<FX> fx_list, String name, float green);

void fx_set_blue(ArrayList<FX> fx_list, String name, float blue);

void fx_set_alpha(ArrayList<FX> fx_list, String name, float alpha);


// modulair param
// triple
void fx_set_matrix(ArrayList<FX> fx_list, String name, int target, float... arg);

// double
void fx_set_pair(ArrayList<FX> fx_list, String name, int target, float... arg);

// single boolean
void fx_set_event(ArrayList<FX> fx_list, String name, int target, boolean... arg);





*CONSTANTS FX POST

int NO_FX;
int FX_TEMPLATE = 0;

int FX_BLUR_GAUSSIAN = 200;
int FX_BLUR_RADIAL = 201;
int FX_BLUR_CIRCULAR = 202;

int FX_COLOUR_CHANGE_A = 300;
int FX_COLOUR_CHANGE_B = 301;

int FX_DATAMOSH = 400;
int FX_DITHER_BAYER_8 = 408;

int FX_FLIP = 600;

int FX_GRAIN = 700;
int FX_GRAIN_SCATTER = 701;

int FX_HALFTONE_DOT = 800;
int FX_HALFTONE_LINE = 801;
int FX_HALFTONE_MULTI = 810;

int FX_IMAGE = 900;

int FX_LEVEL = 12_00;

int FX_MIX = 13_00;

int FX_PIXEL = 16_00;

int FX_REAC_DIFF = 18_00;

int FX_SPLIT_RGB = 19_50;

int FX_THRESHOLD = 20_00; // don't work
int FX_TOON = 20_20; // don't work


int FX_WARP_PROC = 23_00;

int FX_WARP_TEX_A = 23_10;
int FX_WARP_TEX_B = 23_11;

*CONSTANT FX BACKGROUND

int FX_BG_TEMPLATE = 1;

int FX_BG_CELLULAR = 3_0000;

int FX_BG_HEART = 8_0000;

int FX_BG_NECKLACE = 14_0000;

int FX_BG_NEON = 14_0000;

int FX_BG_PSY = 16_0000;

int FX_BG_SNOW = 19_0000;

int FX_BG_VORONOI_HEX = 22_0000;

