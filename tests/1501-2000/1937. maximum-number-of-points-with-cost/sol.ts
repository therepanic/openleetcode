function maxPoints(points: number[][]): number {
  const m = points.length;
  const n = points[0].length;

  let dp = [...points[0]];

  for (let r = 1; r < m; r++) {
    const left = new Array(n).fill(0);
    const right = new Array(n).fill(0);

    left[0] = dp[0];
    for (let c = 1; c < n; c++) {
      left[c] = Math.max(left[c - 1], dp[c] + c);
    }

    right[n - 1] = dp[n - 1] - (n - 1);
    for (let c = n - 2; c >= 0; c--) {
      right[c] = Math.max(right[c + 1], dp[c] - c);
    }

    const newDp = new Array(n).fill(0);
    for (let c = 0; c < n; c++) {
      const best = Math.max(left[c] - c, right[c] + c);
      newDp[c] = points[r][c] + best;
    }
    dp = newDp;
  }

  return Math.max(...dp);
}
