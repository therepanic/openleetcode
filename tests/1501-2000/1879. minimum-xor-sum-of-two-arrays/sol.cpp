class Solution {
public:
    int minimumXORSum(vector<int>& nums1, vector<int>& nums2) {
        int n = nums1.size();
        int fullMask = 1 << n;
        vector<int> dp(fullMask, 2147483647);
        dp[0] = 0;
        for (int mask = 0; mask < fullMask; mask++) {
            int idx = __builtin_popcount(mask);
            if (idx >= n) continue;
            for (int j = 0; j < n; j++) {
                if ((mask & (1 << j)) == 0) {
                    int nextMask = mask | (1 << j);
                    int cost = dp[mask] + (nums1[idx] ^ nums2[j]);
                    if (cost < dp[nextMask]) {
                        dp[nextMask] = cost;
                    }
                }
            }
        }
        return dp[fullMask - 1];
    }
};
