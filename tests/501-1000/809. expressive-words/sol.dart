class Solution {
  int expressiveWords(String s, List<String> words) {
    List<Object> encode(String x) {
      List<String> chars = [];
      List<int> cnts = [];
      String? prev;
      int c = 0;
      for (int i = 0; i < x.length; i++) {
        String ch = x[i];
        if (ch == prev) {
          c++;
        } else {
          if (prev != null) {
            chars.add(prev);
            cnts.add(c);
          }
          prev = ch;
          c = 1;
        }
      }
      if (prev != null) {
        chars.add(prev);
        cnts.add(c);
      }
      return [chars, cnts];
    }
    
    var sEncoded = encode(s);
    List<String> sChars = sEncoded[0] as List<String>;
    List<int> sCnts = sEncoded[1] as List<int>;
    int ans = 0;
    for (String w in words) {
      var wEncoded = encode(w);
      List<String> wChars = wEncoded[0] as List<String>;
      List<int> wCnts = wEncoded[1] as List<int>;
      if (sChars.join() != wChars.join()) continue;
      bool ok = true;
      for (int i = 0; i < sCnts.length; i++) {
        int sc = sCnts[i], wc = wCnts[i];
        if (sc < wc || (sc < 3 && sc != wc)) {
          ok = false;
          break;
        }
      }
      if (ok) ans++;
    }
    return ans;
  }
}
