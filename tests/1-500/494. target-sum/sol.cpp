class Solution {
public:
    int findTargetSumWays(vector<int>& nums, int target) {
        int total = 0;
        for (int num : nums) total += num;
        if (abs(target) > total || (target + total) % 2 != 0) return 0;
        int sum = (target + total) / 2;
        vector<int> dp(sum + 1, 0);
        dp[0] = 1;

        for (int num : nums) {
            for (int j = sum; j >= num; j--) {
                dp[j] += dp[j - num];
            }
        }

        return dp[sum];
    }
};
