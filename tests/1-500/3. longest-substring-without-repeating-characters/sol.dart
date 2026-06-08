class Solution {
  int lengthOfLongestSubstring(String s) {
    final lastSeen = <String, int>{};
    var start = 0;
    var res = 0;
    for (var end = 0; end < s.length; end++) {
      final char = s[end];
      final prev = lastSeen[char];
      if (prev != null && prev >= start) {
        start = prev + 1;
      }
      final current = end - start + 1;
      if (current > res) {
        res = current;
      }
      lastSeen[char] = end;
    }
    return res;
  }
}
