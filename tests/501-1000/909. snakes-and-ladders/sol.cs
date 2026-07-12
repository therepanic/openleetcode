public class Solution {
    public int SnakesAndLadders(int[][] board) {
        int n = board.Length;
        int[] minRolls = new int[n * n + 1];
        Array.Fill(minRolls, -1);
        Queue<int> q = new Queue<int>();
        minRolls[1] = 0;
        q.Enqueue(1);

        while (q.Count > 0) {
            int x = q.Dequeue();
            for (int i = 1; i <= 6; i++) {
                int t = x + i;
                if (t > n * n) break;
                int row = (t - 1) / n;
                int col = (t - 1) % n;
                int r = n - 1 - row;
                int c = (row % 2 == 1) ? (n - 1 - col) : col;
                int v = board[r][c];
                int y = v > 0 ? v : t;
                if (y == n * n) return minRolls[x] + 1;
                if (minRolls[y] == -1) {
                    minRolls[y] = minRolls[x] + 1;
                    q.Enqueue(y);
                }
            }
        }
        return -1;
    }
}
