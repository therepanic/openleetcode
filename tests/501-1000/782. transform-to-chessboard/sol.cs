public class Solution {
    public int MovesToChessboard(int[][] board) {
        int n = board.Length;
        
        int Fn(int[] vals) {
            int total = 0, odd = 0;
            for (int i = 0; i < n; i++) {
                if (vals[0] == vals[i]) {
                    total++;
                    if ((i & 1) == 1) odd++;
                } else if ((vals[0] ^ vals[i]) != (1 << n) - 1) {
                    return int.MaxValue / 2;
                }
            }
            int ans = int.MaxValue / 2;
            if (n <= 2 * total && 2 * total <= n + 1) {
                ans = Math.Min(ans, odd);
            }
            if (n - 1 <= 2 * total && 2 * total <= n) {
                ans = Math.Min(ans, total - odd);
            }
            return ans;
        }
        
        int[] rows = new int[n];
        int[] cols = new int[n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (board[i][j] == 1) {
                    rows[i] ^= 1 << j;
                    cols[j] ^= 1 << i;
                }
            }
        }
        int ans = Fn(rows) + Fn(cols);
        return ans >= int.MaxValue / 2 ? -1 : ans;
    }
}
