class Solution {
  List<String> findWords(List<String> words) {
    Map<String, int> m = {};
    for (var c in "qwertyuiop".split('')) m[c] = 1;
    for (var c in "asdfghjkl".split('')) m[c] = 2;
    for (var c in "zxcvbnm".split('')) m[c] = 3;
    List<String> ans = [];
    for (var w in words) {
      var lw = w.toLowerCase();
      var r = m[lw[0]];
      if (lw.split('').every((ch) => m[ch] == r)) {
        ans.add(w);
      }
    }
    return ans;
  }
}
