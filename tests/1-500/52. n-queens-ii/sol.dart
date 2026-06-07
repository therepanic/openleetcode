class Solution {
  int totalNQueens(int n) {
    var count = 0;
    final cols = List.filled(n, false);
    final diag1 = List.filled(2 * n, false);
    final diag2 = List.filled(2 * n, false);

    void backtrack(int row) {
      if (row == n) {
        count++;
        return;
      }
      for (var col = 0; col < n; col++) {
        final d1 = row + col;
        final d2 = row - col + n - 1;
        if (cols[col] || diag1[d1] || diag2[d2]) continue;
        cols[col] = true;
        diag1[d1] = true;
        diag2[d2] = true;
        backtrack(row + 1);
        cols[col] = false;
        diag1[d1] = false;
        diag2[d2] = false;
      }
    }

    backtrack(0);
    return count;
  }
}
