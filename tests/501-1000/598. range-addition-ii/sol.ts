function maxCount(m: number, n: number, ops: number[][]): number {
  if (ops.length === 0) {
    return m * n;
  }
  for (const [a, b] of ops) {
    m = Math.min(m, a);
    n = Math.min(n, b);
  }
  return m * n;
}
