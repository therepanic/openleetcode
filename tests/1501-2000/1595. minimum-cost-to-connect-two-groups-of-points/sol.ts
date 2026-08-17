function connectTwoGroups(cost: number[][]): number {
  const m = cost.length;
  const n = cost[0].length;
  const mn: number[] = [];
  for (let j = 0; j < n; j++) {
    let minVal = cost[0][j];
    for (let i = 1; i < m; i++) {
      minVal = Math.min(minVal, cost[i][j]);
    }
    mn.push(minVal);
  }
  const memo: number[][] = Array.from({ length: m + 1 }, () =>
    new Array(1 << n).fill(-1),
  );
  function fn(i: number, mask: number): number {
    if (memo[i][mask] !== -1) return memo[i][mask];
    if (i === m) {
      let sum = 0;
      for (let j = 0; j < n; j++) {
        if ((mask & (1 << j)) === 0) sum += mn[j];
      }
      memo[i][mask] = sum;
    } else {
      let best = Infinity;
      for (let j = 0; j < n; j++) {
        best = Math.min(best, cost[i][j] + fn(i + 1, mask | (1 << j)));
      }
      memo[i][mask] = best;
    }
    return memo[i][mask];
  }
  return fn(0, 0);
}
