class Solution {
public:
    vector<int> smallerNumbersThanCurrent(vector<int>& nums) {
        vector<int> allNums(101, 0);
        vector<int> res(nums.size(), 0);

        for (int v : nums) {
            allNums[v]++;
        }

        for (int v = 1; v <= 100; v++) {
            allNums[v] += allNums[v - 1];
        }

        for (int i = 0; i < nums.size(); i++) {
            int v = nums[i];
            if (v == 0) {
                res[i] = 0;
            } else {
                res[i] = allNums[v - 1];
            }
        }
        return res;
    }
};
