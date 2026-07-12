function numPermsDISequence(s: string): number {
  const n = s.length;
  const MOD = 1000000007;
  let dp = [1];
  for (let i = 1; i <= n; i++) {
    const prefix = new Array(i + 1).fill(0);
    prefix[0] = dp[0];
    for (let j = 1; j < i; j++) {
      prefix[j] = (prefix[j - 1] + dp[j]) % MOD;
    }
    prefix[i] = prefix[i - 1] % MOD;
    const ndp = new Array(i + 1).fill(0);
    if (s[i - 1] === "I") {
      for (let j = 0; j <= i; j++) {
        ndp[j] = j > 0 ? prefix[j - 1] % MOD : 0;
      }
    } else {
      for (let j = 0; j <= i; j++) {
        ndp[j] = (prefix[i - 1] - (j > 0 ? prefix[j - 1] : 0)) % MOD;
        if (ndp[j] < 0) ndp[j] += MOD;
      }
    }
    dp = ndp;
  }
  return dp.reduce((a, b) => (a + b) % MOD, 0);
}
