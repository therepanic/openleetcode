class Solution {
public:
    vector<int> getMaximumXor(vector<int>& nums, int maximumBit) {
        int n = nums.size();
        vector<int> ans(n);
        int mask = (1 << maximumBit) - 1;
        int curr = 0;
        for (int i = 0; i < n; i++) {
            curr ^= nums[i];
            ans[n - 1 - i] = mask ^ curr;
        }
        return ans;
    }
};
