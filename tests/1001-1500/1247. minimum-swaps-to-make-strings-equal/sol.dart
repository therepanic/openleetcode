class Solution {
  int minimumSwap(String s1, String s2) {
    int n = s1.length;
    int s1X = 0;
    int s1Y = 0;
    for (int i = 0; i < n; i++) {
      if (s1[i] == s2[i]) continue;
      if (s1[i] == 'x') {
        s1X++;
      } else {
        s1Y++;
      }
    }

    if (s1X % 2 != s1Y % 2) return -1;

    int swaps = s1X ~/ 2 + s1Y ~/ 2;
    return s1X % 2 == 0 ? swaps : swaps + 2;
  }
}
