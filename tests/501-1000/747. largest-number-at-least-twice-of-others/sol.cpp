class Solution {
public:
    int dominantIndex(vector<int>& nums) {
        int m = -1;
        int s = -1;
        int idx = -1;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] > m) {
                s = m;
                m = nums[i];
                idx = i;
            } else if (nums[i] > s) {
                s = nums[i];
            }
        }
        return m >= s * 2 ? idx : -1;
    }
};
