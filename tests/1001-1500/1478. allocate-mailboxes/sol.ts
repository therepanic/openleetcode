function minDistance(houses: number[], k: number): number {
  const n = houses.length;
  houses.sort((a, b) => a - b);
  const P: number[] = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) {
    P[i + 1] = P[i] + houses[i];
  }

  const G: number[][] = Array.from({ length: n }, () => new Array(n).fill(0));
  for (let i = 0; i < n; i++) {
    for (let j = i; j < n; j++) {
      const mid = Math.floor((i + j) / 2);
      const countLeft = mid - i + 1;
      const countRight = j - mid;
      const sumLeft = P[mid + 1] - P[i];
      const sumRight = P[j + 1] - P[mid + 1];
      G[i][j] =
        houses[mid] * countLeft -
        sumLeft +
        (sumRight - houses[mid] * countRight);
    }
  }

  const dp: number[][] = Array.from({ length: k + 1 }, () =>
    new Array(n + 1).fill(Infinity),
  );
  dp[0][0] = 0;

  for (let m = 1; m <= k; m++) {
    for (let j = 1; j <= n; j++) {
      let best = Infinity;
      for (let i = 0; i < j; i++) {
        best = Math.min(best, dp[m - 1][i] + G[i][j - 1]);
      }
      dp[m][j] = best;
    }
  }

  return dp[k][n];
}
