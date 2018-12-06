/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


void setup() {
  size(500,500);
  /*
  println(MAX_INT);
  printArray(to_byte(MAX_INT));
    println(0);
  printArray(to_byte(0));
    println(MIN_INT);
  printArray(to_byte(MIN_INT));
  */
  
  /*
  byte [] array = to_byte(Integer.MAX_VALUE);
  int retour_4 = int_from_4_bytes(array,false);
  println(retour_4);
  // printArray(to_byte(false));
  */

  
  println(Short.MAX_VALUE);
  byte [] array = to_byte(Short.MAX_VALUE);
 
  // println(int_from_4_bytes(array,true));
  short retour = short_from_bytes(array);
   println(retour);
  

  /*
  println(Float.MAX_VALUE);
  printArray(to_byte(Float.MAX_VALUE));
  float f = 0;
  println(f);
  printArray(to_byte(f));
  println(Float.MIN_VALUE);
  printArray(to_byte(Float.MIN_VALUE));
  */

  /*
  println(Short.MAX_VALUE);
  printArray(to_byte(Short.MAX_VALUE));
  short s = 0;
  println(s);
  printArray(to_byte(s));
  println(Short.MIN_VALUE);
  printArray(to_byte(Short.MIN_VALUE));

  println("");
  println(MAX_INT);
  printArray(to_byte(MAX_INT));
    println(0);
  printArray(to_byte(0));
    println(MIN_INT);
  printArray(to_byte(MIN_INT));

  println("");
  println(Long.MAX_VALUE);
  printArray(to_byte(Long.MAX_VALUE));
  long l = 0;
    println(l);
  printArray(to_byte(l));
    println(Long.MIN_VALUE);
  printArray(to_byte(Long.MIN_VALUE));
  */

}


