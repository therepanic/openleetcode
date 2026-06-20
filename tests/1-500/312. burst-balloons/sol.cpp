class Solution {
public:
    int maxCoins(vector<int>& nums) {
        vector<int> balloons;
        balloons.push_back(1);
        balloons.insert(balloons.end(), nums.begin(), nums.end());
        balloons.push_back(1);
        int n = balloons.size();
        vector<vector<int>> dp(n, vector<int>(n, 0));
        
        for (int length = 2; length < n; length++) {
            for (int left = 0; left < n - length; left++) {
                int right = left + length;
                int best = 0;
                for (int k = left + 1; k < right; k++) {
                    int gain = balloons[left] * balloons[k] * balloons[right];
                    int total = gain + dp[left][k] + dp[k][right];
                    if (total > best) {
                        best = total;
                    }
                }
                dp[left][right] = best;
            }
        }
        
        return dp[0][n-1];
    }
};
