function numsSameConsecDiff(n: number, k: number): number[] {
  let res = new Set<number>();
  for (let x = 1; x <= 9; x++) {
    res.add(x);
  }
  n -= 1;

  while (n > 0) {
    const next = new Set<number>();
    for (const val of res) {
      const last = val % 10;
      if (last + k < 10) {
        next.add(val * 10 + last + k);
      }
      if (last - k >= 0) {
        next.add(val * 10 + last - k);
      }
    }
    res = next;
    n -= 1;
  }

  return Array.from(res);
}
