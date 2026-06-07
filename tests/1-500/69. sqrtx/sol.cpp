class Solution {
public:
    int mySqrt(int x) {
        if (x < 2) {
            return x;
        }

        long long left = 1;
        long long right = x / 2;
        int ans = 1;

        while (left <= right) {
            long long mid = left + (right - left) / 2;
            long long square = mid * mid;
            if (square == x) {
                return static_cast<int>(mid);
            }
            if (square < x) {
                ans = static_cast<int>(mid);
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return ans;
    }
};
