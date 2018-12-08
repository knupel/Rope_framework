/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


void setup() {
  size(500,500);

  for(int i = 0 ; i < width ; i++) {
    float x = i ;
    float y = i;
    y = map(y,0,width,0,width,0,0);
    point(x,y);

  }



}




