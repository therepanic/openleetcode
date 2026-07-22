public class Solution {
    private const int MOD = 1000000007;
    private static bool[] isPrime = new bool[101];
    private static int[] prefixPrime = new int[101];
    private static bool initialized = false;
    
    private static void Init() {
        if (initialized) return;
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
        initialized = true;
    }
    
    public int NumPrimeArrangements(int n) {
        Init();
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
