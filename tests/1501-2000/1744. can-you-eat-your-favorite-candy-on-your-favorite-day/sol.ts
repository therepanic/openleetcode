function canEat(candiesCount: number[], queries: number[][]): boolean[] {
  const n = candiesCount.length;
  const m = queries.length;
  const ans = new Array(m).fill(false);
  const psum = new Array(n + 1).fill(0);
  for (let i = 1; i <= n; i++) {
    psum[i] = psum[i - 1] + candiesCount[i - 1];
  }
  for (let i = 0; i < m; i++) {
    const t = queries[i][0];
    const day = queries[i][1] + 1;
    const cap = queries[i][2];
    const minDays = Math.floor(psum[t] / cap) + 1;
    const maxDays = psum[t + 1];
    ans[i] = minDays <= day && day <= maxDays;
  }
  return ans;
}
