/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

void setup() {
	main_glsl();

}




float mod289(float x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

Vec4 mod289(Vec4 x) {
  Vec4 temp = Vec4(x);
  temp.x = mod289(temp.x);
  temp.y = mod289(temp.y);
  temp.z = mod289(temp.z);
  temp.w = mod289(temp.w);
  return temp;
}

Vec4 perm(Vec4 x) {
  Vec4 to_mod = x.mult(34.0).add(1.0).mult(x);
  //Vec4 to_mod = ((x * 34.0) + 1.0) * x;
  return mod289(to_mod);
  //return mod289(((x * 34.0) + 1.0) * x);
}

float noise3d(Vec3 p) {
  Vec3 a = floor(p);
  Vec3 d = p.sub(a);
  d = d.mult(d).mult(Vec3(3.0)).sub(Vec3(2).mult(d));

  Vec4 b = Vec4(a.x,a.x,a.y,a.y).add(Vec4(0.0, 1.0, 0.0, 1.0));
  Vec4 k1 = perm(Vec4(b.x,b.y,b.x,b.y));
  Vec4 k2 = perm(Vec4(k1.x,k1.y,k1.x,k1.y).add(Vec4(b.z,b.z,b.w,b.w)));

  Vec4 c = k2.add(Vec4(a.z));
  Vec4 k3 = perm(c);
  Vec4 k4 = perm(c.add(Vec4(1.0)));

  Vec4 o1 = fract(k3.mult(Vec4(1.0 / 41.0)));
  Vec4 o2 = fract(k4.mult(Vec4(1.0 / 41.0)));

  Vec4 o3 = o2.mult(Vec4(d.z)).add(o1).mult(Vec4(1.0 - d.z));
  Vec2 o4 = Vec2(o3.y,o3.w).mult(Vec2(d.x)).add(Vec2(o3.x,o3.z)).mult(Vec2(1.0 - d.x));

  return o4.y * d.y + o4.x * (1.0 - d.y);
  /*
  Vec3 a = floor(p);
  Vec3 d = p - a;
  d = d * d * (3.0 - 2.0 * d);

  Vec4 b = a.xxyy + Vec4(0.0, 1.0, 0.0, 1.0);
  Vec4 k1 = perm(b.xyxy);
  Vec4 k2 = perm(k1.xyxy + b.zzww);

  Vec4 c = k2 + a.zzzz;
  Vec4 k3 = perm(c);
  Vec4 k4 = perm(c + 1.0);

  Vec4 o1 = fract(k3 * (1.0 / 41.0));
  Vec4 o2 = fract(k4 * (1.0 / 41.0));

  Vec4 o3 = o2 * d.z + o1 * (1.0 - d.z);
  Vec2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);

  return o4.y * d.y + o4.x * (1.0 - d.y);
  */
}



void main_glsl() {
  // vec2 uv = fragCoord.xy / iResolution.xy;
  float strength = 100;
   Vec2 uv = Vec2(random(1),random(1));
 // Vec2 uv = vertTexCoord.st;
  Vec2 temp = uv.mult(strength);
  float v1 = noise3d(Vec3(temp.x,temp.y,0.));
  float v2 = noise3d(Vec3(temp.x,temp.y,1.));
  println("uv",uv);
  println("v1,v2",v1,v2);
  
  /*
  Vec4 color  = texture(texture, uv + vec2(v1,v2) * 0.1);
  gl_FragColor = color;
  */
}






















