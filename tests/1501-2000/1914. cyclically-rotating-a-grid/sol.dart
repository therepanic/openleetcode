class Solution {
  List<List<int>> rotateGrid(List<List<int>> grid, int k) {
    var top = 0;
    var left = 0;
    var bottom = grid.length - 1;
    var right = grid[0].length - 1;

    while (top < bottom && left < right) {
      final perimeter = 2 * (bottom - top) + 2 * (right - left);
      var steps = k % perimeter;
      while (steps > 0) {
        final tmp = grid[top][left];
        for (var col = left; col < right; col++) {
          grid[top][col] = grid[top][col + 1];
        }
        for (var row = top; row < bottom; row++) {
          grid[row][right] = grid[row + 1][right];
        }
        for (var col = right; col > left; col--) {
          grid[bottom][col] = grid[bottom][col - 1];
        }
        for (var row = bottom; row > top; row--) {
          grid[row][left] = grid[row - 1][left];
        }
        grid[top + 1][left] = tmp;
        steps--;
      }
      top++;
      left++;
      bottom--;
      right--;
    }
    return grid;
  }
}
