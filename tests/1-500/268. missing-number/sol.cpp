class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int l = nums.size();
        int total = l;
        int summ = 0;
        for (int i = 0; i < l; i++) {
            total += i;
            summ += nums[i];
        }
        return total - summ;
    }
};
