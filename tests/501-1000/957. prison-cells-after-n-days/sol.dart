class Solution {
  List<int> prisonAfterNDays(List<int> cells, int n) {
    n = (n - 1) % 14 + 1;
    for (int day = 0; day < n; day++) {
      int prev = cells[0];
      for (int i = 1; i < cells.length - 1; i++) {
        int current = cells[i];
        cells[i] = (prev == cells[i + 1]) ? 1 : 0;
        prev = current;
      }
      cells[0] = 0;
      cells[cells.length - 1] = 0;
    }
    return cells;
  }
}
