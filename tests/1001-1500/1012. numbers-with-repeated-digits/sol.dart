class Solution {
  int numDupDigitsAtMostN(int n) {
    var s = (n + 1).toString();
    var digits = s.codeUnits.map((c) => c - 48).toList();
    int nl = digits.length;
    int res = 0;
    for (int i = 0; i < nl - 1; i++) {
      res += 9 * perm(9, i);
    }
    var used = List.filled(10, false);
    for (int i = 0; i < nl; i++) {
      int x = digits[i];
      int start = i == 0 ? 1 : 0;
      for (int y = start; y < x; y++) {
        if (!used[y]) {
          res += perm(9 - i, nl - i - 1);
        }
      }
      if (used[x]) break;
      used[x] = true;
    }
    return n - res;
  }
  
  int perm(int n, int k) {
    if (k < 0 || k > n) return 0;
    int ans = 1;
    for (int i = 0; i < k; i++) {
      ans *= (n - i);
    }
    return ans;
  }
}
