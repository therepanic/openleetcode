class Solution {
  int concatenatedBinary(int n) {
    const mod = 1000000007;
    var result = 0;
    var bits = 0;
    for (var i = 1; i <= n; i++) {
      if ((i & (i - 1)) == 0) bits++;
      result = (result * (1 << bits) + i) % mod;
    }
    return result;
  }
}
