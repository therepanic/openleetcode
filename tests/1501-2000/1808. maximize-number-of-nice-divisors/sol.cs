public class Solution {
    public int MaxNiceDivisors(int primeFactors) {
        const long MOD = 1_000_000_007;
        if (primeFactors == 1) return 1;
        int q = primeFactors / 3;
        int r = primeFactors % 3;
        long Pow(long a, int b) {
            long res = 1;
            while (b > 0) {
                if ((b & 1) == 1) res = res * a % MOD;
                a = a * a % MOD;
                b >>= 1;
            }
            return res;
        }
        if (r == 0) return (int)Pow(3, q);
        else if (r == 1) return (int)(Pow(3, q-1) * 4 % MOD);
        else return (int)(Pow(3, q) * 2 % MOD);
    }
}
