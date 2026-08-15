class Solution {
  List<int> waysToFillArray(List<List<int>> queries) {
    const int mod = 1000000007;
    List<int> result = [];
    
    for (var q in queries) {
      int n = q[0];
      int k = q[1];
      var factors = primeFactors(k);
      BigInt total = BigInt.one;
      for (var cnt in factors.values) {
        total = total * BigInt.from(comb(n + cnt - 1, n - 1)) % BigInt.from(mod);
      }
      result.add(total.toInt());
    }
    return result;
  }
  
  Map<int, int> primeFactors(int n) {
    Map<int, int> map = {};
    int p = 2;
    while (p * p <= n) {
      while (n % p == 0) {
        map[p] = (map[p] ?? 0) + 1;
        n ~/= p;
      }
      p++;
    }
    if (n > 1) map[n] = (map[n] ?? 0) + 1;
    return map;
  }
  
  int comb(int n, int r) {
    r = r < n - r ? r : n - r;
    int result = 1;
    for (int i = 1; i <= r; i++) result = result * (n - i + 1) % 1000000007 * modPow(i, 1000000005) % 1000000007;
    return result;
  }

  int modPow(int a, int e) { int r = 1; while (e > 0) { if (e & 1 == 1) r = r * a % 1000000007; a = a * a % 1000000007; e >>= 1; } return r; }
}
