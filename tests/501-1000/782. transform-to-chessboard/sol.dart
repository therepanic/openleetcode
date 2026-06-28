class Solution {
  int movesToChessboard(List<List<int>> board) {
    int n = board.length;
    
    int fn(List<int> vals) {
      int total = 0;
      int odd = 0;
      for (int i = 0; i < vals.length; i++) {
        if (vals[0] == vals[i]) {
          total++;
          if ((i & 1) == 1) odd++;
        } else if (vals[0] ^ vals[i] != (1 << n) - 1) {
          return 1 << 30;
        }
      }
      int ans = 1 << 30;
      if (n <= 2 * total && 2 * total <= n + 1) {
        ans = ans < odd ? ans : odd;
      }
      if (n - 1 <= 2 * total && 2 * total <= n) {
        ans = ans < total - odd ? ans : total - odd;
      }
      return ans;
    }
    
    List<int> rows = List.filled(n, 0);
    List<int> cols = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (board[i][j] == 1) {
          rows[i] ^= 1 << j;
          cols[j] ^= 1 << i;
        }
      }
    }
    int ans = fn(rows) + fn(cols);
    return ans >= (1 << 30) ? -1 : ans;
  }
}
