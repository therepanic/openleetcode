class Solution {
public:
    double largestSumOfAverages(vector<int>& nums, int k) {
        int n = nums.size();
        vector<int> pref(n+1, 0);
        for (int i = 0; i < n; i++) {
            pref[i+1] = pref[i] + nums[i];
        }
        vector<vector<double>> dp(n+1, vector<double>(k+1, 0.0));
        for (int i = 1; i <= n; i++) {
            dp[i][1] = (double)pref[i] / i;
        }
        for (int p = 2; p <= k; p++) {
            for (int i = p; i <= n; i++) {
                double best = 0.0;
                for (int j = p-1; j < i; j++) {
                    double val = dp[j][p-1] + (double)(pref[i] - pref[j]) / (i - j);
                    if (val > best) best = val;
                }
                dp[i][p] = best;
            }
        }
        return dp[n][k];
    }
};
