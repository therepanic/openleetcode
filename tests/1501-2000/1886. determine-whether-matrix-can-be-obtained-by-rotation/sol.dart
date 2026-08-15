class Solution {
  bool findRotation(List<List<int>> mat, List<List<int>> target) {
    for (int i = 0; i < 4; i++) {
      if (mat.toString() == target.toString()) return true;
      mat = rotate(mat);
    }
    return false;
  }
  
  List<List<int>> rotate(List<List<int>> mat) {
    int n = mat.length;
    List<List<int>> res = List.generate(n, (_) => List.filled(n, 0));
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        res[j][n - 1 - i] = mat[i][j];
      }
    }
    return res;
  }
}
