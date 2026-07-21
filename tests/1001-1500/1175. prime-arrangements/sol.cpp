class Solution {
private:
    static const int MOD = 1000000007;
    static bool isPrime[101];
    static int prefixPrime[101];
    static bool initialized;
    
    static void init() {
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
    
public:
    int numPrimeArrangements(int n) {
        init();
        int x = prefixPrime[n];
        int y = n - x;
        long long proX = 1;
        long long proY = 1;
        
        for (int i = 2; i <= x; i++) {
            proX = (proX * i) % MOD;
        }
        for (int i = 2; i <= y; i++) {
            proY = (proY * i) % MOD;
        }
        
        return (int)((proX * proY) % MOD);
    }
};

bool Solution::isPrime[101];
int Solution::prefixPrime[101];
bool Solution::initialized = false;
