class Solution {
public:
    int orderOfLargestPlusSign(int n, vector<vector<int>>& mines) {
        unordered_set<int> s;
        for (auto& mine : mines) {
            s.insert(mine[0] * n + mine[1]);
        }
        vector<vector<int>> dp(n, vector<int>(n, n));
        
        for (int i = 0; i < n; i++) {
            int count = 0;
            for (int j = 0; j < n; j++) {
                count = s.count(i * n + j) ? 0 : count + 1;
                dp[i][j] = min(dp[i][j], count);
            }
            count = 0;
            for (int j = n - 1; j >= 0; j--) {
                count = s.count(i * n + j) ? 0 : count + 1;
                dp[i][j] = min(dp[i][j], count);
            }
        }
        
        for (int j = 0; j < n; j++) {
            int count = 0;
            for (int i = 0; i < n; i++) {
                count = s.count(i * n + j) ? 0 : count + 1;
                dp[i][j] = min(dp[i][j], count);
            }
            count = 0;
            for (int i = n - 1; i >= 0; i--) {
                count = s.count(i * n + j) ? 0 : count + 1;
                dp[i][j] = min(dp[i][j], count);
            }
        }
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                ans = max(ans, dp[i][j]);
            }
        }
        return ans;
    }
};
