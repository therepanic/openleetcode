class Solution {
public:
    int findNumbers(vector<int>& nums) {
        int count = 0;
        for (int i : nums) {
            int msb = 31 - __builtin_clz(i);
            int digits = (int)(msb * 0.30103) + 1;
            if (i >= pow(10, digits)) {
                digits++;
            }
            if (digits % 2 == 0) {
                count++;
            }
        }
        return count;
    }
};
