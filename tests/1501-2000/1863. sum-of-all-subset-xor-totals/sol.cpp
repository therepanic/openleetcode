class Solution {
public:
    int subsetXORSum(vector<int>& nums) {
        int total = 0;
        for (int num : nums) {
            total |= num;
        }
        return total * (1 << (nums.size() - 1));
    }
};
