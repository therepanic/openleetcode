class Solution {
  int maxNiceDivisors(int primeFactors) {
    const mod = 1000000007;
    if (primeFactors <= 3) return primeFactors;
    int power(int base, int exponent) {
      var a = base.toInt();
      var e = exponent;
      var result = 1;
      while (e > 0) {
        if ((e & 1) != 0) result = (result * a) % mod;
        a = (a * a) % mod;
        e >>= 1;
      }
      return result;
    }
    final q = primeFactors ~/ 3;
    final r = primeFactors % 3;
    if (r == 0) return power(3, q);
    if (r == 1) return (power(3, q - 1) * 4) % mod;
    return (power(3, q) * 2) % mod;
  }
}
