class Solution {
  int minNonZeroProduct(int p) {
    const int mod = 1000000007;
    int maxNum = (1 << p) - 1;
    int count = (1 << (p - 1)) - 1;
    
    int powMod(int x, int n) {
      x %= mod;
      int result = 1;
      while (n > 0) {
        if (n & 1 == 1) {
          result = (result * x) % mod;
        }
        x = (x * x) % mod;
        n >>= 1;
      }
      return result;
    }
    
    return (powMod(maxNum - 1, count) * (maxNum % mod)) % mod;
  }
}
