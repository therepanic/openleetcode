function minCost(
  houses: number[],
  cost: number[][],
  m: number,
  n: number,
  target: number,
): number {
  const INF = 1000000000;
  let prev: number[][] = Array.from({ length: n }, () =>
    Array(target + 1).fill(INF),
  );
  if (houses[0] !== 0) {
    const c = houses[0] - 1;
    prev[c][1] = 0;
  } else {
    for (let c = 0; c < n; c++) {
      prev[c][1] = cost[0][c];
    }
  }
  for (let i = 1; i < m; i++) {
    const curr: number[][] = Array.from({ length: n }, () =>
      Array(target + 1).fill(INF),
    );
    if (houses[i] !== 0) {
      const c = houses[i] - 1;
      const add = 0;
      for (let k = 1; k <= target; k++) {
        if (prev[c][k] < INF) {
          if (prev[c][k] + add < curr[c][k]) {
            curr[c][k] = prev[c][k] + add;
          }
        }
        if (k > 1) {
          let best = INF;
          for (let pc = 0; pc < n; pc++) {
            if (pc !== c && prev[pc][k - 1] < best) {
              best = prev[pc][k - 1];
            }
          }
          if (best < INF && best + add < curr[c][k]) {
            curr[c][k] = best + add;
          }
        }
      }
    } else {
      for (let c = 0; c < n; c++) {
        const add = cost[i][c];
        for (let k = 1; k <= target; k++) {
          if (prev[c][k] < INF) {
            if (prev[c][k] + add < curr[c][k]) {
              curr[c][k] = prev[c][k] + add;
            }
          }
          if (k > 1) {
            let best = INF;
            for (let pc = 0; pc < n; pc++) {
              if (pc !== c && prev[pc][k - 1] < best) {
                best = prev[pc][k - 1];
              }
            }
            if (best < INF && best + add < curr[c][k]) {
              curr[c][k] = best + add;
            }
          }
        }
      }
    }
    prev = curr;
  }
  let ans = INF;
  for (let c = 0; c < n; c++) {
    if (prev[c][target] < ans) {
      ans = prev[c][target];
    }
  }
  return ans >= INF ? -1 : ans;
}
