class Solution {
public:
    int minIncrementForUnique(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        int res = 0;
        for (int i = 1; i < nums.size(); i++) {
            if (nums[i] <= nums[i - 1]) {
                int target = nums[i - 1] + 1;
                res += target - nums[i];
                nums[i] = target;
            }
        }
        return res;
    }
};
