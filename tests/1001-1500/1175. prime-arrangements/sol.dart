class Solution {
  static const int MOD = 1000000007;
  static final List<bool> isPrime = List.filled(101, true);
  static final List<int> prefixPrime = List.filled(101, 0);
  
  static void _init() {
    isPrime[0] = false;
    isPrime[1] = false;
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
    _initialized = true;
  }
  
  static bool _initialized = false;
  
  int numPrimeArrangements(int n) {
    if (!_initialized) {
      _init();
    }
    
    int x = prefixPrime[n];
    int y = n - x;
    int proX = 1;
    int proY = 1;
    
    for (int i = 2; i <= x; i++) {
      proX = (proX * i) % MOD;
    }
    for (int i = 2; i <= y; i++) {
      proY = (proY * i) % MOD;
    }
    
    return (proX * proY) % MOD;
  }
}
