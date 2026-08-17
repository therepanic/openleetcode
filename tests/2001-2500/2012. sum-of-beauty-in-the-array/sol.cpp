class Solution {
public:
    int sumOfBeauties(vector<int>& nums) {
        int n = nums.size();
        vector<int> prefix(n), suffix(n);
        prefix[0] = nums[0];
        suffix[n-1] = nums[n-1];
        for (int i = 1; i < n; i++) {
            prefix[i] = max(nums[i-1], prefix[i-1]);
        }
        for (int i = n-2; i >= 0; i--) {
            suffix[i] = min(nums[i+1], suffix[i+1]);
        }
        int ans = 0;
        for (int i = 1; i < n-1; i++) {
            if (prefix[i] < nums[i] && nums[i] < suffix[i]) {
                ans += 2;
            } else if (nums[i-1] < nums[i] && nums[i] < nums[i+1]) {
                ans += 1;
            }
        }
        return ans;
    }
};
