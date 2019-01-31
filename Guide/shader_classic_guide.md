*METHOD FILTER SHADER

Other shader method to manage shader is coming, a lot of change those method became depreacated...


*main

void shader_folder_filter(String path);
>to change the default path of shader




*Gaussian blur

void blur(PImage tex, float intensity);

void blur(PGraphics p, PImage tex, float intensity);


*Multiply

void multiply_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void multiply_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void multiply_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void multiply(PImage tex, PImage inc);

void multiply(PImage tex, PImage inc, vec2 ratio);

void multiply(PImage tex, PImage inc, vec3 ratio);

void multiply(PImage tex, PImage inc, vec4 ratio);

void multiply(PImage tex, PImage inc, float... ratio);

void multiply(PGraphics p, PImage tex, PImage inc);

void multiply(PGraphics p, PImage tex, PImage inc, vec2 ratio);

void multiply(PGraphics p, PImage tex, PImage inc, vec3 ratio);

void multiply(PGraphics p, PImage tex, PImage inc, vec4 ratio);

void multiply(PGraphics p, PImage tex, PImage inc, float... ratio);


*Overlay

void overlay_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void overlay_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void overlay_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void overlay(PImage tex, PImage inc);

void overlay(PImage tex, PImage inc, vec2 ratio);

void overlay(PImage tex, PImage inc, vec3 ratio);

void overlay(PImage tex, PImage inc, vec4 ratio);

void overlay(PImage tex, PImage inc, float... ratio);

void overlay(PGraphics p, PImage tex, PImage inc);

void overlay(PGraphics p, PImage tex, PImage inc, vec2 ratio);

void overlay(PGraphics p, PImage tex, PImage inc, vec3 ratio);

void overlay(PGraphics p, PImage tex, PImage inc, vec4 ratio);

void overlay(PGraphics p, PImage tex, PImage inc, float... ratio);


*Blend

void blend_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void blend_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void blend_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void blend(PImage tex, PImage inc, float blend, vec2 ratio);

void blend(PImage tex, PImage inc, float blend, vec3 ratio);

void blend(PImage tex, PImage inc, float blend, vec4 ratio);

void blend(PImage tex, PImage inc, float blend, float... ratio);

void blend(PGraphics p, PImage tex, float blend, PImage inc);

void blend(PGraphics p, PImage tex, PImage inc, float blend, vec2 ratio);

void blend(PGraphics p, PImage tex, PImage inc, float blend, vec3 ratio);

void blend(PGraphics p, PImage tex, PImage inc, float blend, vec4 ratio);

void blend(PGraphics p, PImage tex, PImage inc, float blend, float... ratio);


*Mix

void mix_flip_inc(boolean bx, boolean by);
>change the orientation of the incrustation

void mix_flip_tex(boolean bx, boolean by);
>change the orientation of the texture

void mix_flip(boolean bx, boolean by);
>change the orientation of the image : inc-rustation plus tex-ture

void mix(PImage tex, PImage inc);

void mix(PImage tex, PImage inc, vec2 ratio);

void mix(PImage tex, PImage inc, vec3 ratio);

void mix(PImage tex, PImage inc, vec4 ratio);

void mix(PImage tex, PImage inc, float... ratio);

void mix(PGraphics p, PImage tex, PImage inc);

void mix(PGraphics p, PImage tex, PImage inc, vec2 ratio);

void mix(PGraphics p, PImage tex, PImage inc, vec3 ratio);

void mix(PGraphics p, PImage tex, PImage inc, vec4 ratio);

void mix(PGraphics p, PImage tex, PImage inc, float... ratio);


*Level

void level_flip(boolean bx, boolean by);
>change the orientation of the image

void level(PImage tex, vec2 level);

void level(PImage tex, vec3 level);

void level(PImage tex, vec4 level);

void level(PImage tex, float... ratio);

void level(PGraphics p, PImage tex, PImage inc);

void level(PGraphics p, PImage tex, vec2 ratio);

void level(PGraphics p, PImage tex, vec3 ratio);

void level(PGraphics p, PImage tex, vec4 ratio);

void level(PGraphics p, PImage tex, float... ratio);



