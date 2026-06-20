class Solution {
public:
    int numberOfArithmeticSlices(vector<int>& nums) {
        int n = nums.size();
        int totalCount = 0;
        vector<unordered_map<long long, int>> dp(n);

        for (int i = 1; i < n; ++i) {
            for (int j = 0; j < i; ++j) {
                long long diff = (long long)nums[i] - nums[j];
                dp[i][diff]++;
                if (dp[j].count(diff)) {
                    int cnt = dp[j][diff];
                    dp[i][diff] += cnt;
                    totalCount += cnt;
                }
            }
        }

        return totalCount;
    }
};
