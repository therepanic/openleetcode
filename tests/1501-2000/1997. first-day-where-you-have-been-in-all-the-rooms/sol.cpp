class Solution {
public:
    int firstDayBeenInAllRooms(vector<int>& nextVisit) {
        const int MOD = 1'000'000'007;
        int n = nextVisit.size();
        vector<long long> dp(n, 0);

        for (int i = 1; i < n; i++) {
            dp[i] = (2 * dp[i-1] - dp[nextVisit[i-1]] + 2 + MOD) % MOD;
        }
        
        return (int) dp[n-1];
    }
};
