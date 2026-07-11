public class Solution {
    public int MinFallingPathSum(int[][] matrix) {
        int m = matrix.Length;
        int n = matrix[0].Length;
        int[] dp = (int[])matrix[0].Clone();
        for (int i = 1; i < m; i++) {
            int[] ndp = new int[n];
            for (int j = 0; j < n; j++) {
                int best = dp[j];
                if (j > 0) best = Math.Min(best, dp[j - 1]);
                if (j + 1 < n) best = Math.Min(best, dp[j + 1]);
                ndp[j] = matrix[i][j] + best;
            }
            dp = ndp;
        }
        int ans = dp[0];
        foreach (int v in dp) {
            if (v < ans) ans = v;
        }
        return ans;
    }
}
