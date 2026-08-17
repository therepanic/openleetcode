class Solution {
public:
    int specialArray(vector<int>& nums) {
        vector<int> ans(nums.size() + 1, 0);
        for (int i = 0; i <= nums.size(); i++) {
            int count = 0;
            for (int ele : nums) {
                if (i <= ele) count++;
            }
            ans[i] = count;
            if (ans[i] == i) return i;
        }
        return -1;
    }
};
