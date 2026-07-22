class Solution {
public:
    int numberOfArrays(string s, int k) {
        const int mod = 1000000007;
        int n = s.size();
        vector<int> dp(n + 1, 0);
        dp[0] = 1;
        int width = to_string(k).size();
        for (int i = 0; i < n; i++) {
            if (s[i] == '0' || dp[i] == 0) continue;
            long long value = 0;
            for (int j = i; j < min(n, i + width); j++) {
                value = value * 10 + (s[j] - '0');
                if (value > k) break;
                dp[j + 1] = (dp[j + 1] + dp[i]) % mod;
            }
        }
        return dp[n];
    }
};
