class Solution {
public:
    int maxValue(int n, int index, int maxSum) {
        long long l = 0, r = maxSum, result = 1;
        while (l <= r) {
            long long mid = (l + r) / 2;
            if (isValid(mid, n, index, maxSum)) {
                result = mid;
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return (int)result;
    }

private:
    bool isValid(long long mid, int n, int index, int maxSum) {
        long long leftCount = index;
        long long left;
        if (mid > leftCount) {
            left = (mid - leftCount + mid - 1) * leftCount / 2;
        } else {
            long long ones = leftCount - (mid - 1);
            left = mid * (mid - 1) / 2 + ones;
        }

        long long rightCount = n - index - 1;
        long long right;
        if (mid > rightCount) {
            right = (mid - 1 + mid - rightCount) * rightCount / 2;
        } else {
            long long ones = rightCount - (mid - 1);
            right = mid * (mid - 1) / 2 + ones;
        }

        return left + mid + right <= maxSum;
    }
};
