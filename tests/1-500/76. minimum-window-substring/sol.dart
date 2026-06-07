class Solution {
  String minWindow(String s, String t) {
    if (s.length < t.length || t.isEmpty) return "";

    final need = <String, int>{};
    for (var i = 0; i < t.length; i++) {
      final ch = t[i];
      need[ch] = (need[ch] ?? 0) + 1;
    }

    var missing = t.length;
    var left = 0;
    var bestL = 0;
    var bestLen = 1 << 30;

    for (var right = 0; right < s.length; right++) {
      final ch = s[right];
      if ((need[ch] ?? 0) > 0) missing--;
      need[ch] = (need[ch] ?? 0) - 1;

      while (missing == 0) {
        final currLen = right - left + 1;
        if (currLen < bestLen) {
          bestLen = currLen;
          bestL = left;
        }
        final d = s[left++];
        need[d] = (need[d] ?? 0) + 1;
        if (need[d]! > 0) missing++;
      }
    }

    return bestLen == 1 << 30 ? "" : s.substring(bestL, bestL + bestLen);
  }
}
