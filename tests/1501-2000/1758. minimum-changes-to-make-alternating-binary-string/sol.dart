class Solution {
  int minOperations(String s) {
    int c = 0, j = 0, n = s.length;
    for (int i = 0; i < n; i++) {
      if (s.codeUnitAt(i) - 48 == j) {
        c++;
      }
      j ^= 1;
    }
    return c < n - c ? c : n - c;
  }
}
