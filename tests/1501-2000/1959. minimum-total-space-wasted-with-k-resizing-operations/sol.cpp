class Solution {
public:
    int minSpaceWastedKResizing(vector<int>& nums, int k) {
        int n = nums.size();
        vector<int> P(n + 1, 0);
        for (int i = 0; i < n; i++) {
            P[i+1] = P[i] + nums[i];
        }
        const int INF = 1000000000;
        vector<int> dp(n + 1, INF);
        int max_v = 0;
        for (int i = 1; i <= n; i++) {
            max_v = max(max_v, nums[i-1]);
            dp[i] = max_v * i - P[i];
        }
        for (int t = 0; t < k; t++) {
            vector<int> new_dp(n + 1, INF);
            new_dp[0] = 0;
            for (int i = 1; i <= n; i++) {
                int cur_max = 0;
                for (int j = i - 1; j >= 0; j--) {
                    cur_max = max(cur_max, nums[j]);
                    int waste = cur_max * (i - j) - (P[i] - P[j]);
                    if (dp[j] != INF) new_dp[i] = min(new_dp[i], dp[j] + waste);
                }
            }
            dp = new_dp;
        }
        return dp[n];
    }
};
