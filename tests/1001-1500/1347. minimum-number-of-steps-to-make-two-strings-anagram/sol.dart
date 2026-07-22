class Solution {
  int minSteps(String s, String t) {
    var dic = <String, int>{};
    for (var ch in t.split('')) {
      dic[ch] = (dic[ch] ?? 0) + 1;
    }
    for (var ch in s.split('')) {
      if (dic.containsKey(ch) && dic[ch]! > 0) {
        dic[ch] = dic[ch]! - 1;
      }
    }
    return dic.values.fold(0, (a, b) => a + b);
  }
}
