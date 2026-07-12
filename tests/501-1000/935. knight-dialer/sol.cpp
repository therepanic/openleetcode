class Solution {
public:
    int knightDialer(int n) {
        if (n == 1) {
            return 10;
        }
        
        vector<int> dp(10, 1);
        vector<vector<int>> mapping = {
            {4, 6},
            {6, 8},
            {7, 9},
            {4, 8},
            {0, 3, 9},
            {},
            {0, 1, 7},
            {2, 6},
            {1, 3},
            {2, 4}
        };
        
        const int MOD = 1000000007;
        
        for (int step = 0; step < n - 1; step++) {
            vector<int> newDp(10, 0);
            for (int i = 0; i < 10; i++) {
                for (int digit : mapping[i]) {
                    newDp[digit] = (newDp[digit] + dp[i]) % MOD;
                }
            }
            dp = newDp;
        }
        
        int sum = 0;
        for (int val : dp) {
            sum = (sum + val) % MOD;
        }
        return sum;
    }
};
