class Solution {
public:
    int concatenatedBinary(int n) {
        const long long MOD = 1'000'000'007;
        long long res = 0;
        int bits = 0;

        for (int i = 1; i <= n; i++) {
            if ((i & (i - 1)) == 0) {
                bits++;
            }
            res = ((res << bits) | i) % MOD;
        }

        return (int)res;
    }
};
