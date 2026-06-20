class Solution {
public:
    int integerReplacement(int n) {
        function<int(long long, int)> helper = [&](long long x, int c) -> int {
            if (x == 1) return c;
            if (x % 2 == 0) {
                return helper(x >> 1, c + 1);
            } else {
                if (x == 3 || ((x >> 1) & 1) == 0) {
                    return helper(x - 1, c + 1);
                } else {
                    return helper(x + 1, c + 1);
                }
            }
        };
        return helper((long long)n, 0);
    }
};
