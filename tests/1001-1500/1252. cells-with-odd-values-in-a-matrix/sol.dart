class Solution {
  int oddCells(int m, int n, List<List<int>> indices) {
    List<List<int>> a = List.generate(m, (_) => List.filled(n, 0));
    int c = 0;
    for (var k in indices) {
      for (int u = 0; u < n; u++) {
        a[k[0]][u]++;
      }
      for (int l = 0; l < m; l++) {
        a[l][k[1]]++;
      }
    }
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (a[i][j] % 2 != 0) {
          c++;
        }
      }
    }
    return c;
  }
}
