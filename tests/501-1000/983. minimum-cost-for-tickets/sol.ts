function mincostTickets(days: number[], costs: number[]): number {
  const n = days.length;
  let left7 = 0;
  let left30 = 0;
  const dp: number[] = new Array(n).fill(0);

  for (let right = 0; right < n; right++) {
    while (days[right] - days[left7] >= 7) {
      left7++;
    }
    while (days[right] - days[left30] >= 30) {
      left30++;
    }

    const cost1 = (right > 0 ? dp[right - 1] : 0) + costs[0];
    const cost7 = (left7 > 0 ? dp[left7 - 1] : 0) + costs[1];
    const cost30 = (left30 > 0 ? dp[left30 - 1] : 0) + costs[2];

    dp[right] = Math.min(cost1, Math.min(cost7, cost30));
  }

  return dp[n - 1];
}
