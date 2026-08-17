class Solution {
  int kthLargestValue(List<List<int>> matrix, int k) {
    int n = matrix.length;
    int m = matrix[0].length;
    List<List<int>> temp = List.generate(n, (_) => List.filled(m, 0));
    temp[0][0] = matrix[0][0];
    for (int j = 1; j < m; j++) {
      temp[0][j] = temp[0][j-1] ^ matrix[0][j];
    }
    for (int i = 1; i < n; i++) {
      temp[i][0] = temp[i-1][0] ^ matrix[i][0];
    }
    for (int i = 1; i < n; i++) {
      for (int j = 1; j < m; j++) {
        temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1];
      }
    }
    List<int> arr = [];
    for (var row in temp) {
      arr.addAll(row);
    }
    arr.sort((a, b) => b.compareTo(a));
    return arr[k-1];
  }
}
