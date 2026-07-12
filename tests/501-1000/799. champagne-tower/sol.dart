class Solution {
  double champagneTower(int poured, int queryRow, int queryGlass) {
    List<List<double>> tower =
        List.generate(102, (_) => List.filled(102, 0.0));
    tower[0][0] = poured.toDouble();

    for (int r = 0; r <= queryRow; r++) {
      for (int c = 0; c <= r; c++) {
        if (tower[r][c] > 1.0) {
          double excess = (tower[r][c] - 1.0) / 2.0;
          tower[r][c] = 1.0;
          tower[r + 1][c] += excess;
          tower[r + 1][c + 1] += excess;
        }
      }
    }

    return tower[queryRow][queryGlass];
  }
}
