class Solution {
public:
    int minNonZeroProduct(int p) {
        const long long MOD = 1e9 + 7;
        long long maxNum = (1LL << p) - 1;
        long long count = (1LL << (p - 1)) - 1;
        
        auto powMod = [&](long long x, long long n) {
            x %= MOD;
            long long result = 1;
            while (n) {
                if (n & 1) {
                    result = (result * x) % MOD;
                }
                x = (x * x) % MOD;
                n >>= 1;
            }
            return result;
        };
        
        long long ans = powMod(maxNum - 1, count) * (maxNum % MOD) % MOD;
        return (int)ans;
    }
};
