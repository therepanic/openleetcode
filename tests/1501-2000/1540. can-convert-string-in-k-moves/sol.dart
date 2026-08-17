class Solution {
  bool canConvertString(String s, String t, int k) {
    if (s.length != t.length) return false;
    List<int> shiftCount = List.filled(26, 0);
    for (int i = 0; i < s.length; i++) {
      if (s.codeUnitAt(i) == t.codeUnitAt(i)) continue;
      int diff = (t.codeUnitAt(i) - s.codeUnitAt(i) + 26) % 26;
      shiftCount[diff]++;
      if (diff + 26 * (shiftCount[diff] - 1) > k) return false;
    }
    return true;
  }
}
