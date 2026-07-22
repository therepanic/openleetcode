class Solution {
public:
    vector<int> minSubsequence(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        vector<int> v;
        int l = nums.size();
        int sumV = 0, sumRem = accumulate(nums.begin(), nums.end(), 0);
        while (sumV <= sumRem) {
            l--;
            sumV += nums[l];
            sumRem -= nums[l];
            v.push_back(nums[l]);
        }
        return v;
    }
};
