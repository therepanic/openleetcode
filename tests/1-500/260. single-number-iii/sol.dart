class Solution {
  List<int> singleNumber(List<int> nums) {
    int x = 0;
    for (int n in nums) {
      x ^= n;
    }

    int bit = x & -x;
    int a = 0;
    int b = 0;
    for (int n in nums) {
      if ((n & bit) != 0) {
        a ^= n;
      } else {
        b ^= n;
      }
    }

    return [a, b];
  }
}
