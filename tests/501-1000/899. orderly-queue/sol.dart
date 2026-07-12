class Solution {
  String orderlyQueue(String s, int k) {
    if (k > 1) {
      List<String> chars = s.split('');
      chars.sort();
      return chars.join('');
    }
    
    String res = s;
    for (int i = 0; i < s.length; i++) {
      s = s.substring(1) + s[0];
      if (s.compareTo(res) < 0) {
        res = s;
      }
    }
    
    return res;
  }
}
