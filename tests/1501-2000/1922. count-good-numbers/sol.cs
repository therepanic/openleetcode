public class Solution {
    private const int MOD = 1000000007;

    public int CountGoodNumbers(long n) {
        long evenPositions = (n + 1) / 2;
        long oddPositions = n / 2;
        
        long evenWays = ChakraPower(5, evenPositions);
        long oddWays = ChakraPower(4, oddPositions);
        
        return (int)((evenWays * oddWays) % MOD);
    }
    
    private long ChakraPower(long baseNum, long power) {
        long result = 1;
        long b = baseNum % MOD;
        long p = power;
        while (p > 0) {
            if (p % 2 == 1) {
                result = (result * b) % MOD;
            }
            b = (b * b) % MOD;
            p /= 2;
        }
        return result;
    }
}
