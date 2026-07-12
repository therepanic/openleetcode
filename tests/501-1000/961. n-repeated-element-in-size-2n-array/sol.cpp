class Solution {
public:
    int repeatedNTimes(vector<int>& nums) {
        int n = nums.size() - 2;
        for (int i = 0; i < n; i++) {
            if (nums[i] == nums[i + 1] || nums[i] == nums[i + 2]) {
                return nums[i];
            }
        }
        return nums[n + 1];
    }
};
