function maxProfit(prices: number[]): number {
  let a = -Infinity;
  let b = 0;
  let c = 0;
  for (const p of prices) {
    const newA = Math.max(a, c - p);
    const newB = a + p;
    const newC = Math.max(c, b);
    a = newA;
    b = newB;
    c = newC;
  }
  return Math.max(b, c);
}
