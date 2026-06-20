class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        int prevIdx = -1;
        vector<vector<int>> dp(2500, vector<int>(2500, -1));
        return helper(0, prevIdx, nums, dp);
    }

private:
    int helper(int i, int prevIdx, vector<int>& nums, vector<vector<int>>& dp) {
        if (i >= nums.size()) {
            return 0;
        }
        if (dp[i][prevIdx + 1] != -1) {
            return dp[i][prevIdx + 1];
        }
        int steal = 0;
        int skip = 0;
        if (prevIdx == -1 || nums[prevIdx] < nums[i]) {
            steal = 1 + helper(i + 1, i, nums, dp);
        }
        skip = helper(i + 1, prevIdx, nums, dp);
        dp[i][prevIdx + 1] = max(steal, skip);
        return max(steal, skip);
    }
};
