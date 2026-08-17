function colorTheGrid(m: number, n: number): number {
  const mod = 1000000007;
  let total = 1;
  for (let i = 0; i < m; i++) total *= 3;
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    Array(total).fill(0),
  );
  const rowValid: number[][] = Array.from({ length: total }, () =>
    Array(total).fill(0),
  );
  const good: number[] = [];
  const pattern: number[][] = Array.from({ length: total }, () =>
    Array(m).fill(0),
  );
  for (let i = 0; i < total; i++) {
    let val = i;
    let valid = 1;
    for (let k = 0; k < m; k++) {
      pattern[i][k] = val % 3;
      val = Math.floor(val / 3);
    }
    for (let k = 1; k < m; k++) {
      if (pattern[i][k] === pattern[i][k - 1]) {
        valid = 0;
        break;
      }
    }
    if (valid === 1) good.push(i);
  }
  for (const i of good) dp[1][i] = 1;
  for (const i of good) {
    for (const j of good) {
      rowValid[i][j] = 1;
      for (let k = 0; k < m; k++) {
        if (pattern[i][k] === pattern[j][k]) {
          rowValid[i][j] = 0;
          break;
        }
      }
    }
  }
  for (let col = 2; col <= n; col++) {
    for (const i of good) {
      let totalWays = 0;
      for (const j of good) {
        if (rowValid[i][j] === 1) {
          totalWays += dp[col - 1][j];
        }
      }
      dp[col][i] = totalWays % mod;
    }
  }
  let ans = 0;
  for (const i of good) ans += dp[n][i];
  return ans % mod;
}
