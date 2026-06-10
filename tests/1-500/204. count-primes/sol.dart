class Solution {
  int countPrimes(int n) {
    if (n <= 2) return 0;
    final isPrime = List.filled(n, true);
    isPrime[0] = false;
    isPrime[1] = false;
    for (int i = 2; i * i < n; i++) {
      if (!isPrime[i]) continue;
      for (int j = i * i; j < n; j += i) {
        isPrime[j] = false;
      }
    }
    return isPrime.where((x) => x).length;
  }
}
