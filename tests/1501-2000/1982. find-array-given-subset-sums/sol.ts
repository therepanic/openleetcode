function recoverArray(n: number, sums: number[]): number[] {
  sums.sort((a, b) => a - b);
  const res: number[] = [];

  for (let i = 0; i < n; i++) {
    const d = sums[1] - sums[0];

    const left: number[] = [];
    const right: number[] = [];
    const count: Map<number, number> = new Map();
    for (const s of sums) count.set(s, (count.get(s) || 0) + 1);

    for (const s of sums) {
      if (count.get(s)! > 0) {
        left.push(s);
        right.push(s + d);
        count.set(s, count.get(s)! - 1);
        count.set(s + d, (count.get(s + d) || 0) - 1);
      }
    }

    if (left.includes(0)) {
      res.push(d);
      sums = left;
    } else {
      res.push(-d);
      sums = right;
    }
  }
  return res;
}
