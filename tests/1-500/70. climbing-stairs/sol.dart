class Solution {
  int climbStairs(int n) {
    if (n <= 3) {
      return n;
    }
    var prev2 = 2;
    var prev1 = 3;
    for (var step = 4; step <= n; step++) {
      final cur = prev1 + prev2;
      prev2 = prev1;
      prev1 = cur;
    }
    return prev1;
  }
}
