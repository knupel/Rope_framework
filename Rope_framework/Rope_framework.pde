/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
import processing.video.*;
PImage img;
Movie movie;
void setup() {
  size(500,500,P3D); // valeur reporté dans le cahier pour les mesures
  // size(459,600,P3D); // valeur reporté dans le cahier pour les mesures

	// size(350,650,P3D); // valeur reporté dans le cahier pour les mesures
	// size(700,300,P3D); // valeur reporté dans le cahier pour les mesures
	img = loadImage("jpg file/petite_puros_girl.jpg"); // a l'italienne
	// img = loadImage("jpg file/small_dame_hermine.jpg"); // à la française
	// img = loadImage("jpg file/square_dame_hermine.jpg"); // carré
	//surface.setSize(img.width,img.height);
	//movie = new Movie(this,"/Volumes/Nexus 7/Bibliothèque/Vidéothèque/Film/Français et Francophone/Auteurs/Bertrand Blier/Bertrand Blier_1974_Les Valseuses.avi"); // ok, mais pas le son
	movie = new Movie(this,"/Users/stan/En_cours/BOULOT/MEDIA/MEDIA ROMANESCO/FILM/Film/Alien_1979_director_cut.mp4"); // : (
	// movie = new Movie(this,"/Users/stan/En_cours/BOULOT/MEDIA/MEDIA ROMANESCO/FILM/extrait_film/blade_runner_intro.mp4"); // :)
	movie.loop();
	movie.volume(1);
  // println("movie size",movie.width,movie.height);
	//surface.setSize(movie.width,movie.height);
	// println("window size",width,height);

}

void movieEvent(Movie movie) {
  movie.read();  
}

void draw() {
	 println("movie size",movie.width,movie.height);
	// println(int(frameRate));

  // EXAMPLE 1
	// background(img,SCREEN);
	// background(movie,SCREEN);

  // EXAMPLE 2
 // image(movie,CENTER); // resize les image, mais pas les movies ?????
 // background(movie);
  background(movie,CENTER,0,0,0);
	// background(img,CENTER,255,255,0);

  // EXAMPLE 3
	// background(img,mouseX,mouseY,255,255,0);

  // EXAMPLE 4
  //  float size = abs(sin(frameCount *.01));
	// background(img,mouseX,mouseY,size,255,255,0);

  // EXAMPLE 5
  //  float size = abs(sin(frameCount *.01));
	// float curtain_pos = map(sin(frameCount *.02),-1,1,0,.5);
	// background(img,mouseX,mouseY,size,255,255,0,curtain_pos);

	// EXAMPLE 6
	vec3 level = abs(vec3().wave_sin(frameCount,.01,.02,.03));
	int mode = 0;
	// image(fx_level(img,false,mode,level.array()));
	//background(fx_level(img,false,mode,level.array()),CENTER,255,255,0);

	// EXAMPLE 7



  // grid
	stroke(255,0,0);
	line(width/2,0,width/2,height);
	line(0,height/2,width,height/2);
  // 3D
	//test_3D();
}

float rot_x; 
float rot_y;
void test_3D() {
	translate(width/2,height/2);
	rotateX(rot_x += .01);
	rotateY(rot_y += .02);
	box(800,100,100);
}

















