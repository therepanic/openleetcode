function stoneGameV(stoneValue: number[]): number {
  const n = stoneValue.length;
  const sv: number[] = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) sv[i + 1] = sv[i] + stoneValue[i];

  const memo: number[][] = Array.from({ length: n + 1 }, () =>
    new Array(n + 1).fill(-1),
  );

  function helper(fro: number, to: number): number {
    if (to - fro === 1) return 0;
    if (memo[fro][to] !== -1) return memo[fro][to];

    const target = Math.floor((sv[to] + sv[fro]) / 2);
    let lo = fro,
      hi = to;
    while (lo < hi) {
      const mid = Math.floor((lo + hi) / 2);
      if (sv[mid] < target) lo = mid + 1;
      else hi = mid;
    }
    const pivot = lo;

    let dist = 0;
    let res = 0;
    let exploreMore = true;
    const maxDist = Math.max(pivot - fro, to - pivot);
    while (exploreMore && dist <= maxDist) {
      exploreMore = false;
      for (const i of [pivot - dist, pivot + dist]) {
        if (fro < i && i <= to) {
          const left = sv[i] - sv[fro];
          const right = sv[to] - sv[i];
          if (Math.floor(res / 2) <= left && left <= right) {
            res = Math.max(res, left + helper(fro, i));
            exploreMore = true;
          }
          if (left >= right && right >= Math.floor(res / 2)) {
            res = Math.max(res, right + helper(i, to));
            exploreMore = true;
          }
        }
      }
      dist += 1;
    }
    memo[fro][to] = res;
    return res;
  }

  return helper(0, n);
}
