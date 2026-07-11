function maxSumAfterPartitioning(arr: number[], k: number): number {
  const n = arr.length;
  const dp: number[] = new Array(n + 1).fill(0);
  for (let i = 1; i <= n; i++) {
    let curr = 0;
    for (let j = 1; j <= k; j++) {
      if (i < j) break;
      curr = Math.max(curr, arr[i - j]);
      dp[i] = Math.max(dp[i], dp[i - j] + curr * j);
    }
  }
  return dp[n];
}
