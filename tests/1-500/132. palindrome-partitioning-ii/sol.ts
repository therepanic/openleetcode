function minCut(s: string): number {
  const n = s.length;
  const isPal = Array.from({ length: n }, () => Array(n).fill(false));
  for (let end = 0; end < n; end++)
    for (let start = 0; start <= end; start++)
      if (
        s[start] === s[end] &&
        (end - start <= 2 || isPal[start + 1][end - 1])
      )
        isPal[start][end] = true;
  const dp = Array(n).fill(0);
  for (let i = 0; i < n; i++) {
    if (isPal[0][i]) dp[i] = 0;
    else {
      dp[i] = i;
      for (let j = 0; j < i; j++)
        if (isPal[j + 1][i]) dp[i] = Math.min(dp[i], dp[j] + 1);
    }
  }
  return dp[n - 1];
}
