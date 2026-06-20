function maxProfit(prices: number[]): number {
  let best = 0;
  let minPrice = Number.POSITIVE_INFINITY;
  for (const price of prices) {
    minPrice = Math.min(minPrice, price);
    best = Math.max(best, price - minPrice);
  }
  return best;
}
