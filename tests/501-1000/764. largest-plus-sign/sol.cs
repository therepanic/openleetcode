public class Solution {
    public int OrderOfLargestPlusSign(int n, int[][] mines) {
        HashSet<int> s = new HashSet<int>();
        foreach (var mine in mines) {
            s.Add(mine[0] * n + mine[1]);
        }
        int[][] dp = new int[n][];
        for (int i = 0; i < n; i++) {
            dp[i] = new int[n];
            for (int j = 0; j < n; j++) {
                dp[i][j] = n;
            }
        }
        
        for (int i = 0; i < n; i++) {
            int count = 0;
            for (int j = 0; j < n; j++) {
                count = s.Contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.Min(dp[i][j], count);
            }
            count = 0;
            for (int j = n - 1; j >= 0; j--) {
                count = s.Contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.Min(dp[i][j], count);
            }
        }
        
        for (int j = 0; j < n; j++) {
            int count = 0;
            for (int i = 0; i < n; i++) {
                count = s.Contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.Min(dp[i][j], count);
            }
            count = 0;
            for (int i = n - 1; i >= 0; i--) {
                count = s.Contains(i * n + j) ? 0 : count + 1;
                dp[i][j] = Math.Min(dp[i][j], count);
            }
        }
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                ans = Math.Max(ans, dp[i][j]);
            }
        }
        return ans;
    }
}
