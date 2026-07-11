function distinctSubseqII(s: string): number {
  const n = s.length;
  const mod = 1000000007;
  const dp: number[] = new Array(n).fill(0);
  dp[0] = 2;
  const mp: Map<string, number> = new Map();
  mp.set(s[0], 0);
  for (let i = 1; i < n; i++) {
    dp[i] = (2 * dp[i - 1]) % mod;
    if (mp.has(s[i])) {
      const idx = mp.get(s[i])!;
      dp[i] -= idx > 0 ? dp[idx - 1] : 1;
      if (dp[i] < 0) dp[i] += mod;
    }
    mp.set(s[i], i);
    dp[i] %= mod;
  }
  return (dp[n - 1] - 1 + mod) % mod;
}
