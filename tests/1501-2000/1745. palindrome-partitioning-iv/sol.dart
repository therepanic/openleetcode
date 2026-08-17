class Solution {
  bool checkPartitioning(String s) {
    int n = s.length;
    List<List<bool>> pal = List.generate(n, (_) => List.filled(n, false));
    for (int i = 0; i < n; i++) pal[i][i] = true;
    for (int length = 2; length <= n; length++) {
      for (int i = 0; i <= n - length; i++) {
        int j = i + length - 1;
        if (s[i] == s[j] && (length == 2 || pal[i+1][j-1])) {
          pal[i][j] = true;
        }
      }
    }
    for (int i = 0; i < n - 2; i++) {
      if (pal[0][i]) {
        for (int j = i + 1; j < n - 1; j++) {
          if (pal[i+1][j] && pal[j+1][n-1]) return true;
        }
      }
    }
    return false;
  }
}
