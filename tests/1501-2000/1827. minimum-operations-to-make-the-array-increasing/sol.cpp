class Solution {
public:
    int minOperations(vector<int>& nums) {
        int c = nums[0];
        int s = 0;
        for (int i = 1; i < nums.size(); i++) {
            if (nums[i] > c) {
                c = nums[i];
            } else {
                c++;
                s += c - nums[i];
            }
        }
        return s;
    }
};
