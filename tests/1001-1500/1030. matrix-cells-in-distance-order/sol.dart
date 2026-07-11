class Solution {
  List<List<int>> allCellsDistOrder(int rows, int cols, int rCenter, int cCenter) {
    List<List<int>> result = [];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        result.add([r, c]);
      }
    }
    result.sort((a, b) {
      int d1 = (a[0] - rCenter).abs() + (a[1] - cCenter).abs();
      int d2 = (b[0] - rCenter).abs() + (b[1] - cCenter).abs();
      if (d1 != d2) return d1.compareTo(d2);
      if (a[0] != b[0]) return a[0].compareTo(b[0]);
      return a[1].compareTo(b[1]);
    });
    return result;
  }
}
