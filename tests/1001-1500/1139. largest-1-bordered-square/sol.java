class Solution {
    public int largest1BorderedSquare(int[][] grid) {
        int m = grid.length, n = grid[0].length;
        int[][] h = new int[m][n];
        int[][] v = new int[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 1) {
                    h[i][j] = (j == 0 ? 0 : h[i][j-1]) + 1;
                    v[i][j] = (i == 0 ? 0 : v[i-1][j]) + 1;
                }
            }
        }
        int ans = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int sz = Math.min(h[i][j], v[i][j]);
                for (int k = sz; k >= 1; k--) {
                    if (h[i-k+1][j] >= k && v[i][j-k+1] >= k) {
                        ans = Math.max(ans, k);
                        break;
                    }
                }
            }
        }
        return ans * ans;
    }
}
