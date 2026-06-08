class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    final res = <int>[];
    var top = 0;
    var bottom = matrix.length - 1;
    var left = 0;
    var right = matrix[0].length - 1;

    while (top <= bottom && left <= right) {
      for (var col = left; col <= right; col++) {
        res.add(matrix[top][col]);
      }
      top++;

      for (var row = top; row <= bottom; row++) {
        res.add(matrix[row][right]);
      }
      right--;

      if (top <= bottom) {
        for (var col = right; col >= left; col--) {
          res.add(matrix[bottom][col]);
        }
        bottom--;
      }

      if (left <= right) {
        for (var row = bottom; row >= top; row--) {
          res.add(matrix[row][left]);
        }
        left++;
      }
    }

    return res;
  }
}
