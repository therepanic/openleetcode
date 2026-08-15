class Solution {
public:
    int minPairSum(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        int max_sum = 0;
        int l = 0, r = nums.size() - 1;
        while (l < r) {
            max_sum = max(max_sum, nums[l] + nums[r]);
            l++;
            r--;
        }
        return max_sum;
    }
};
