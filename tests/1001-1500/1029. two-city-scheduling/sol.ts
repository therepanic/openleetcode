function twoCitySchedCost(costs: number[][]): number {
  let res = 0;
  costs.sort((a, b) => a[0] - a[1] - (b[0] - b[1]));
  const n = costs.length;
  for (let i = 0; i < n; i++) {
    if (i < Math.floor(n / 2)) {
      res += costs[i][0];
    } else {
      res += costs[i][1];
    }
  }
  return res;
}
