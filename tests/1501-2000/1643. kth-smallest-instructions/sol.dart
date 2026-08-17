class Solution {
  String kthSmallestPath(List<int> destination, int k) {
    int rows = destination[0];
    int cols = destination[1];
    List<String> path = [];
    int kLocal = k - 1;

    while (rows > 0 || cols > 0) {
      int pathsWithH = 0;
      if (cols > 0) {
        pathsWithH = combination(rows + cols - 1, cols - 1);
      }

      if (kLocal < pathsWithH) {
        path.add('H');
        cols--;
      } else {
        path.add('V');
        kLocal -= pathsWithH;
        rows--;
      }
    }
    return path.join();
  }

  int combination(int n, int r) {
    if (r == 0 || r == n) return 1;
    r = r > n - r ? n - r : r;
    int result = 1;
    for (int i = 1; i <= r; i++) {
      result = result * (n - r + i) ~/ i;
    }
    return result;
  }
}
