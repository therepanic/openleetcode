class Solution {
  List<List<int>> matrixBlockSum(List<List<int>> mat, int k) {
    int n = mat.length, m = mat[0].length;
    List<List<int>> pre = List.generate(n, (_) => List.filled(m, 0));
    List<List<int>> ans = List.generate(n, (_) => List.filled(m, 0));
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        int sum = mat[i][j];
        if (i - 1 >= 0) sum += pre[i-1][j];
        if (j - 1 >= 0) sum += pre[i][j-1];
        if (i - 1 >= 0 && j - 1 >= 0) sum -= pre[i-1][j-1];
        pre[i][j] = sum;
      }
    }
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        int i1 = (0 > (i - k) ? 0 : (i - k));
        int i2 = (n - 1 < (i + k) ? n - 1 : (i + k));
        int j1 = (0 > (j - k) ? 0 : (j - k));
        int j2 = (m - 1 < (j + k) ? m - 1 : (j + k));
        int sum = pre[i2][j2];
        if (i1 - 1 >= 0) sum -= pre[i1-1][j2];
        if (j1 - 1 >= 0) sum -= pre[i2][j1-1];
        if (i1 - 1 >= 0 && j1 - 1 >= 0) sum += pre[i1-1][j1-1];
        ans[i][j] = sum;
      }
    }
    return ans;
  }
}
