function palindromePartition(s: string, k: number): number {
  const n = s.length;
  const c: number[][] = Array.from({ length: n }, () => Array(n).fill(0));
  for (let l = 2; l <= n; l++) {
    for (let i = 0; i <= n - l; i++) {
      const j = i + l - 1;
      c[i][j] = (l > 2 ? c[i + 1][j - 1] : 0) + (s[i] !== s[j] ? 1 : 0);
    }
  }
  const dp: number[][] = Array.from({ length: k + 1 }, () =>
    Array(n + 1).fill(1 << 30),
  );
  dp[0][0] = 0;
  for (let i = 1; i <= n; i++) {
    dp[1][i] = c[0][i - 1];
  }
  for (let p = 2; p <= k; p++) {
    for (let i = p; i <= n; i++) {
      let mn = 1 << 30;
      for (let t = p - 1; t < i; t++) {
        mn = Math.min(mn, dp[p - 1][t] + c[t][i - 1]);
      }
      dp[p][i] = mn;
    }
  }
  return dp[k][n];
}
