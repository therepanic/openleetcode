class Solution {
public:
    int numPermsDISequence(string s) {
        int n = s.size();
        const int MOD = 1000000007;
        vector<int> dp = {1};
        for (int i = 1; i <= n; i++) {
            vector<int> prefix(i + 1);
            prefix[0] = dp[0];
            for (int j = 1; j < i; j++) {
                prefix[j] = (prefix[j-1] + dp[j]) % MOD;
            }
            prefix[i] = prefix[i-1] % MOD;
            vector<int> ndp(i + 1);
            if (s[i-1] == 'I') {
                for (int j = 0; j <= i; j++) {
                    ndp[j] = j > 0 ? prefix[j-1] % MOD : 0;
                }
            } else {
                for (int j = 0; j <= i; j++) {
                    ndp[j] = (prefix[i-1] - (j > 0 ? prefix[j-1] : 0)) % MOD;
                    if (ndp[j] < 0) ndp[j] += MOD;
                }
            }
            dp = ndp;
        }
        int sum = 0;
        for (int v : dp) sum = (sum + v) % MOD;
        return sum;
    }
};
