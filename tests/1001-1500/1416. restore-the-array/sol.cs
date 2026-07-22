public class Solution {
    public int NumberOfArrays(string s, int k) {
        int mod = 1000000007;
        int n = s.Length;
        int[] dp = new int[n + 1];
        dp[0] = 1;
        int width = k.ToString().Length;
        for (int i = 0; i < n; i++) {
            if (s[i] == '0' || dp[i] == 0) continue;
            long value = 0;
            for (int j = i; j < Math.Min(n, i + width); j++) {
                value = value * 10 + (s[j] - '0');
                if (value > k) break;
                dp[j + 1] = (dp[j + 1] + dp[i]) % mod;
            }
        }
        return dp[n];
    }
}
