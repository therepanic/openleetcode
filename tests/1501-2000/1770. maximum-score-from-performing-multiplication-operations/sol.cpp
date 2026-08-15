class Solution {
public:
    int maximumScore(vector<int>& nums, vector<int>& multipliers) {
        int m = multipliers.size();
        vector<vector<int>> dp(m + 1, vector<int>(m + 1, -1));
        
        function<int(int, int)> f = [&](int i, int j) -> int {
            int k = i + j;
            if (k == m) return 0;
            if (dp[i][j] != -1) return dp[i][j];
            
            int back = multipliers[k] * nums[nums.size() - 1 - j] + f(i, j + 1);
            int front = multipliers[k] * nums[i] + f(i + 1, j);
            dp[i][j] = max(front, back);
            return dp[i][j];
        };
        
        return f(0, 0);
    }
};
