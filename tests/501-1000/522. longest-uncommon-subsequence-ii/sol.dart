class Solution {
  int findLUSlength(List<String> strs) {
    strs.sort((a, b) => b.length.compareTo(a.length));

    bool isSubsequence(String s, String t) {
      int i = 0;
      for (int j = 0; j < t.length && i < s.length; j++) {
        if (s[i] == t[j]) i++;
      }
      return i == s.length;
    }

    for (int i = 0; i < strs.length; i++) {
      bool unique = true;
      for (int j = 0; j < strs.length; j++) {
        if (i == j) continue;
        if (isSubsequence(strs[i], strs[j])) {
          unique = false;
          break;
        }
      }
      if (unique) return strs[i].length;
    }

    return -1;
  }
}
