class Solution {
  int numberOfSets(int n, int k) {
    const MOD = 1000000007;
    List<int> dpPrev = List.filled(n, 1);
    
    List<int> prefixPrev = List.filled(n, 0);
    prefixPrev[0] = dpPrev[0];
    for (int i = 1; i < n; i++) {
      prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD;
    }
    
    for (int iter = 0; iter < k; iter++) {
      List<int> dpCur = List.filled(n, 0);
      for (int i = 1; i < n; i++) {
        dpCur[i] = (dpCur[i-1] + prefixPrev[i-1]) % MOD;
      }
      dpPrev = dpCur;
      prefixPrev[0] = dpPrev[0];
      for (int i = 1; i < n; i++) {
        prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD;
      }
    }
    
    return dpPrev[n-1];
  }
}
