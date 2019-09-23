/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* typewriter
* v 0.0.1
* 2019-2019
*/
Poem poem;
void setup() {
  size(400,400,P2D);
  rope_version();
  String path = "voyage.txt";
  String [] content = loadStrings(path);
  println("lenght", content.length);
  // poem  = new Poem(content);

  poem  = new Poem(path);

  println("couplet",poem.num_couplets());
  for(int i = 0 ; i < poem.get_vers().size() ; i++){
    println(poem.get_vers().get(i).read());
    println("id: ",poem.get_vers().get(i).id());
    println("id local: ",poem.get_vers().get(i).id_local());
    println("couplet: ",poem.get_vers().get(i).id_couplet());
    // println(poem.get_vers().get(i).toString());
  }
  println("\n");
  println("size poem",poem.size());
  println("num couplet",poem.num_couplets());
  println("\n");
  printArray(poem.get_couplets().get(1));
  println("\n");
  printArray(poem.couplet(1));

}

void draw(){

}

