class Solution {
  bool isPowerOfFour(int n) {
    return n > 0 && n.bitLength != 0 && (n & (n - 1)) == 0 && (n - 1) % 3 == 0;
  }
}
