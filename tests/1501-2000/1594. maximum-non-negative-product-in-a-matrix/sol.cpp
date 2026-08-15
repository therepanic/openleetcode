class Solution {
public:
    int maxProductPath(vector<vector<int>>& grid) {
        int r = grid.size(), c = grid[0].size();
        const int MOD = 1e9 + 7;
        vector<vector<vector<long long>>> dp(r, vector<vector<long long>>(c, vector<long long>(2)));
        
        long long p = grid[0][0];
        dp[0][0][0] = dp[0][0][1] = p;
        for (int j = 1; j < c; j++) {
            p *= grid[0][j];
            dp[0][j][0] = dp[0][j][1] = p;
        }
        
        p = grid[0][0];
        for (int i = 1; i < r; i++) {
            p *= grid[i][0];
            dp[i][0][0] = dp[i][0][1] = p;
            for (int j = 1; j < c; j++) {
                long long x = grid[i][j];
                long long vals[4] = {x * dp[i][j-1][0], x * dp[i][j-1][1], x * dp[i-1][j][0], x * dp[i-1][j][1]};
                long long mn = vals[0], mx = vals[0];
                for (int k = 1; k < 4; k++) {
                    mn = min(mn, vals[k]);
                    mx = max(mx, vals[k]);
                }
                dp[i][j][0] = mn;
                dp[i][j][1] = mx;
            }
        }
        
        long long ans = dp[r-1][c-1][1];
        if (ans < 0) return -1;
        return ans % MOD;
    }
};
