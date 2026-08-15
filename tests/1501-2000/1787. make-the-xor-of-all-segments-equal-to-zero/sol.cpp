class Solution {
public:
    int minChanges(vector<int>& nums, int k) {
        unordered_map<int, unordered_map<int, int>> freq;
        for (int i = 0; i < nums.size(); i++) {
            freq[i % k][nums[i]]++;
        }
        
        int n = 1 << 10;
        vector<int> dp(n, INT_MIN);
        dp[0] = 0;
        for (int i = 0; i < k; i++) {
            int mx = *max_element(dp.begin(), dp.end());
            vector<int> tmp(n, 0);
            for (int x = 0; x < n; x++) {
                int c = dp[x];
                if (freq.count(i)) {
                    for (auto& [xx, cc] : freq[i]) {
                        int idx = x ^ xx;
                        tmp[idx] = max({tmp[idx], c + cc, mx});
                    }
                }
            }
            dp = tmp;
        }
        return nums.size() - dp[0];
    }
};
