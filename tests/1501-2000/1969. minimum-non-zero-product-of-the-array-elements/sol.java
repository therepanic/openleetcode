class Solution {
    public int minNonZeroProduct(int p) {
        long mod = 1_000_000_007L;
        long maxNum = (1L << p) - 1;
        long count = (1L << (p - 1)) - 1;
        
        long powMod = powMod(maxNum - 1, count, mod);
        return (int)((powMod * (maxNum % mod)) % mod);
    }
    
    private long powMod(long x, long n, long mod) {
        long result = 1;
        x %= mod;
        while (n > 0) {
            if ((n & 1) == 1) {
                result = (result * x) % mod;
            }
            x = (x * x) % mod;
            n >>= 1;
        }
        return result;
    }
}
