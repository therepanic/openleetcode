class Solution {
public:
    vector<int> singleNumber(vector<int>& nums) {
        int x = 0;
        for (int n : nums) {
            x ^= n;
        }

        long bit = (long)x & -(long)x;
        int a = 0;
        int b = 0;
        for (int n : nums) {
            if ((n & bit) != 0) {
                a ^= n;
            } else {
                b ^= n;
            }
        }

        return {a, b};
    }
};
