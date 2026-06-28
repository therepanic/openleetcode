class Solution {
  List<List<int>> imageSmoother(List<List<int>> img) {
    int m = img.length;
    int n = img[0].length;
    List<List<int>> P = List.generate(m + 1, (_) => List.filled(n + 1, 0));
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        P[i][j] = img[i-1][j-1] + P[i-1][j] + P[i][j-1] - P[i-1][j-1];
      }
    }
    List<List<int>> res = List.generate(m, (_) => List.filled(n, 0));
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int a = (0 > i - 1 ? 0 : i - 1);
        int b = (0 > j - 1 ? 0 : j - 1);
        int c = (m - 1 < i + 1 ? m - 1 : i + 1);
        int d = (n - 1 < j + 1 ? n - 1 : j + 1);
        int s = P[c+1][d+1] - P[a][d+1] - P[c+1][b] + P[a][b];
        res[i][j] = s ~/ ((c - a + 1) * (d - b + 1));
      }
    }
    return res;
  }
}
