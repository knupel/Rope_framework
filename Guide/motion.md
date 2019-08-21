
Method Motion
--
vec2 follow(float target_x, float target_y, float speed);

vec2 follow(vec2 target, float speed);

vec3 follow(float target_x, float target_y, float target_y, float speed);

vec3 follow(vec3 target, float speed);












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

vec3 get_direction()  ;

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

vec2 leading(vec2 leading_pos, vec2 exec_pos) ;

vec3 leading(vec3 leading_pos, vec3 exec_pos) ;







CLASS PATH
--
Dedicated class to build a trail for the object, worj with vec3 coord x,y,z

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
vec3 [] path() ;

ArrayList<vec3> path_ArrayList() ;

int path_size() ;

vec3 get_pos() ;
>return the current pos of your object


add
--
void add(int x, int y, int z) ;

void add(int x, int y) ;

void add(vec pos) ;


