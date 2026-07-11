function minScoreTriangulation(values: number[]): number {
  const n = values.length;
  const dp: number[][] = Array.from({ length: n }, () => Array(n).fill(0));
  for (let i = n - 1; i >= 0; i--) {
    for (let j = i + 1; j < n; j++) {
      let minVal = Number.POSITIVE_INFINITY;
      for (let k = i + 1; k < j; k++) {
        const val = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j];
        if (val < minVal) {
          minVal = val;
        }
      }
      if (minVal !== Number.POSITIVE_INFINITY) {
        dp[i][j] = minVal;
      }
    }
  }
  return dp[0][n - 1];
}
