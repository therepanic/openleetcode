function numberOfCombinations(num: string): number {
  const n = num.length;
  const MOD = 1000000007;
  const dp: number[][] = Array.from({ length: n }, () => Array(n + 1).fill(0));
  for (let i = 0; i < n; i++) {
    if (num[i] !== "0") {
      for (let j = i + 1; j <= n; j++) {
        if (i === 0) {
          dp[i][j] = 1;
        } else {
          const length = j - i;
          dp[i][j] = dp[i][j - 1];
          if (
            i - length >= 0 &&
            num.substring(i - length, i) <= num.substring(i, j)
          ) {
            dp[i][j] = (dp[i][j] + dp[i - length][i]) % MOD;
          }
          if (
            i - length + 1 >= 0 &&
            num.substring(i - length + 1, i) > num.substring(i, j - 1)
          ) {
            dp[i][j] = (dp[i][j] + dp[i - length + 1][i]) % MOD;
          }
        }
      }
    }
  }
  let ans = 0;
  for (let i = 0; i < n; i++) {
    ans = (ans + dp[i][n]) % MOD;
  }
  return ans;
}
