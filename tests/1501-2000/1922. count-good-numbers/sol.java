class Solution {
    private static final int MOD = 1_000_000_007;

    public int countGoodNumbers(long n) {
        long evenPositions = (n + 1) / 2;
        long oddPositions = n / 2;
        
        long evenWays = chakraPower(5, evenPositions);
        long oddWays = chakraPower(4, oddPositions);
        
        return (int)((evenWays * oddWays) % MOD);
    }
    
    private long chakraPower(long base, long power) {
        long result = 1;
        base %= MOD;
        while (power > 0) {
            if (power % 2 == 1) {
                result = (result * base) % MOD;
            }
            base = (base * base) % MOD;
            power /= 2;
        }
        return result;
    }
}
