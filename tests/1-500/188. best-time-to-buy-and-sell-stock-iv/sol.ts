function maxProfit(k: number, prices: number[]): number {
  const n = prices.length;
  if (k === 0 || n < 2) return 0;
  if (k >= Math.floor(n / 2)) {
    let ans = 0;
    for (let i = 1; i < n; i++) {
      if (prices[i] > prices[i - 1]) ans += prices[i] - prices[i - 1];
    }
    return ans;
  }

  const hold = new Array<number>(k + 1).fill(-Number.MAX_SAFE_INTEGER);
  const free = new Array<number>(k + 1).fill(0);
  for (const price of prices) {
    for (let t = 1; t <= k; t++) {
      hold[t] = Math.max(hold[t], free[t - 1] - price);
      free[t] = Math.max(free[t], hold[t] + price);
    }
  }
  return Math.max(...free);
}
