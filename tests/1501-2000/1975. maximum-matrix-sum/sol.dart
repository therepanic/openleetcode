class Solution {
  int maxMatrixSum(List<List<int>> matrix) {
    int totalSum = 0;
    int neg = 0;
    int minAbs = 1 << 31; // large
    for (var row in matrix) {
      for (var v in row) {
        if (v < 0) neg++;
        int av = v.abs();
        totalSum += av;
        if (av < minAbs) minAbs = av;
      }
    }
    return neg % 2 == 0 ? totalSum : totalSum - 2 * minAbs;
  }
}
