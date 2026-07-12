public class Solution {
    public int DistinctSubseqII(string s) {
        int n = s.Length;
        int mod = 1000000007;
        long[] dp = new long[n];
        dp[0] = 2;
        Dictionary<char, int> mp = new Dictionary<char, int>();
        mp[s[0]] = 0;
        for (int i = 1; i < n; i++) {
            dp[i] = (2 * dp[i-1]) % mod;
            if (mp.ContainsKey(s[i])) {
                int idx = mp[s[i]];
                dp[i] -= idx > 0 ? dp[idx-1] : 1;
                if (dp[i] < 0) dp[i] += mod;
            }
            mp[s[i]] = i;
            dp[i] %= mod;
        }
        return (int)((dp[n-1] - 1 + mod) % mod);
    }
}
