class Solution {
  List<List<int>> matrixReshape(List<List<int>> mat, int r, int c) {
    int m = mat.length;
    int n = mat[0].length;
    if (m * n != r * c) {
      return mat;
    }
    
    List<List<int>> reshaped = List.generate(r, (_) => List.filled(c, 0));
    int count = 0;
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        reshaped[count ~/ c][count % c] = mat[i][j];
        count++;
      }
    }
    
    return reshaped;
  }
}
