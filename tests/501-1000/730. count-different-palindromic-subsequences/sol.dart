class Solution {
  static const int MOD = 1000000007;
  
  int countPalindromicSubsequences(String s) {
    int n = s.length;
    List<List<int>> memo = List.generate(n + 1, (_) => List.filled(n + 1, -1));
    
    int dp(int left, int right) {
      if (left >= right) return 0;
      if (memo[left][right] != -1) return memo[left][right];
      int res = 0;
      for (var ch in 'abcd'.split('')) {
        int l = s.indexOf(ch, left);
        if (l == -1 || l >= right) continue;
        int r = s.lastIndexOf(ch, right - 1);
        if (r == -1 || r < left) continue;
        if (l == r) {
          res += 1;
        } else {
          res += dp(l + 1, r) + 2;
        }
      }
      res %= MOD;
      memo[left][right] = res;
      return res;
    }
    
    return dp(0, n);
  }
}
