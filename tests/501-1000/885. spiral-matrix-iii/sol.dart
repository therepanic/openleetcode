class Solution {
  List<List<int>> spiralMatrixIII(int rows, int cols, int rStart, int cStart) {
    int total = rows * cols;
    List<List<int>> res = [];
    res.add([rStart, cStart]);
    int top = rStart, bottom = rStart;
    int left = cStart, right = cStart;
    while (res.length < total) {
      right++;
      for (int i = left + 1; i <= right; i++) {
        if (top >= 0 && top < rows && i >= 0 && i < cols) {
          res.add([top, i]);
          if (res.length == total) return res;
        }
      }
      bottom++;
      for (int i = top + 1; i <= bottom; i++) {
        if (right >= 0 && right < cols && i >= 0 && i < rows) {
          res.add([i, right]);
          if (res.length == total) return res;
        }
      }
      left--;
      for (int i = right - 1; i >= left; i--) {
        if (i >= 0 && i < cols && bottom >= 0 && bottom < rows) {
          res.add([bottom, i]);
          if (res.length == total) return res;
        }
      }
      top--;
      for (int i = bottom - 1; i >= top; i--) {
        if (i >= 0 && i < rows && left >= 0 && left < cols) {
          res.add([i, left]);
          if (res.length == total) return res;
        }
      }
    }
    return res;
  }
}
