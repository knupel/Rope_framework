
Method Motion
--
Vec2 follow(float target_x, float target_y, float speed);

Vec2 follow(Vec2 target, float speed);

Vec3 follow(float target_x, float target_y, float target_y, float speed);

Vec3 follow(Vec3 target, float speed);












CLass Motion
--

Motion 2015-2017
--
Class to manage few motion behavior

CLASS MOTION
--
DEFAULT SETTING
--
>acceleration is false ;

>deceleration is true ;

>acceleration value is 0.01

>deceleration value is 0.01 

>velocity value is 1.0 ;

>maximum velocity is 1.0 ;

CONSTRUCTOR
--
Motion() {}

Motion(float max_velocity) ;



METHOD
--
get
--
float get_velocity() ;

Vec3 get_direction()  ;

boolean acceleration_is() ;

boolean deceleration_is() ;

boolean velocity_is() ;


set
--
void set_deceleration(float dec) ;

void set_acceleration(float acc) ;

void set_velocity(float vel) ;

void set_max_velocity(float max_vel) ;

void set_tempo(int tempo) ;
>tempo is used to indicated the num of frame who is necessary to calculated the direction, in leading method for example

void reset() ;

void acceleration_is(boolean state) ;

void deceleration_is(boolean state) ;


event
--
void stop() ;

void start() ;

void deceleration() ;
  
void acceleration() ;

Vec2 leading(Vec2 leading_pos, Vec2 exec_pos) ;

Vec3 leading(Vec3 leading_pos, Vec3 exec_pos) ;







CLASS PATH
--
Dedicated class to build a trail for the object, worj with Vec3 coord x,y,z

CONSTRUCTOR
--
Path()



METHOD
--
motion
--
void next() ;

void previous() ;

void set_speed(float value) ;

get
--
Vec3 [] path() ;

ArrayList<Vec3> path_ArrayList() ;

int path_size() ;

Vec3 get_pos() ;
>return the current pos of your object


add
--
void add(int x, int y, int z) ;

void add(int x, int y) ;

void add(Vec pos) ;


