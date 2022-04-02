


void setup() {
  String e = encrypt("Ich bin Malte der Ehrenmann und das hier ist meine schöne V2","StarkesPasswort");
  println(e);
  String d = decrypt(e,"StarkesPasswort");
  println(d);
}

void draw() {
  exit();
}
