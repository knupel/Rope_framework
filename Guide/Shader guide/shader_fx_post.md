*FX POST FX


*fx post rendering BLUR CIRCULAR
PGraphics fx_blur_circular(PImage source, FX fx);
PGraphics fx_blur_circular(PImage source, boolean on_g, boolean filter_is, vec3 strength, int num);


*fx post rendering BLUR GAUSSIAN
PGraphics fx_blur_gaussian(PImage source, FX fx)
PGraphics fx_blur_gaussian(PImage source, boolean on_g, boolean filter_is, boolean second_pass, ivec2 resolution, float strength);


*fx post rendering BLUR RADIAL
PGraphics fx_blur_radial(PImage source, FX fx);
PGraphics fx_blur_radial(PImage source, boolean on_g, boolean filter_is, vec2 pos, float strength, float scale);




*fx post rendering COLOUR CHANGE A
PGraphics fx_colour_change_a(PImage source, FX fx);
PGraphics fx_colour_change_a(PImage source, boolean on_g, boolean filter_is, int num, vec3... mat);


*fx post rendering COLOUR CHANGE B
PGraphics fx_colour_change_b(PImage source, FX fx);
PGraphics fx_colour_change_b(PImage source, boolean on_g, boolean filter_is, float angle, float strength);





*fx post rendering DITHER BAYER 8
PGraphics fx_dither_bayer_8(PImage source, FX fx);
PGraphics fx_dither_bayer_8(PImage source, boolean on_g, boolean filter_is, vec3 level, int mode);





*fx post rendering GRAIN
PGraphics fx_grain(PImage source, FX fx);
PGraphics fx_grain(PImage source, boolean on_g, boolean filter_is, float offset, int mode);


*FX POST RENDERING GRAIN SCATTER
PGraphics fx_grain_scatter(PImage source, FX fx);
PGraphics fx_grain_scatter(PImage source, boolean on_g, boolean filter_is,float strength);





*fx post rendering HALFTONE DOT
PGraphics fx_halftone_dot(PImage source, FX fx);
PGraphics fx_halftone_dot(PImage source, boolean on_g, boolean filter_is, vec2 pos, float size, float angle, float threshold);


*fx post rendering HALFTONE LINE
PGraphics fx_halftone_line(PImage source, FX fx);
PGraphics fx_halftone_line(PImage source, boolean on_g, boolean filter_is, vec2 pos, vec3 angle, int mode, int num, float quality, vec3 threshold);


*fx post rendering HALFTONE MULTI
PGraphics fx_halftone_multi(PImage source, FX fx);
PGraphics fx_halftone_multi(PImage source, boolean on_g, boolean filter_is, vec2 pos, float size, float angle, float quality, float threshold, float saturation, int mode);








*fx post rendering IMAGE
PGraphics fx_image(PImage source, FX fx);
PGraphics fx_image(PImage source, boolean on_g, boolean filter_is, vec2 pos, vec2 scale, vec3 colour_background, vec4 pos_curtain, int mode);





*fx post rendering LEVEL
PGraphics fx_level(PImage source, FX fx);
PGraphics fx_level(PImage source, boolean on_g, boolean filter_is, int mode, float... level);




*fx post rendering MASK

PGraphics fx_mask(PImage source, PImage mask, FX fx);

PGraphics fx_mask(PImage source, PImage mask, boolean on_g, boolean filter_is, int mode, int num);

int mode : 0 for gray mask

int num : quantity of threshold separation, the minimum is 2






*fx post rendering MIX
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
PGraphics fx_mix(PImage source, PImage layer, boolean on_g, boolean filter_is, int mode, vec3 level_source, vec3 level_layer);






*fx post rendering PIXEL
PGraphics fx_pixel(PImage source, FX fx);
PGraphics fx_pixel(PImage source, boolean on_g, boolean filter_is, ivec2 size, int num, vec3 level_source, boolean effect_is);





*fx post rendering REACTION DIFFUSION
WARNING
the g part is not not not not optimized...too slow :((((((
*
PGraphics fx_reaction_diffusion(PImage source, FX fx);
PGraphics fx_reaction_diffusion(PImage source, boolean on_g, vec2 conc_uv, vec2 kf, vec2 scale, vec3 rgb, int num, boolean event);






*fx post rendering SPLIT RGB
PGraphics fx_split_rgb(PImage source, FX fx);
PGraphics fx_split_rgb(PImage source, boolean on_g, boolean filter_is, vec2 offset_red, vec2 offset_green, vec2 offset_blue);






*fx post rendering THRESHOLD
PGraphics fx_threshold(PImage source, FX fx);
PGraphics fx_threshold(PImage source, boolean on_g, boolean filter_is, vec3 level, int mode);






*fx post rendering WARP PROCEDURAL
PGraphics fx_warp_proc(PImage source, FX fx);
PGraphics fx_warp_proc(PImage source, boolean on_g, boolean filter_is, float strength);



*fx post rendering WARP TEXTURAL A
PGraphics fx_warp_tex_a(PImage source, PImage velocity, PImage direction, FX fx);
PGraphics fx_warp_tex_a(PImage source, PImage velocity, PImage direction, boolean on_g, boolean filter_is, int mode, float strength);


*fx post rendering WARP TEXTURAL B
PGraphics fx_warp_tex_b(PImage source, PImage layer, FX fx);
PGraphics fx_warp_tex_b(PImage source, PImage layer, boolean on_g, boolean filter_is, float strength);








