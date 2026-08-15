class Solution {
public:
    int minOperations(vector<int>& nums) {
        int sum_bits = 0;
        int max_num = 0;
        for (int num : nums) {
            sum_bits += __builtin_popcount(num);
            if (num > max_num) {
                max_num = num;
            }
        }
        int doubling = max_num > 0 ? 32 - __builtin_clz(max_num) - 1 : 0;
        return sum_bits + doubling;
    }
};
