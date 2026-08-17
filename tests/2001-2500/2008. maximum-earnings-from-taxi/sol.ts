function maxTaxiEarnings(n: number, rides: number[][]): number {
  const ending = Array.from({ length: n + 1 }, () => [] as [number, number][]);
  for (const [start, end, tip] of rides) ending[end].push([start, tip]);
  const dp = new Array<number>(n + 1).fill(0);

  for (let time = 1; time <= n; time++) {
    dp[time] = dp[time - 1];
    for (const [start, tip] of ending[time]) {
      dp[time] = Math.max(dp[time], dp[start] + time - start + tip);
    }
  }
  return dp[n];
}
