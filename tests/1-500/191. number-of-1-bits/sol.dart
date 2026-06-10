class Solution {
  int hammingWeight(int n) {
    var value = n & 0xffffffff;
    var ans = 0;
    while (value != 0) {
      ans += value & 1;
      value >>= 1;
    }
    return ans;
  }
}
