class Solution {
public:
    vector<int> rearrangeArray(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        vector<int> res(nums.size());
        int mid = (nums.size() + 1) / 2;
        int j = 0;
        for (int i = 0; i < nums.size(); i += 2) {
            res[i] = nums[j++];
        }
        j = mid;
        for (int i = 1; i < nums.size(); i += 2) {
            res[i] = nums[j++];
        }
        return res;
    }
};
