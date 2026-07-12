class Solution {
  int nthMagicalNumber(int n, int a, int b) {
    const int mod = 1000000007;
    int g = _gcd(a, b);
    int lcm = a ~/ g * b;
    int lo = a < b ? a : b;
    int hi = n * lo;
    while (lo < hi) {
      int mid = (lo + hi) >> 1;
      int cnt = mid ~/ a + mid ~/ b - mid ~/ lcm;
      if (cnt < n) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo % mod;
  }
  
  int _gcd(int x, int y) {
    while (y != 0) {
      int t = y;
      y = x % y;
      x = t;
    }
    return x;
  }
}
