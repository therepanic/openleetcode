function maxIceCream(costs: number[], coins: number): number {
  let xMin = Math.min(...costs);
  let xMax = Math.max(...costs);
  const freq: number[] = new Array(xMax + 1).fill(0);
  for (const x of costs) {
    freq[x]++;
    xMin = Math.min(xMin, x);
  }
  let cnt = 0;
  for (let x = xMin; x <= xMax; x++) {
    const f = freq[x];
    if (f === 0) continue;
    const buy = Math.min(Math.floor(coins / x), f);
    if (buy === 0) break;
    cnt += buy;
    coins -= buy * x;
  }
  return cnt;
}
