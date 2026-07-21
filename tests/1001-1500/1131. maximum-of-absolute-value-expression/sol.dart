class Solution {
  int maxAbsValExpr(List<int> arr1, List<int> arr2) {
    int res = 0;
    int n = arr1.length;
    List<List<int>> signs = [[1, 1], [1, -1], [-1, 1], [-1, -1]];

    for (var sign in signs) {
      int p = sign[0], q = sign[1];
      int maxVal = -1000000000;
      int minVal = 1000000000;
      for (int i = 0; i < n; i++) {
        int value = p * arr1[i] + q * arr2[i] + i;
        if (value > maxVal) maxVal = value;
        if (value < minVal) minVal = value;
      }
      if (maxVal - minVal > res) res = maxVal - minVal;
    }

    return res;
  }
}
