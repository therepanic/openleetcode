class Solution {
  int nthSuperUglyNumber(int n, List<int> primes) {
    List<int> ugly = List.filled(n, 1);
    List<int> idx = List.filled(primes.length, 0);
    List<int> val = List<int>.from(primes);
    for (int i = 1; i < n; i++) {
      int m = val[0];
      for (int j = 1; j < val.length; j++) {
        if (val[j] < m) {
          m = val[j];
        }
      }
      ugly[i] = m;
      for (int j = 0; j < primes.length; j++) {
        if (val[j] == m) {
          idx[j]++;
          val[j] = ugly[idx[j]] * primes[j];
        }
      }
    }
    return ugly[n - 1];
  }
}
