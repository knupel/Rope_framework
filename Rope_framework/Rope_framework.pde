/**
* Rope Framework
* v 1.1.0
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.7.1.25
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/
com.jogamp.newt.opengl.GLWindow window;
void setup() {
	size(200,200,P2D);
	window = (com.jogamp.newt.opengl.GLWindow) surface.getNative();
	println("suface height", window.getSurfaceHeight());
	println("height", window.getHeight());
	// window.setUndecorated(true); 
}


void draw() {
	println("window", window.hasFocus());
	println("surface", surface.hasFocus());

}
