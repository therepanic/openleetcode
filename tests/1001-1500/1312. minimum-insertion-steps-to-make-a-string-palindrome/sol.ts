function minInsertions(s: string): number {
  const n = s.length;
  const s2 = s.split("").reverse().join("");
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    Array(n + 1).fill(0),
  );
  for (let i = 1; i <= n; i++) {
    for (let j = 1; j <= n; j++) {
      if (s[i - 1] === s2[j - 1]) {
        dp[i][j] = 1 + dp[i - 1][j - 1];
      } else {
        dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
      }
    }
  }
  return n - dp[n][n];
}
