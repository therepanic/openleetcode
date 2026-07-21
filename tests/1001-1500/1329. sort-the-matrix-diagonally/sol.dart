class Solution {
  List<List<int>> diagonalSort(List<List<int>> mat) {
    int m = mat.length, n = mat[0].length;
    Map<int, List<int>> diagonals = {};
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int key = i - j;
        diagonals.putIfAbsent(key, () => []);
        diagonals[key]!.add(mat[i][j]);
      }
    }
    
    for (var list in diagonals.values) {
      list.sort((a, b) => b.compareTo(a));
    }
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        mat[i][j] = diagonals[i - j]!.removeLast();
      }
    }
    
    return mat;
  }
}
