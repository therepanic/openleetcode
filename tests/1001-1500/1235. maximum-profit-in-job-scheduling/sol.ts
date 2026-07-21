function jobScheduling(
  startTime: number[],
  endTime: number[],
  profit: number[],
): number {
  const n = startTime.length;
  const jobs: [number, number, number][] = [];
  for (let i = 0; i < n; i++) {
    jobs.push([startTime[i], endTime[i], profit[i]]);
  }
  jobs.sort((a, b) => a[0] - b[0]);

  const starts = jobs.map((j) => j[0]);
  const dp: number[] = new Array(n + 1).fill(0);

  const binarySearch = (target: number, from: number): number => {
    let lo = from,
      hi = n;
    while (lo < hi) {
      const mid = lo + Math.floor((hi - lo) / 2);
      if (starts[mid] >= target) {
        hi = mid;
      } else {
        lo = mid + 1;
      }
    }
    return lo;
  };

  for (let i = n - 1; i >= 0; i--) {
    const idx = binarySearch(jobs[i][1], i + 1);
    const take = jobs[i][2] + dp[idx];
    const notTake = dp[i + 1];
    dp[i] = Math.max(take, notTake);
  }
  return dp[0];
}
