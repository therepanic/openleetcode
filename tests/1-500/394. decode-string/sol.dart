class Solution {
  int i = 0;
  
  String decodeString(String s) {
    return decode(s);
  }
  
  String decode(String s) {
    String res = "";
    int num = 0;
    while (i < s.length) {
      String c = s[i];
      if (int.tryParse(c) != null) {
        num = num * 10 + int.parse(c);
        i++;
      } else if (c == '[') {
        i++;
        String inner = decode(s);
        for (int j = 0; j < num; j++) {
          res += inner;
        }
        num = 0;
      } else if (c == ']') {
        i++;
        return res;
      } else {
        res += c;
        i++;
      }
    }
    return res;
  }
}
