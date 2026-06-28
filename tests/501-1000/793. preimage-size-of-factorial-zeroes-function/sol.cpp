class Solution {
public:
    int preimageSizeFZF(int k) {
        auto trailingZeroes = [](long long n) -> long long {
            long long count = 0;
            long long power = 5;
            while (power <= n) {
                count += n / power;
                power *= 5;
            }
            return count;
        };

        long long start = 4LL * k;
        while (true) {
            long long H = trailingZeroes(start);
            if (H == k) {
                return 5;
            }
            if (H > k) {
                break;
            }
            start++;
        }
        return 0;
    }
};
