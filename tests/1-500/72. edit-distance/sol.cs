public class Solution {
    public int MinDistance(string word1, string word2) {
        int m = word1.Length;
        int n = word2.Length;
        int[] dp = new int[n + 1];
        for (int j = 0; j <= n; j++) {
            dp[j] = j;
        }

        for (int i = 1; i <= m; i++) {
            int prev = dp[0];
            dp[0] = i;
            for (int j = 1; j <= n; j++) {
                int temp = dp[j];
                if (word1[i - 1] == word2[j - 1]) {
                    dp[j] = prev;
                } else {
                    dp[j] = 1 + System.Math.Min(prev, System.Math.Min(dp[j], dp[j - 1]));
                }
                prev = temp;
            }
        }

        return dp[n];
    }
}
