class Solution {
  int maxCount(int m, int n, List<List<int>> ops) {
    if (ops.isEmpty) {
      return m * n;
    }
    for (var op in ops) {
      m = m < op[0] ? m : op[0];
      n = n < op[1] ? n : op[1];
    }
    return m * n;
  }
}
