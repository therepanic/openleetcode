public class Solution {
    public int MinDeletionSize(string[] strs) {
        int m = strs[0].Length;
        int[] dp = new int[m];
        for (int i = 0; i < m; i++) {
            dp[i] = 1;
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < i; j++) {
                bool all = true;
                foreach (string row in strs) {
                    if (row[j] > row[i]) {
                        all = false;
                        break;
                    }
                }
                if (all) {
                    dp[i] = Math.Max(dp[i], dp[j] + 1);
                }
            }
        }
        
        int maxDp = 0;
        for (int i = 0; i < m; i++) {
            if (dp[i] > maxDp) {
                maxDp = dp[i];
            }
        }
        return m - maxDp;
    }
}
