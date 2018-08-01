Guide Science
--
the sctech method tab is not included on this repository if you need
@see https://github.com/StanLepunK/Old_code/tree/master/Science_rope_2017_12_8

Physic
--
public double G(double dist, double m_1, double m_2);
>return the gravity constant between two bodies, it's a little artistic interpretation of the scientist work. The good idea it's mult the result by 'billion' when the value used are around a human scale !
>Nice used can be like that : double gravity = 1 / (g_force(dist, m_1, m_2) *1000000000L) ; where 'm_1' is the attractor.




GUIDE MATH 1.8.8
--
EQUATION
--
float decimale (float var, int n) ;
>return 'n' decimal after coma.

float roots(float valueToRoots, int n) ;
>return roots at "n" of a specific value





SURFACE
--
float perimeter_disc(int r) ;
>calcul the perimeter of circle

float radius_from_circle_surface(int surface) ;
>calcul the radius of circle from the surface circle

boolean inside(iVec2 pos, iVec2 size, iVec2 target);

boolean inside(iVec2 pos, iVec2 size, iVec2 target, int type);

boolean inside(Vec2 pos, Vec2 size, Vec2 target);
>by default the shape detected is an ELLIPSE

boolean inside(Vec2 pos, Vec2 size, Vec2 target, int type);
>Vec2 pos, position of the detection zone
>Vec2 size, size of the zone
>position of what must be detect
>int type of shape, ELLIPSE or RECT





TRIGONOMETRY
--
direction
>return the normal direction of the target

Vec2 look_at(Vec2 target, Vec2 origin);

Vec3 look_at(Vec3 target, Vec3 origin);

@Deprecated
Vec2 target_direction(Vec2 target, Vec2 origin);
>return a normal Vec2 or Vec3 direction, but reverse

@Deprecated
Vec3 target_direction(Vec3 target, Vec3 origin);


Projection
--
>return Vec2
--
cartesian
--
Vec2 projection(Vec2 direction) ;

Vec2 projection(Vec2 direction, float radius) ;

Vec2 projection(Vec2 direction, Vec2 origin, float radius) ;

polar Vec2
--
>return Vec2
Vec2 projection(float angle) ;

Vec2 projection(float angle, float radius) ;

polar Vec3
--
>return Vec3
Vec3 projection(Vec3 direction) ;

Vec3 projection(Vec3 direction, float radius) ;

Vec3 projection(Vec3 direction, Vec3 origin, float radius) ;





Angle
--
float angle_radians(float y, float range);

float angle_degrees(float y, float range);

float angle(Vec2 a, Vec2 b);

float angle(Vec2 v);

float distance_vec(Vec2 a, Vec2 b)
@ float
> return the distance between two vectors

float deg360 (Vec2 dir)
@ return angle

float deg360 (PVector dir)
@ return angle from Vector 2D





Rotation
--
void rotation (float angle, float posX, float posY) ;
>make rotation

void rotation (float angle, Vec2 pos) ;
>make rotation

Vec2 rotation(Vec2 ref, Vec2 lattice, float angle)
@ Vec2
>return lattice position xy

Vec2 rotation_lattice(Vec2 ref, Vec2 lattice, float angle)
@ Vec2
>return lattice position xy






Polar
--------------
Vec3 to_polar(Vec3 cart)
@ Vec3
> return polar position from cartesian position 
componant.x = latitude
componant.y = longitude
componant.z = radius




Cartesian
--------------------------------
to_cartesian_3D(float latitude, float longitude)
@ Vec3
> return xyz position normal position

to_cartesian_3D(float latitude, float longitude, float radius)
@ Vec3 
> return xyz position radius position

to_cartesian_3D(Vec2 pos, Vec2 range, float sizeField)
@ Vec3
> don't remember what's is returned :)

to_cartesian_2D (float angle, float radius)
@ Vec2
> return xy position radius position

to_cartesian_2D (float angle)
@return Vec2
> return xy position normal position

to_cartesian_2D (float posMouse, Vec2 range, Vec2 targetRadian, float distance)
@return Vec2
> don't remember what's is returned :)

// END TRIGO
///////////////////////////












// Primitive
////////////

Triangle
////////
triangle(float a_x, float a_y, float a_z,
		float b_x, float b_y, float b_z,
		float c_x, float c_y, float c_z)
triangle(float a_x, float a_y,
		float b_x, float b_y,,
		float c_x, float c_y,)
triangle(Vec2 a, Vec2 b, Vec2 c)
triangle(Vec3 a, Vec3 b, Vec3 c)



Create a regular polygon with "n" summits
//////////////////////////////////////////
primitve(float  radius, int summits) ;
primitve(Vec2 pos, float radius, int summits) ;
primitve(Vec2 pos, float  radius, int summits, float orientation) ;

primitve(Vec3 pos, float  radius, int summits) ;
primitve(Vec3 pos, float  radius, int summits, float orientation) ;

primitve(Vec3 pos, float  radius, int summits, Vec3 rotate) ;
primitve(Vec3 pos, float  radius, int summits, float orientation, Vec3 rotate) ;


note 
> orientation is in radians.
> rotate is in radians, for X,Y and Z axis











// SPHERE
/////////


@ Vec3 [] point_coord
> return the vector list of normal points of your sphere.
Vec3 [] list_cartesian_fibonacci_sphere (int num, float step, float root) ;

@ Vec3 position
> return position of specific point of cartesian sphere
Vec3 distribution_cartesian_fibonacci_sphere(int n, int num, float step, float root)

@ Vec2 [] polar_direction
> return the vector list of polar direction, longitude and latitude
Vec2 [] list_polar_fibonacci_sphere(int num, float step)



@ Vec polar_direction
> return direction of a specific point of the polar sphere
Vec2 distribution_polar_fibonacci_sphere(int n, int num, float step)




// POLYHEDRON
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







