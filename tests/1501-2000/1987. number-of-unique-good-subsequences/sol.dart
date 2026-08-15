class Solution {
  int numberOfUniqueGoodSubsequences(String binary) {
    int a = 0, b = 0, z = 0;
    const mod = 1000000007;
    for (int i = 0; i < binary.length; i++) {
      if (binary[i] == '1') {
        b = (a + b + 1) % mod;
      } else {
        a = (a + b) % mod;
        z = 1;
      }
    }
    return (a + b + z) % mod;
  }
}
