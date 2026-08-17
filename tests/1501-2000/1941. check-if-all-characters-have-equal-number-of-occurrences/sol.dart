class Solution {
  bool areOccurrencesEqual(String s) {
    Map<String, int> map = {};
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      map[c] = (map[c] ?? 0) + 1;
    }
    return map.values.toSet().length == 1;
  }
}
