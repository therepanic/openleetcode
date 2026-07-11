class Solution {
public:
    int distinctSubseqII(string s) {
        int n = s.length();
        const int mod = 1000000007;
        vector<long long> dp(n, 0);
        dp[0] = 2;
        unordered_map<char, int> mp;
        mp[s[0]] = 0;
        for (int i = 1; i < n; i++) {
            dp[i] = (2 * dp[i-1]) % mod;
            if (mp.find(s[i]) != mp.end()) {
                int idx = mp[s[i]];
                dp[i] -= (idx > 0 ? dp[idx-1] : 1);
                if (dp[i] < 0) dp[i] += mod;
            }
            mp[s[i]] = i;
            dp[i] %= mod;
        }
        return (dp[n-1] - 1 + mod) % mod;
    }
};
