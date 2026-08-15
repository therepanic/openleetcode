class Solution {
  int makeStringSorted(String s) {
    const int MOD = 1000000007;
    int n = s.length;
    List<int> fac = List.filled(n + 1, 1);
    List<int> invFac = List.filled(n + 1, 1);
    
    for (int i = 1; i <= n; i++) {
      fac[i] = (fac[i - 1] * i) % MOD;
    }
    invFac[n] = modPow(fac[n], MOD - 2, MOD);
    for (int i = n; i > 0; i--) {
      invFac[i - 1] = (invFac[i] * i) % MOD;
    }
    
    List<int> freq = List.filled(26, 0);
    for (int i = 0; i < n; i++) {
      freq[s.codeUnitAt(i) - 97]++;
    }
    
    int ans = 0;
    for (int i = 0; i < n; i++) {
      int smallRight = 0;
      for (int j = 0; j < s.codeUnitAt(i) - 97; j++) {
        smallRight = (smallRight + freq[j]) % MOD;
      }
      
      int rem = n - i - 1;
      int temp = 1;
      temp = (temp * fac[rem]) % MOD;
      temp = (temp * smallRight) % MOD;
      
      for (int x in freq) {
        if (x > 1) {
          temp = (temp * invFac[x]) % MOD;
        }
      }
      
      freq[s.codeUnitAt(i) - 97]--;
      ans = (ans + temp) % MOD;
    }
    
    return ans;
  }
  
  int modPow(int x, int n, int mod) {
    if (x == 1 || n == 0) return 1;
    if (n == 1) return x % mod;
    if (n % 2 == 1) {
      return (x * modPow((x * x) % mod, n ~/ 2, mod)) % mod;
    }
    return modPow((x * x) % mod, n ~/ 2, mod) % mod;
  }
}
