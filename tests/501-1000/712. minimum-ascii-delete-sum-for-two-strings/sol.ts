function minimumDeleteSum(s1: string, s2: string): number {
  const n = s1.length,
    m = s2.length;
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    Array(m + 1).fill(0),
  );
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      if (s1[i] === s2[j]) {
        dp[i + 1][j + 1] = dp[i][j] + s1.charCodeAt(i);
      } else {
        dp[i + 1][j + 1] = Math.max(dp[i][j + 1], dp[i + 1][j]);
      }
    }
  }
  let totalAscii = 0;
  for (let i = 0; i < n; i++) totalAscii += s1.charCodeAt(i);
  for (let j = 0; j < m; j++) totalAscii += s2.charCodeAt(j);
  return totalAscii - 2 * dp[n][m];
}
