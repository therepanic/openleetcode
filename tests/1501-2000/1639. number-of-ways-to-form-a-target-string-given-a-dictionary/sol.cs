public class Solution {
    public int NumWays(string[] words, string target) {
        const int MOD = 1000000007;
        int m = words[0].Length;
        int[][] A = new int[m][];
        for (int i = 0; i < m; i++) A[i] = new int[26];
        foreach (string word in words) {
            for (int j = 0; j < m; j++) {
                A[j][word[j] - 'a']++;
            }
        }
        int[][] dp = new int[m][];
        for (int i = 0; i < m; i++) {
            dp[i] = new int[target.Length];
            for (int j = 0; j < target.Length; j++) dp[i][j] = -1;
        }

        Func<int,int,int> F = null;
        F = (i, j) => {
            if (j == target.Length) return 1;
            if (i == m) return 0;
            if (dp[i][j] != -1) return dp[i][j];

            long count = F(i + 1, j) % MOD;
            count = (count + (long)A[i][target[j] - 'a'] * F(i + 1, j + 1)) % MOD;
            dp[i][j] = (int)count;
            return (int)count;
        };
        return F(0, 0);
    }
}
