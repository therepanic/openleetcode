public class Solution {
    public int MinDistance(string word1, string word2) {
        int n = word1.Length, m = word2.Length;
        int[,] dp = new int[n + 1, m + 1];

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (word1[i-1] == word2[j-1]) {
                    dp[i,j] = 1 + dp[i-1,j-1];
                } else {
                    dp[i,j] = Math.Max(dp[i-1,j], dp[i,j-1]);
                }
            }
        }
        
        return n + m - 2 * dp[n,m];
    }
}
