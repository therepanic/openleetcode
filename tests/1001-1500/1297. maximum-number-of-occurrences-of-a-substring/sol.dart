class Solution {
  int maxFreq(String s, int maxLetters, int minSize, int maxSize) {
    Map<String, int> count = {};
    Map<String, int> unique = {};
    int left = 0;
    int res = 0;
    for (int right = 0; right < s.length; right++) {
      String rc = s[right];
      unique[rc] = (unique[rc] ?? 0) + 1;

      while (unique.length > maxLetters || right - left + 1 > minSize) {
        String lc = s[left];
        unique[lc] = unique[lc]! - 1;
        if (unique[lc] == 0) {
          unique.remove(lc);
        }
        left++;
      }

      if (right - left + 1 == minSize && unique.length <= maxLetters) {
        String curr = s.substring(left, right + 1);
        count[curr] = (count[curr] ?? 0) + 1;
        res = res > count[curr]! ? res : count[curr]!;
      }
    }
    return res;
  }
}
