class Solution {
  int integerReplacement(int n) {
    int helper(int x, int c) {
      if (x == 1) return c;
      if (x % 2 == 0) {
        return helper(x >> 1, c + 1);
      } else {
        if (x == 3 || ((x >> 1) & 1) == 0) {
          return helper(x - 1, c + 1);
        } else {
          return helper(x + 1, c + 1);
        }
      }
    }
    return helper(n, 0);
  }
}
