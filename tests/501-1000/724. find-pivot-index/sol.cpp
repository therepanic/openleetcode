class Solution {
public:
    int pivotIndex(vector<int>& nums) {
        int totalSum = 0;
        for (int num : nums) {
            totalSum += num;
        }
        int lSum = 0;
        int rSum = totalSum;
        for (int i = 0; i < nums.size(); i++) {
            rSum -= nums[i];
            if (lSum == rSum) {
                return i;
            }
            lSum += nums[i];
        }
        return -1;
    }
};
