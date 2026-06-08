class Solution {
public:
    int divide(int dividend, int divisor) {
        if (dividend == INT_MIN && divisor == -1) return INT_MAX;
        long long q = static_cast<long long>(dividend) / static_cast<long long>(divisor);
        if (q < INT_MIN) return INT_MIN;
        if (q > INT_MAX) return INT_MAX;
        return static_cast<int>(q);
    }
};
