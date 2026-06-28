function findMinMoves(machines: number[]): number {
  const n = machines.length;
  const total = machines.reduce((a, b) => a + b, 0);
  if (total % n !== 0) {
    return -1;
  }
  const avg = Math.floor(total / n);
  const imbalances = machines.map((m) => m - avg);
  let res = 0;
  let d = 0;
  for (const imb of imbalances) {
    res = Math.max(res, Math.abs(d));
    res = Math.max(res, imb);
    d += imb;
  }
  return res;
}
