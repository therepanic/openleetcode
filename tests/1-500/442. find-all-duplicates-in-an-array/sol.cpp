class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        vector<int> r;
        for (int x : nums) {
            int idx = abs(x) - 1;
            if (nums[idx] < 0) {
                r.push_back(abs(x));
            } else {
                nums[idx] = -nums[idx];
            }
        }
        return r;
    }
};
