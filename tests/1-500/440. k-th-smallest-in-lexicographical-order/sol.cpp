class Solution {
public:
    int findKthNumber(int n, int k) {
        long long current = 1;
        --k;
        while (k > 0) {
            long long steps = countSteps(n, current, current + 1);
            if (steps <= k) {
                ++current;
                k -= static_cast<int>(steps);
            } else {
                current *= 10;
                --k;
            }
        }
        return static_cast<int>(current);
    }

private:
    long long countSteps(int n, long long prefix, long long nextPrefix) {
        long long steps = 0;
        long long limit = static_cast<long long>(n) + 1;
        while (prefix < limit) {
            steps += std::min(limit, nextPrefix) - prefix;
            prefix *= 10;
            nextPrefix *= 10;
        }
        return steps;
    }
};
