class Solution {
  int maxSizeSlices(List<int> slices) {
    int n = slices.length;
    int m = n ~/ 3;

    int dp(List<int> slicesSubset) {
      int k = slicesSubset.length;
      List<List<int>> dpTable = List.generate(k + 1, (_) => List.filled(m + 1, 0));
      for (int i = 1; i <= k; i++) {
        for (int j = 1; j <= (i < m ? i : m); j++) {
          final take = (i > 1 ? dpTable[i - 2][j - 1] : 0) + slicesSubset[i - 1];
          dpTable[i][j] = max(dpTable[i - 1][j], take);
        }
      }
      return dpTable[k][m];
    }

    return max(dp(slices.sublist(0, n - 1)), dp(slices.sublist(1)));
  }

  int max(int a, int b) => a > b ? a : b;
}
