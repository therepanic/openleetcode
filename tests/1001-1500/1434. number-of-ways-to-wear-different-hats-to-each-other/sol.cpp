class Solution {
public:
    int numberWays(vector<vector<int>>& hats) {
        const int MOD = 1'000'000'007;
        int n = hats.size();
        vector<vector<int>> likedByHat(41);
        for (int person = 0; person < n; person++) {
            for (int hat : hats[person]) {
                likedByHat[hat].push_back(person);
            }
        }
        
        vector<int> dp(1 << n, 0);
        dp[0] = 1;
        for (int hat = 1; hat <= 40; hat++) {
            vector<int> updated = dp;
            for (int mask = 0; mask < (1 << n); mask++) {
                if (dp[mask] == 0) continue;
                for (int person : likedByHat[hat]) {
                    int personBit = 1 << person;
                    if ((mask & personBit) == 0) {
                        int target = mask | personBit;
                        updated[target] = (updated[target] + dp[mask]) % MOD;
                    }
                }
            }
            dp = updated;
        }
        return dp[(1 << n) - 1];
    }
};
