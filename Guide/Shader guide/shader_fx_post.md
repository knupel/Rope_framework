*FX POST FX


*FX POST RENDERING BLUR CIRCULAR
PGraphics fx_blur_circular(PImage source, FX fx);
PGraphics fx_blur_circular(PImage source, boolean on_g, boolean filter_is, vec3 strength, int num);


*FX POST RENDERING BLUR GAUSSIAN
PGraphics fx_blur_gaussian(PImage source, FX fx)
PGraphics fx_blur_gaussian(PImage source, boolean on_g, boolean filter_is, boolean second_pass, ivec2 resolution, float strength);


*FX POST RENDERING BLUR RADIAL
PGraphics fx_blur_radial(PImage source, FX fx);
PGraphics fx_blur_radial(PImage source, boolean on_g, boolean filter_is, vec2 pos, float strength, float scale);




*FX POST RENDERING COLOUR CHANGE A
PGraphics fx_colour_change_a(PImage source, FX fx);
PGraphics fx_colour_change_a(PImage source, boolean on_g, boolean filter_is, int num, vec3... mat);


*FX POST RENDERING COLOUR CHANGE B
PGraphics fx_colour_change_b(PImage source, FX fx);
PGraphics fx_colour_change_b(PImage source, boolean on_g, boolean filter_is, float angle, float strength);





*FX POST RENDERING DITHER BAYER 8
PGraphics fx_dither_bayer_8(PImage source, FX fx);
PGraphics fx_dither_bayer_8(PImage source, boolean on_g, boolean filter_is, vec3 level, int mode);





*FX POST RENDERING GRAIN
PGraphics fx_grain(PImage source, FX fx);
PGraphics fx_grain(PImage source, boolean on_g, boolean filter_is, float offset, int mode);


*FX POST RENDERING GRAIN SCATTER
PGraphics fx_grain_scatter(PImage source, FX fx);
PGraphics fx_grain_scatter(PImage source, boolean on_g, boolean filter_is,float strength);





*FX POST RENDERING HALFTONE DOT
PGraphics fx_halftone_dot(PImage source, FX fx);
PGraphics fx_halftone_dot(PImage source, boolean on_g, boolean filter_is, vec2 pos, float size, float angle, float threshold);


*FX POST RENDERING HALFTONE LINE
PGraphics fx_halftone_line(PImage source, FX fx);
PGraphics fx_halftone_line(PImage source, boolean on_g, boolean filter_is, vec2 pos, vec3 angle, int mode, int num, float quality, vec3 threshold);


*FX POST RENDERING HALFTONE MULTI
PGraphics fx_halftone_multi(PImage source, FX fx);
PGraphics fx_halftone_multi(PImage source, boolean on_g, boolean filter_is, vec2 pos, float size, float angle, float quality, float threshold, float saturation, int mode);








*FX POST RENDERING IMAGE
PGraphics fx_image(PImage source, FX fx);
PGraphics fx_image(PImage source, boolean on_g, boolean filter_is, vec2 pos, vec2 scale, vec3 colour_background, vec4 pos_curtain, int mode);


*FX POST RENDERING LEVEL
PGraphics fx_level(PImage source, FX fx);
PGraphics fx_level(PImage source, boolean on_g, boolean filter_is, int mode, float... level);


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
PGraphics fx_mix(PImage source, PImage layer, boolean on_g, boolean filter_is, int mode, vec3 level_source, vec3 level_layer);






*FX POST RENDERING PIXEL
PGraphics fx_pixel(PImage source, FX fx);
PGraphics fx_pixel(PImage source, boolean on_g, boolean filter_is, ivec2 size, int num, vec3 level_source, boolean effect_is);





*FX POST RENDERING REACTION DIFFUSION
WARNING
the g part is not not not not optimized...too slow :((((((
*
PGraphics fx_reaction_diffusion(PImage source, FX fx);
PGraphics fx_reaction_diffusion(PImage source, boolean on_g, vec2 conc_uv, vec2 kf, vec2 scale, vec3 rgb, int num, boolean event);






*FX POST RENDERING SPLIT RGB
PGraphics fx_split_rgb(PImage source, FX fx);
PGraphics fx_split_rgb(PImage source, boolean on_g, boolean filter_is, vec2 offset_red, vec2 offset_green, vec2 offset_blue);






*FX POST RENDERING THRESHOLD
PGraphics fx_threshold(PImage source, FX fx);
PGraphics fx_threshold(PImage source, boolean on_g, boolean filter_is, vec3 level, int mode);






*FX POST RENDERING WARP PROCEDURAL
PGraphics fx_warp_proc(PImage source, FX fx);
PGraphics fx_warp_proc(PImage source, boolean on_g, boolean filter_is, float strength);



*FX POST RENDERING WARP TEXTURAL A
PGraphics fx_warp_tex_a(PImage source, PImage velocity, PImage direction, FX fx);
PGraphics fx_warp_tex_a(PImage source, PImage velocity, PImage direction, boolean on_g, boolean filter_is, int mode, float strength);


*FX POST RENDERING WARP TEXTURAL B
PGraphics fx_warp_tex_b(PImage source, PImage layer, FX fx);
PGraphics fx_warp_tex_b(PImage source, PImage layer, boolean on_g, boolean filter_is, float strength);








