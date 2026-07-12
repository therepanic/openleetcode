class Solution {
public:
    int longestArithSeqLength(vector<int>& nums) {
        int n = nums.size();
        if (n <= 2) return n;
        vector<unordered_map<int, int>> dp(n);
        int ans = 2;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                int d = nums[i] - nums[j];
                int prev = dp[j].count(d) ? dp[j][d] : 1;
                dp[i][d] = max(dp[i][d], prev + 1);
                ans = max(ans, dp[i][d]);
            }
        }
        return ans;
    }
};
