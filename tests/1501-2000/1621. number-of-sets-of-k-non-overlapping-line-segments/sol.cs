public class Solution {
    public int NumberOfSets(int n, int k) {
        const long MOD = 1000000007L;
        long[] dpPrev = new long[n];
        for (int i = 0; i < n; i++) dpPrev[i] = 1;
        
        long[] prefixPrev = new long[n];
        prefixPrev[0] = dpPrev[0];
        for (int i = 1; i < n; i++) {
            prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD;
        }
        
        for (int iter = 0; iter < k; iter++) {
            long[] dpCur = new long[n];
            for (int i = 1; i < n; i++) {
                dpCur[i] = (dpCur[i-1] + prefixPrev[i-1]) % MOD;
            }
            dpPrev = dpCur;
            prefixPrev[0] = dpPrev[0];
            for (int i = 1; i < n; i++) {
                prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD;
            }
        }
        
        return (int)dpPrev[n-1];
    }
}
