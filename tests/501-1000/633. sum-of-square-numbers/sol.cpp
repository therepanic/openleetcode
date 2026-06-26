class Solution {
public:
    bool judgeSquareSum(int c) {
        long left = 0;
        long right = (long) sqrt(c);
        while (left <= right) {
            long currentSum = left * left + right * right;
            if (currentSum == c) {
                return true;
            } else if (currentSum < c) {
                left++;
            } else {
                right--;
            }
        }
        return false;
    }
};
