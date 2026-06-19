class Solution {
  int findSubstringInWraproundString(String s) {
    List<int> counts = List.filled(26, 0);
    int maxLen = 0;

    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.codeUnitAt(i) - s.codeUnitAt(i - 1) + 26) % 26 == 1) {
        maxLen++;
      } else {
        maxLen = 1;
      }
      int idx = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
      if (counts[idx] < maxLen) {
        counts[idx] = maxLen;
      }
    }

    return counts.reduce((a, b) => a + b);
  }
}
