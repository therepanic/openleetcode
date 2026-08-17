class Solution {
  int stoneGameVII(List<int> stones) {
    final n = stones.length;
    final prefix = List<int>.filled(n + 1, 0);
    for (var i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + stones[i];
    }
    final dp = List<int>.filled(n, 0);
    for (var length = 2; length <= n; length++) {
      for (var left = 0; left + length <= n; left++) {
        final right = left + length - 1;
        final total = prefix[right + 1] - prefix[left];
        final removeLeft = total - stones[left] - dp[left + 1];
        final removeRight = total - stones[right] - dp[left];
        dp[left] = removeLeft > removeRight ? removeLeft : removeRight;
      }
    }
    return dp[0];
  }
}
