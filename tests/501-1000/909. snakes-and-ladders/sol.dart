class Solution {
  int snakesAndLadders(List<List<int>> board) {
    int n = board.length;
    List<int> minRolls = List.filled(n * n + 1, -1);
    Queue<int> q = Queue<int>();
    minRolls[1] = 0;
    q.add(1);

    while (q.isNotEmpty) {
      int x = q.removeFirst();
      for (int i = 1; i <= 6; i++) {
        int t = x + i;
        if (t > n * n) break;
        int row = (t - 1) ~/ n;
        int col = (t - 1) % n;
        int r = n - 1 - row;
        int c = (row % 2 == 1) ? (n - 1 - col) : col;
        int v = board[r][c];
        int y = v > 0 ? v : t;
        if (y == n * n) return minRolls[x] + 1;
        if (minRolls[y] == -1) {
          minRolls[y] = minRolls[x] + 1;
          q.add(y);
        }
      }
    }
    return -1;
  }
}
