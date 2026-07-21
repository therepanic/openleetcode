function numberOfArrays(s: string, k: number): number {
  const mod = 1000000007;
  const n = s.length;
  const dp = new Array(n + 1).fill(0);
  dp[0] = 1;
  const width = k.toString().length;
  for (let i = 0; i < n; i++) {
    if (s[i] === "0" || dp[i] === 0) continue;
    let value = 0;
    for (let j = i; j < Math.min(n, i + width); j++) {
      value = value * 10 + (s.charCodeAt(j) - 48);
      if (value > k) break;
      dp[j + 1] = (dp[j + 1] + dp[i]) % mod;
    }
  }
  return dp[n];
}
