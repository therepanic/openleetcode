function maxValue(events: number[][], k: number): number {
  events.sort((a, b) => a[1] - b[1]);
  const n = events.length;
  const dp: number[][] = Array.from({ length: n + 1 }, () =>
    Array(k + 1).fill(0),
  );

  for (let i = 1; i <= n; i++) {
    const start = events[i - 1][0];
    const value = events[i - 1][2];
    const prev = findLastNonOverlapping(events, i - 1, start);
    for (let j = 1; j <= k; j++) {
      dp[i][j] = Math.max(dp[i - 1][j], dp[prev + 1][j - 1] + value);
    }
  }
  return dp[n][k];
}

function findLastNonOverlapping(
  events: number[][],
  right: number,
  targetStart: number,
): number {
  let left = 0;
  let res = -1;
  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (events[mid][1] < targetStart) {
      res = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return res;
}
