/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

PImage img ;
void setup() {
	//size(600,380,P3D);
  size(900,375,P3D); // valeur reporté dans le cahier pour les mesures

  //size(375,900,P3D); // valeur reporté dans le cahier pour les mesures

	// size(350,650,P3D); // valeur reporté dans le cahier pour les mesures
	// size(700,300,P3D); // valeur reporté dans le cahier pour les mesures
	// img = loadImage("jpg file/petite_puros_girl.jpg"); // a l'italienne
	img = loadImage("jpg file/small_dame_hermine.jpg"); // à la française
	// img = loadImage("jpg file/square_dame_hermine.jpg"); // carré
	println(img.width,img.height);
	
	
	println("ratio",float(width)/img.width,float(height)/img.height);
	println("scale",img.width/float(width),img.height/float(height));
	// surface.setSize(img.width,img.height);

}

void draw() {
	// background(img,SCREEN);
	background(img,CENTER,255,255,0);


	stroke(255,0,0);
	line(width/2,0,width/2,height);
	line(0,height/2,width,height/2);
	// image(img,SCREEN);
	other_stuff();
	
}



float rot_x; 
float rot_y;
void other_stuff() {
	translate(width/2,height/2);
	rotateX(rot_x += .01);
	rotateY(rot_y += .02);
	box(800,100,100);
}


void background(PImage img, int mode) {
	if(mode == CENTER) {
		image_calc(img,null,null,null,null,0);
	} else if(mode == SCREEN) {
		image_calc(img,null,null,null,null,1);
	}
}

void background(PImage img, int mode, float red, float green, float blue) {
	vec3 colour_curtain = abs(vec3(red,green,blue).div(vec3(g.colorModeX,g.colorModeY,g.colorModeZ)));
	if(mode == CENTER) {
		image_calc(img,null,null,colour_curtain,null,0);
	} else if(mode == SCREEN) {
		image_calc(img,null,null,colour_curtain,null,1);
	}
}


void background(PImage img, int mode, float px, float py, float red, float green, float blue) {
	vec3 colour_curtain = abs(vec3(red,green,blue).div(vec3(g.colorModeX,g.colorModeY,g.colorModeZ)));
	vec2 pos = vec2(px /width, py /height);
	if(mode == CENTER) {
		image_calc(img,null,null,colour_curtain,null,0);
	} else if(mode == SCREEN) {
		image_calc(img,null,null,colour_curtain,null,1);
	}
}



PShader image_background;
void image_calc(PImage img, vec2 pos, vec2 scale, vec3 colour_background, vec4 pos_curtain, int mode) {
	if(image_background == null) {
		image_background = loadShader("shader/fx_post/image.glsl");
	}

	image_background.set("flip_source",true,false);
	image_background.set("texture_source",img);
	image_background.set("resolution",width,height);
	image_background.set("resolution_source",img.width,img.height); 
	
	if(colour_background != null) {
		image_background.set("colour",colour_background.x,colour_background.y,colour_background.z); // definr RGB color from 0 to 1
	}

	if(pos_curtain != null) {
		image_background.set("curtain",pos_curtain.x,pos_curtain.y,pos_curtain.z,pos_curtain.w); // definr RGB color from 0 to 1
	}

  if(pos != null) {
  	image_background.set("position",pos.x,pos.y); // from 0 to 1
  }
  
	if(scale != null) {
		image_background.set("scale",scale.x,scale.y);
	}
	image_background.set("mode",mode);
	// mode 0 > CENTER
	// mode 1 > SCREEN
	// MODE 2 > SCALE 

	filter(image_background);
}














