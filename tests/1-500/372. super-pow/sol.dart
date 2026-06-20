class Solution {
  int superPow(int a, List<int> b) {
    a %= 1337;
    int result = 1;
    for (int d in b) {
      result = (powMod(result, 10, 1337) * powMod(a, d, 1337)) % 1337;
    }
    return result;
  }
  
  int powMod(int x, int n, int mod) {
    int res = 1;
    x %= mod;
    while (n > 0) {
      if ((n & 1) == 1) {
        res = (res * x) % mod;
      }
      x = (x * x) % mod;
      n >>= 1;
    }
    return res;
  }
}
