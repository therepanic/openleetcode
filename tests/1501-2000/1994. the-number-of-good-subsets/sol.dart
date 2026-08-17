class Solution {
  int numberOfGoodSubsets(List<int> nums) {
    const mod = 1000000007;
    const primes = [2,3,5,7,11,13,17,19,23,29];
    final freq = List<int>.filled(31, 0);
    for (final x in nums) freq[x]++;
    final masks = List<int>.filled(31, 0);
    for (int x = 2; x <= 30; x++) {
      int y = x, mask = 0; bool ok = true;
      for (int b = 0; b < 10; b++) {
        final p = primes[b];
        if (y % (p * p) == 0) { ok = false; break; }
        if (y % p == 0) mask |= 1 << b;
      }
      if (ok) masks[x] = mask;
    }
    final dp = List<int>.filled(1024, 0); dp[0] = 1;
    for (int x = 2; x <= 30; x++) {
      final mask = masks[x];
      if (mask == 0 || freq[x] == 0) continue;
      for (int state = 1023; state >= 0; state--) {
        if ((state & mask) == 0) {
          final next = state | mask;
          dp[next] = (dp[next] + dp[state] * freq[x]) % mod;
        }
      }
    }
    int ans = 0;
    for (int state = 1; state < 1024; state++) ans = (ans + dp[state]) % mod;
    for (int i = 0; i < freq[1]; i++) ans = ans * 2 % mod;
    return ans;
  }
}
