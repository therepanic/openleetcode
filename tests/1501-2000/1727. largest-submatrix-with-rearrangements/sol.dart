class Solution {
  int largestSubmatrix(List<List<int>> matrix) {
    int m = matrix.length;
    int n = matrix[0].length;
    int maxArea = 0;
    List<int> h = List.filled(n, 0);
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (j < matrix[i].length && matrix[i][j] == 1) {
          h[j]++;
        } else {
          h[j] = 0;
        }
      }
      List<int> sh = List.from(h)..sort((a, b) => b.compareTo(a));
      for (int j = 0; j < n; j++) {
        if (sh[j] == 0) break;
        maxArea = maxArea > sh[j] * (j + 1) ? maxArea : sh[j] * (j + 1);
      }
    }
    return maxArea;
  }
}
