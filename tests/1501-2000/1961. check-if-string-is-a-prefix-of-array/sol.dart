class Solution {
  bool isPrefixString(String s, List<String> words) {
    String res = '';
    int i = 0;
    while (res.length < s.length) {
      if (i >= words.length) return false;
      res += words[i];
      i++;
    }
    return res == s;
  }
}
