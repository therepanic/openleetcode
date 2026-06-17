class Solution {
public:
    bool isPerfectSquare(int num) {
        if (num < 2) {
            return true;
        }

        long long left = 2;
        long long right = num / 2;
        while (left <= right) {
            long long mid = left + (right - left) / 2;
            long long squared = mid * mid;
            if (squared == num) {
                return true;
            } else if (squared < num) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return false;
    }
};
