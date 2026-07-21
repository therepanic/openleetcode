class Solution {
    private static final int MOD = 1000000007;
    private static boolean[] isPrime = new boolean[101];
    private static int[] prefixPrime = new int[101];
    
    static {
        for (int i = 2; i <= 100; i++) {
            isPrime[i] = true;
        }
        for (int i = 2; i * i <= 100; i++) {
            if (isPrime[i]) {
                for (int j = i * i; j <= 100; j += i) {
                    isPrime[j] = false;
                }
            }
        }
        for (int i = 2; i <= 100; i++) {
            prefixPrime[i] = prefixPrime[i - 1] + (isPrime[i] ? 1 : 0);
        }
    }
    
    public int numPrimeArrangements(int n) {
        int x = prefixPrime[n];
        int y = n - x;
        long proX = 1;
        long proY = 1;
        
        for (int i = 2; i <= x; i++) {
            proX = (proX * i) % MOD;
        }
        for (int i = 2; i <= y; i++) {
            proY = (proY * i) % MOD;
        }
        
        return (int)((proX * proY) % MOD);
    }
}
