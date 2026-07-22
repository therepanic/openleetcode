public class Solution {
    public int Largest1BorderedSquare(int[][] grid) {
        int m = grid.Length, n = grid[0].Length;
        int[][] h = new int[m][];
        int[][] v = new int[m][];
        for (int i = 0; i < m; i++) {
            h[i] = new int[n];
            v[i] = new int[n];
        }
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
                int sz = Math.Min(h[i][j], v[i][j]);
                for (int k = sz; k >= 1; k--) {
                    if (h[i-k+1][j] >= k && v[i][j-k+1] >= k) {
                        ans = Math.Max(ans, k);
                        break;
                    }
                }
            }
        }
        return ans * ans;
    }
}
