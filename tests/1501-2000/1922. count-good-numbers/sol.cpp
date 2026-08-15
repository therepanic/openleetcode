class Solution {
public:
    int countGoodNumbers(long long n) {
        const long long MOD = 1000000007;
        long long evenPositions = (n + 1) / 2;
        long long oddPositions = n / 2;
        
        long long evenWays = chakraPower(5, evenPositions, MOD);
        long long oddWays = chakraPower(4, oddPositions, MOD);
        
        return (evenWays * oddWays) % MOD;
    }
    
    long long chakraPower(long long base, long long power, long long mod) {
        long long result = 1;
        long long b = base % mod;
        long long p = power;
        while (p > 0) {
            if (p % 2 == 1) {
                result = (result * b) % mod;
            }
            b = (b * b) % mod;
            p /= 2;
        }
        return result;
    }
};
