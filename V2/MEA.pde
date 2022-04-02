

String toBinary(String in) {
  String out = "";
  for (int i = 0; i < in.length(); i++) {
    out += binary(in.charAt(i), 8);
  }
  return out;
}

String fromBinary(String in) {
  String out = "";
  for (int i = 0; i < in.length(); i+=8) {
    out += (char)unbinary(in.substring(i, i+8));
  }
  return out;
}

String encrypt(String in, String secret) {

  //Step 1

  in = toBinary(in);
  secret = toBinary(secret);

  //Step 2 to 4
  String out = "";

  for (int i = 0; i < in.length(); i+=8) {
    String b = in.substring(i, i+8);
    for (int j = 0; j < secret.length(); j+=8) {
      //Step 2
      b = (b.charAt(1) + "") + (b.charAt(3) + "") + (b.charAt(5) + "") + (b.charAt(7) + "") + (b.charAt(0) + "") + (b.charAt(2) + "") + (b.charAt(4) + "") + (b.charAt(6) + "");
      //Step 3
      String s = secret.substring(j, j+8);
      String _b = "";

      for (int o = 0; o < 8; o++) {
        if (b.charAt(o) == s.charAt(o)) _b += "0";
        else _b += "1";
      }
      b = _b;
    }
    out += b;
  }

  //Step 5
  out = fromBinary(out);
  return out;
}

String decrypt(String in, String secret) {
  //Step 1

  in = toBinary(in);
  secret = toBinary(secret);

  //Step 2 to 4
  String out = "";

  for (int i = 0; i < in.length(); i+=8) {
    String b = in.substring(i, i+8);
    for (int j = secret.length()-8; j >= 0; j-=8) {

      //Step 2
      String s = secret.substring(j, j+8);
      String _b = "";

      for (int o = 0; o < 8; o++) {
        if (b.charAt(o) == s.charAt(o)) _b += "0";
        else _b += "1";
      }
      b = _b;

      //Step 3
      b = (b.charAt(4) + "") + (b.charAt(0) + "") + (b.charAt(5) + "") + (b.charAt(1) + "") + (b.charAt(6) + "") + (b.charAt(2) + "") + (b.charAt(7) + "") + (b.charAt(3));
    }
    out += b;
  }

  //Step 5

  out = fromBinary(out);
  return out;
}
