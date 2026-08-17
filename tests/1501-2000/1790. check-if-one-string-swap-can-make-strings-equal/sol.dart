class Solution {
  bool areAlmostEqual(String s1, String s2) {
    int i = -1;
    int j = -1;
    int cnt = 0;
    for (int k = 0; k < s1.length; k++) {
      if (s1[k] != s2[k]) {
        cnt++;
        if (i == -1) {
          i = k;
        } else if (j == -1) {
          j = k;
        }
      }
    }
    
    if (cnt == 0) return true;
    if (cnt == 2 && s1[i] == s2[j] && s1[j] == s2[i]) return true;
    return false;
  }
}
