/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
*
* example R_Writer with window
* v 0.0.1
* 2019-2019
*/

boolean DEV_MODE = false;
float rot = 0;
void setup() {
	rope_version();
  String [] text = new String[1];
  text[0] = "zero";
  saveStrings("window/location.loc",text);
  // if(DEV_MODE) saveStrings("data/location.loc",text);
  // else saveStrings(sketchPath(-1)+"/data/location.loc",text);
  
}
