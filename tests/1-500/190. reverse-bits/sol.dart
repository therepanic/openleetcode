class Solution {
  int reverseBits(int n) {
    var value = n & 0xffffffff;
    var ans = 0;
    for (int i = 0; i < 32; i++) {
      ans = (ans << 1) | (value & 1);
      value >>= 1;
    }
    return ans & 0xffffffff;
  }
}
