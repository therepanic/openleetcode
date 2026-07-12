class Solution {
    public int distinctSubseqII(String s) {
        int n = s.length();
        int mod = 1000000007;
        int[] dp = new int[n];
        dp[0] = 2;
        int[] mp = new int[26];
        for (int i = 0; i < 26; i++) mp[i] = -1;
        mp[s.charAt(0) - 'a'] = 0;
        for (int i = 1; i < n; i++) {
            dp[i] = (2 * dp[i-1]) % mod;
            int idx = s.charAt(i) - 'a';
            if (mp[idx] != -1) {
                dp[i] -= (mp[idx] > 0 ? dp[mp[idx]-1] : 1);
                if (dp[i] < 0) dp[i] += mod;
            }
            mp[idx] = i;
            dp[i] %= mod;
        }
        return (dp[n-1] - 1 + mod) % mod;
    }
}
