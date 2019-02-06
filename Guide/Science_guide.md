Guide Science
--
the sctech method tab is not included on this repository if you need
@see https://github.com/StanLepunK/Old_code/tree/master/rope_method

*RANDOM

>Return random value smooth around the target, like gaussian curve, by default the range around the value is 40%, but it's the extreme case and it's very very rare.

float random_gaussian(float value);

float random_gaussian(float value, float range);
>arg value is your value must be processing
>arg range is use to contrain the gaussian random, by default the range is '.4' who give somethinf 20% up and down your value.



float random_next_gaussian();
>return a real gausian random from -1 to 1

float random_next_gaussian(power n);
>return a real gausian random from -1 to 1 but a the power 'n'

float random_next_gaussian(float range);
>return a real gausian random from '-range' to 'range'

float random_next_gaussian(float range, power n);
>return a real gausian random from '-range' to 'range' but at the power 'n'



*Wave

float sin_wave(float speed, float scale);

vec2 sin_wave(vec2 speed, vec2 scale);

vec3 sin_wave(vec3 speed, vec3 scale);

vec4 sin_wave(vec4 speed, vec4 scale);

float cos_wave(float speed, float scale);

vec2 cos_wave(vec2 speed, vec2 scale);

vec3 cos_wave(vec3 speed, vec3 scale);

vec4 cos_wave(vec4 speed, vec4 scale);




*Physic

public double G(double dist, double m_1, double m_2);
>return the gravity constant between two bodies, it's a little artistic interpretation of the scientist work. The good idea it's mult the result by 'billion' when the value used are around a human scale !
>Nice used can be like that : double gravity = 1 / (g_force(dist, m_1, m_2) *1000000000L) ; where 'm_1' is the attractor.





*EQUATION

float decimale (float var, int n) ;
>return 'n' decimal after coma.

float roots(float valueToRoots, int n) ;
>return roots at "n" of a specific value





*SURFACE

float perimeter_disc(int r) ;
>calcul the perimeter of circle

float radius_from_circle_surface(int surface) ;
>calcul the radius of circle from the surface circle

boolean inside(ivec2 pos, ivec2 size, ivec2 target);

boolean inside(ivec2 pos, ivec2 size, ivec2 target, int type);

boolean inside(vec2 pos, vec2 size, vec2 target);
>by default the shape detected is an ELLIPSE

boolean inside(vec2 pos, vec2 size, vec2 target, int type);
>vec2 pos, position of the detection zone
>vec2 size, size of the zone
>position of what must be detect
>int type of shape, ELLIPSE or RECT





*TRIGONOMETRY

direction
>return the normal direction of the target

vec2 look_at(vec2 target, vec2 origin);

vec3 look_at(vec3 target, vec3 origin);

@Deprecated
vec2 target_direction(vec2 target, vec2 origin);
>return a normal vec2 or vec3 direction, but reverse

@Deprecated
vec3 target_direction(vec3 target, vec3 origin);


*Projection

>return vec2
--
cartesian
--
vec2 projection(vec2 direction) ;

vec2 projection(vec2 direction, float radius) ;

vec2 projection(vec2 direction, vec2 origin, float radius) ;

polar vec2
--
>return vec2
vec2 projection(float angle) ;

vec2 projection(float angle, float radius) ;

polar vec3
--
>return vec3
vec3 projection(vec3 direction) ;

vec3 projection(vec3 direction, float radius) ;

vec3 projection(vec3 direction, vec3 origin, float radius) ;





*Angle

float angle_radians(float y, float range);

float angle_degrees(float y, float range);

float angle(vec2 a, vec2 b);

float angle(vec2 v);

float distance_vec(vec2 a, vec2 b)
@ float
> return the distance between two vectors

float deg360 (vec2 dir)
@ return angle

float deg360 (PVector dir)
@ return angle from vector 2D





*Rotation

void rotation (float angle, float posX, float posY) ;
>make rotation

void rotation (float angle, vec2 pos) ;
>make rotation

vec2 rotation(vec2 ref, vec2 lattice, float angle)
@ vec2
>return lattice position xy

vec2 rotation_lattice(vec2 ref, vec2 lattice, float angle)
@ vec2
>return lattice position xy






*Polar

vec3 to_polar(vec3 cart)
@vec3
> return polar position from cartesian position 
componant.x = latitude
componant.y = longitude
componant.z = radius




*Cartesian

to_cartesian_3D(float latitude, float longitude)
@ vec3
> return xyz position normal position

to_cartesian_3D(float latitude, float longitude, float radius)
@ vec3 
> return xyz position radius position

to_cartesian_3D(vec2 pos, vec2 range, float sizeField)
@ vec3
> don't remember what's is returned :)

to_cartesian_2D (float angle, float radius)
@ vec2
> return xy position radius position

to_cartesian_2D (float angle)
@return vec2
> return xy position normal position

to_cartesian_2D (float posMouse, vec2 range, vec2 targetRadian, float distance)
@return vec2
> don't remember what's is returned :)













*Primitive



*SPHERE

@ vec3 [] point_coord
> return the vector list of normal points of your sphere.
vec3 [] list_cartesian_fibonacci_sphere (int num, float step, float root) ;

@ vec3 position
> return position of specific point of cartesian sphere
vec3 distribution_cartesian_fibonacci_sphere(int n, int num, float step, float root)

@ vec2 [] polar_direction
> return the vector list of polar direction, longitude and latitude
vec2 [] list_polar_fibonacci_sphere(int num, float step)



@ vec polar_direction
> return direction of a specific point of the polar sphere
vec2 distribution_polar_fibonacci_sphere(int n, int num, float step)




*POLYHEDRON

polyhedron(String whichPolyhedron, String whichStyleToDraw, int size) ;
-
String which_polyhedron = 
"TETRAHEDRON", "CUBE", "OCTOHEDRON","DODECAHEDRON",
"ICOSAHEDRON","CUBOCTAHEDRON","ICOSI DODECAHEDRON",
"TRUNCATED CUBE","TRUNCATED OCTAHEDRON", "TRUNCATED DODECAHEDRON",
"TRUNCATED ICOSAHEDRON", "TRUNCATED CUBOCTAHEDRON" ;
"RHOMBIC CUBOCTAHEDRON", "RHOMBIC DODECAHEDRON","RHOMBIC TRIACONTAHEDRON", 
"RHOMBIC COSI DODECAHEDRON SMALL", "RHOMBIC COSI DODECAHEDRON GREAT"
 -
String whichStyleToDraw = "LINE", "POINT", "VERTEX"







