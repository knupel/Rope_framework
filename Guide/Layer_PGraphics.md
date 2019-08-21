*ROPE LAYER

2018-2018

Those method can be useful in the case you want create mask over you P3D work ;
because your 3D never gone on front of your last layer, but i'm pretty sure that's can helpful in other case.

With layer method you can use all graphic Processing method as before, rope layer create a ghost processing method to apply method on you PGraphics layer

@see https://github.com/StanLepunK/Rope_examples/tree/master/layer_PGraphics_method

Process :
*INIT

1 / init_layer()

*DRAW

2 / before used layer select_layer();
3 / begin_layer();
4 / Your method
5 / end_layer();

*DISPLAY

6 / g.image(get_layer(),int x, int y);




*LAYER METHOD

void init_layer(int x, int y);

void init_layer(int x, int y, int num);

void init_layer(int x, int y, String type, int num);

parameters
int x : width of your layer
int y : height of your layer
int num : number of layer be create
int type : type of renderer for the layer group


*DRAW

void select_layer(int target);

void begin_layer();

void end_layer();


*CLEAR

void clear_layer();

void clear_layer(int target);

*GET

PGraphics get_layer();

PGraphics get_layer(int target);



