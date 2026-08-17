class Solution {
    public int maxNiceDivisors(int primeFactors) {
        long MOD = 1_000_000_007L;
        if (primeFactors == 1) return 1;
        int q = primeFactors / 3;
        int r = primeFactors % 3;
        if (r == 0) {
            return (int) powMod(3, q, MOD);
        } else if (r == 1) {
            return (int) (powMod(3, q-1, MOD) * 4 % MOD);
        } else {
            return (int) (powMod(3, q, MOD) * 2 % MOD);
        }
    }
    
    private long powMod(long a, int b, long mod) {
        long res = 1;
        while (b > 0) {
            if ((b & 1) == 1) res = res * a % mod;
            a = a * a % mod;
            b >>= 1;
        }
        return res;
    }
}
