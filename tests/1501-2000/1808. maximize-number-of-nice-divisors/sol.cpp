class Solution {
public:
    int maxNiceDivisors(int primeFactors) {
        const long long MOD = 1e9 + 7;
        if (primeFactors == 1) return 1;
        int q = primeFactors / 3;
        int r = primeFactors % 3;
        auto pow_mod = [&](long long a, int b) {
            long long res = 1;
            while (b) {
                if (b & 1) res = res * a % MOD;
                a = a * a % MOD;
                b >>= 1;
            }
            return res;
        };
        if (r == 0) return pow_mod(3, q);
        else if (r == 1) return pow_mod(3, q-1) * 4 % MOD;
        else return pow_mod(3, q) * 2 % MOD;
    }
};
