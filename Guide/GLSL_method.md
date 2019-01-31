*PROCESSING GLSL GHOST METHOD


*mix

float mix(float x, float y, float a);

vec2 mix(vec2 x, vec2 y, vec2 a);

vec3 mix(vec3 x, vec3 y, vec3 a);

vec4 mix(vec4 x, vec4 y, vec4 a);


*fract

float fract(float x);

vec2 fract(vec2 v);

vec3 fract(vec3 v);

vec4 fract(vec4 v);

*sign

float sign(float x);

vec2 sign(vec2 x);

vec3 sign(vec3 x);

vec4 sign(vec4 x);

int sign(int x);

ivec2 sign(ivec2 x);

ivec3 sign(ivec3 x);

ivec4 sign(ivec4 x);


*step

float step(float edge, float x);

vec2 step(vec2 edge, vec2 x);

vec3 step(vec3 edge, vec3 x);

vec4 step(vec4 edge, vec4 x);


*smoothstep

float smoothstep(float edge0, float edge1, float x);

vec2 smoothstep(vec2 edge0, vec2 edge1, vec2 x);

vec3 smoothstep(vec3 edge0, vec3 edge1, vec3 x);

vec4 smoothstep(vec4 edge0, vec4 edge1, vec4 x);


*mod

float mod(float x, float y);

vec2 mod(vec2 x, vec2 y);

vec3 mod(vec3 x, vec3 y);

vec4 mod(vec4 x, vec4 y);

ivec2 mod(ivec2 x, ivec2 y);

ivec3 mod(ivec3 x, ivec3 y);

ivec4 mod(ivec4 x, ivec4 y);


*clamp

float clamp(float x, float min, float max);

vec2 clamp(vec2 x, vec2 min, vec2 max);

vec3 clamp(vec3 x, vec3 min, vec3 max);

vec4 clamp(vec4 x, vec4 min, vec4 max);


*all

boolean all(bvec b)
>return true if all components of bvec are true


*any

boolean any(bvec b)
>return true if any component of bvec is true

*lessThanEqual

boolean lessThanEqual(float x, float y);
>return true if x <= y

boolean lessThanEqual(int x, int y);
>return true if x <= y

bvec lessThanEqual(ivec x, ivec y);
>return true if x <= y

bvec lessThanEqual(vec x, vec y);
>return true if x <= y


*lessThan

boolean lessThanEqual(float x, float y);
>return true if x < y

boolean lessThanEqual(int x, int y);
>return true if x < y

bvec lessThanEqual(ivec x, ivec y);
>return true if x < y

bvec lessThanEqual(vec x, vec y);
>return true if x < y


*greaterThanEqual

boolean greaterThanEqual(float x, float y);
>return true if x >= y

boolean greaterThanEqual(int x, int y);
>return true if x >= y

bvec greaterThanEqual(ivec x, ivec y);
>return true if x >= y

bvec greaterThanEqual(vec x, vec y);
>return true if x >= y


*greaterThan

boolean greaterThan(float x, float y);
>return true if x > y

boolean greaterThan(int x, int y);
>return true if x > y

bvec greaterThan(ivec x, ivec y);
>return true if x > y

bvec greaterThan(vec x, vec y);
>return true if x > y


*equal

boolean equal(float x, float y);
>return true if x == y

boolean equal(int x, int y);
>return true if x == y

bvec equal(ivec x, ivec y);
>return true if x == y

bvec equal(vec x, vec y);
>return true if x == y





