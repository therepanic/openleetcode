function minCost(n: number, cuts: number[]): number {
  const c = [...cuts, 0, n].sort((a, b) => a - b);
  const m = c.length;
  const memo: number[][] = Array.from({ length: m }, () => Array(m).fill(-1));
  return optimize(0, m - 1, c, memo);
}

function optimize(i: number, j: number, c: number[], memo: number[][]): number {
  if (j - i <= 1) return 0;
  if (memo[i][j] !== -1) return memo[i][j];
  let res = Number.MAX_SAFE_INTEGER;
  for (let k = i + 1; k < j; k++) {
    const val = optimize(i, k, c, memo) + optimize(k, j, c, memo);
    if (val < res) res = val;
  }
  memo[i][j] = res + (c[j] - c[i]);
  return memo[i][j];
}
