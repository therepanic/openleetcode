class Solution {
  List<List<int>> reconstructMatrix(int upper, int lower, List<int> colsum) {
    int sum = colsum.fold(0, (a, b) => a + b);
    if (upper + lower != sum) return [];
    
    int n = colsum.length;
    List<int> row1 = List.filled(n, 0);
    List<int> row2 = List.filled(n, 0);
    
    for (int i = 0; i < n; i++) {
      if (colsum[i] == 2) {
        row1[i] = 1;
        row2[i] = 1;
        upper--;
        lower--;
      } else if (colsum[i] == 1) {
        if (upper > lower) {
          row1[i] = 1;
          upper--;
        } else {
          row2[i] = 1;
          lower--;
        }
      }
    }
    
    return lower == 0 && upper == 0 ? [row1, row2] : [];
  }
}
