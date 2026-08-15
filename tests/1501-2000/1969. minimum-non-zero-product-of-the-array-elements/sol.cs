public class Solution {
    public int MinNonZeroProduct(int p) {
        const long MOD = 1_000_000_007;
        long maxNum = (1L << p) - 1;
        long count = (1L << (p - 1)) - 1;
        
        long PowMod(long x, long n) {
            x %= MOD;
            long result = 1;
            while (n > 0) {
                if ((n & 1) == 1) {
                    result = (result * x) % MOD;
                }
                x = (x * x) % MOD;
                n >>= 1;
            }
            return result;
        }
        
        long pow = PowMod(maxNum - 1, count);
        return (int)((pow * (maxNum % MOD)) % MOD);
    }
}
