function numFactoredBinaryTrees(arr: number[]): number {
  const MOD = 1_000_000_007;
  arr.sort((a, b) => a - b);
  const dp = new Map<number, number>();
  const s = new Set(arr);
  for (const x of arr) {
    dp.set(x, 1);
    for (const a of arr) {
      if (a > x) break;
      if (x % a === 0) {
        const b = Math.floor(x / a);
        if (s.has(b)) {
          dp.set(x, (dp.get(x)! + dp.get(a)! * dp.get(b)!) % MOD);
        }
      }
    }
  }
  let sum = 0;
  for (const v of dp.values()) {
    sum = (sum + v) % MOD;
  }
  return sum;
}
