class Solution {
public:
    int rearrangeSticks(int n, int k) {
        const int mod = 1000000007;
        vector<int> dp(k + 1, 0);
        dp[0] = 1;
        for (int length = 1; length <= n; ++length) {
            vector<int> nxt(k + 1, 0);
            for (int visible = 1; visible <= min(length, k); ++visible) {
                nxt[visible] = (dp[visible - 1] + (long long)(length - 1) * dp[visible]) % mod;
            }
            dp = nxt;
        }
        return dp[k];
    }
};
