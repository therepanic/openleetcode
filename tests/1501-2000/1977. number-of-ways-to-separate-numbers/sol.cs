public class Solution {
    public int NumberOfCombinations(string num) {
        int n = num.Length;
        const int MOD = 1000000007;
        long[,] dp = new long[n, n + 1];
        for (int i = 0; i < n; i++) {
            if (num[i] != '0') {
                for (int j = i + 1; j <= n; j++) {
                    if (i == 0) {
                        dp[i, j] = 1;
                    } else {
                        int length = j - i;
                        dp[i, j] = dp[i, j - 1];
                        if (i - length >= 0 && string.CompareOrdinal(num.Substring(i - length, length), num.Substring(i, length)) <= 0) {
                            dp[i, j] += dp[i - length, i];
                        }
                        if (i - length + 1 >= 0 && string.CompareOrdinal(num.Substring(i - length + 1, length - 1), num.Substring(i, length - 1)) > 0) {
                            dp[i, j] += dp[i - length + 1, i];
                        }
                        dp[i, j] %= MOD;
                    }
                }
            }
        }
        long ans = 0;
        for (int i = 0; i < n; i++) {
            ans = (ans + dp[i, n]) % MOD;
        }
        return (int)ans;
    }
}
