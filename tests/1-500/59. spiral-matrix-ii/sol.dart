class Solution {
  List<List<int>> generateMatrix(int n) {
    final res = List.generate(n, (_) => List.filled(n, 0));
    var top = 0;
    var bottom = n - 1;
    var left = 0;
    var right = n - 1;
    var val = 1;

    while (top <= bottom && left <= right) {
      for (var col = left; col <= right; col++) {
        res[top][col] = val++;
      }
      top++;

      for (var row = top; row <= bottom; row++) {
        res[row][right] = val++;
      }
      right--;

      if (top <= bottom) {
        for (var col = right; col >= left; col--) {
          res[bottom][col] = val++;
        }
        bottom--;
      }

      if (left <= right) {
        for (var row = bottom; row >= top; row--) {
          res[row][left] = val++;
        }
        left++;
      }
    }

    return res;
  }
}
