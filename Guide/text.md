*R_Typewriter

*constructor

R_Typewriter(PApplet pa, String path, int size);

R_Typewriter(PApplet pa, String path, int size, String... type_wanted)

*set

void path(String path);

void size(int size);

void align(int align);

void angle(float angle);

void sentence(String sentence);

void pos(vec pos);

void pos(float x, float y);

void pos(float x, float y, float z);

*get

vec3 pos();

int size();

float get_angle();

String get_path();

void reset();

vec3 [] get_points()

*show

public void show();










*Poem

*constructor

public Poem(String path);

public Poem(String [] input);

*get

int size();

int num_couplets();

ArrayList<Vers[]> get_couplets();

Vers [] couplet(int target);

ArrayList<Vers> get_vers();

Vers get_vers(int target);





*Vers

*constructor

Vers(int id, int id_local, int couplet, String sentence);

*get

int id();

int id_local();

int id_couplet();

String toString();

Vers read();

