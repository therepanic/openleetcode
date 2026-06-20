function numDistinct(s: string, t: string): number {
  const dp = new Array<number>(t.length + 1).fill(0);
  dp[0] = 1;
  for (const ch of s) {
    for (let j = t.length - 1; j >= 0; j--) {
      if (ch === t[j]) dp[j + 1] += dp[j];
    }
  }
  return dp[t.length];
}
