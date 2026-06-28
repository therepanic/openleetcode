class Solution {
    public int movesToChessboard(int[][] board) {
        int n = board.length;
        
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
        
        int ans = fn(rows, n) + fn(cols, n);
        return ans >= Integer.MAX_VALUE / 2 ? -1 : ans;
    }
    
    private int fn(int[] vals, int n) {
        int total = 0;
        int odd = 0;
        for (int i = 0; i < vals.length; i++) {
            if (vals[0] == vals[i]) {
                total++;
                if ((i & 1) == 1) odd++;
            } else if ((vals[0] ^ vals[i]) != (1 << n) - 1) {
                return Integer.MAX_VALUE / 2;
            }
        }
        int ans = Integer.MAX_VALUE / 2;
        if (n <= 2 * total && 2 * total <= n + 1) {
            ans = Math.min(ans, odd);
        }
        if (n - 1 <= 2 * total && 2 * total <= n) {
            ans = Math.min(ans, total - odd);
        }
        return ans;
    }
}
