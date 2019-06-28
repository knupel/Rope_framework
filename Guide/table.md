*TABLE METHOD 0.0.3

build
--
void buildTable(Table table, TableRow [] tableRow, String [] col_name, String [] row_name) ;

void buildTable(Table table, String [] col_name) ;
>build your table with the collumn name that you need until 7 col, the first is always for the data type. Be caraful, used the method in the SETUP()


set
--
void setTable(Table table, TableRow [] rows, Info_obj... info) ;

add rows with info that you need.
Here we use the Class Info_obj to put every thing what you need in each row, no matter if it's String, float, int...
the first param of Info is in String and be use in the first col, the other are Object type and be use in the next col.


void setRow(Table table, Info_obj info) ;
>Set a specific row.





*INFO DICT 0.2.3

Generic Dict_list
--
Object
Info_dict your_dict = new Info_dict() ;

Be careful Info_dict return only var of type Object. So before use it, you must check the type before cast it.
Plus the method get() don't work in Dict_list, instead use catch_all() or catch_obj(int arg)

Special Dict_list
--
Integer
Info_int_dict your_dict = new Info_int_dict() ;

Float
Info_float_dict your_dict = new Info_float_dict() ;

String
Info_String_dict your_dict = new Info_String_dict() ;

vec
Info_vec_dict your_dict = new Info_vec_dict() ;




add value
--
dict.add(String name, Type var) ;
> from '1' var... to '6' vars

your_dict.add(String name, Type var, Type var, Type var, Type var, Type var, Type var) ;

read value
--
your_dict.read() ;
> return the name, the vars and the type of var used

size
--
your_dict.size() ;
> return the size of your dict

get value
--
your_dict.get("name")) ;
> return Array list of info with the target name

your_dict.get(-1)) ;
> return Object info

remove Info
--
your_dict.remove("name") ;
> remove all entries with this entry name

your_dict.remove(0) ;
>remove this entry from the list

clear
--
your_dict.clear() ;
>empty the list




INFO 0.1.0
--
>class structure and build to return:
>String + String(s) / String + int(s) / String + float(s) / String + vec(s) / String + Object(s)


>Info_String, Info_float, Info_int, Info_vec, Info_obj.

like that
--
Info info = new Info_int(String name,int... arg);

Info info = new Info_String(String name,String... arg);

Info info = new Info_float(String name,float... arg);

Info info = new Info_vec(String name,vec... arg);

Info info = new Info_obj(String name,Object... a);




You can catch or get the value with:
--
Object [] catch_all() ;
>return array with all objects

Object catch_obj(int target);
>return a var from type Object

You can also get the value with

variable [] get() ;
>return array with all argument of the info type.

variable [] get(int target) ;
>return a argument of the type info

Can work with float, int, String and vec class
--
Info(String name,type a);

Info(String name,type a,type  b);

Info(String name,type a,type b,type c);

Info(String name,type a,type b,type c,type  d);

Info(String name, type a,type b,type c,type d,type e);

Info(String name,type a,type b,type c,type d,type e,type f);

Info(String name,type  a,type b,type c,type d,type e,type f,type g);
>if you mix different type of var in you Constructor, the class considere all param like Object type.




