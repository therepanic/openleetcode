class Solution {
public:
    int trailingZeroes(int n) {
        int count = 0;
        long long divisor = 5;
        while (divisor <= n) {
            count += n / static_cast<int>(divisor);
            divisor *= 5;
        }
        return count;
    }
};
