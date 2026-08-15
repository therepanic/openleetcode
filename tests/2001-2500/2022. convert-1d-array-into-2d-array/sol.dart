class Solution {
  List<List<int>> construct2DArray(List<int> original, int m, int n) {
    int k = original.length;
    if (m * n != k) return [];
    List<List<int>> ans = List.generate(m, (_) => List.filled(n, 0));
    int idx = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        ans[i][j] = original[idx++];
      }
    }
    return ans;
  }
}
