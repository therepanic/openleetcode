class Solution {
public:
    long long maxPoints(vector<vector<int>>& points) {
        int m = points.size();
        int n = points[0].size();
        
        vector<long long> dp(points[0].begin(), points[0].end());
        
        for (int r = 1; r < m; r++) {
            vector<long long> left(n, 0);
            vector<long long> right(n, 0);
            
            left[0] = dp[0];
            for (int c = 1; c < n; c++) {
                left[c] = max(left[c-1], dp[c] + c);
            }
            
            right[n-1] = dp[n-1] - (n-1);
            for (int c = n-2; c >= 0; c--) {
                right[c] = max(right[c+1], dp[c] - c);
            }
            
            vector<long long> new_dp(n, 0);
            for (int c = 0; c < n; c++) {
                long long best = max(left[c] - c, right[c] + c);
                new_dp[c] = points[r][c] + best;
            }
            dp = new_dp;
        }
        
        return *max_element(dp.begin(), dp.end());
    }
};
