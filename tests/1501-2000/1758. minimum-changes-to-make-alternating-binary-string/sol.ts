function minOperations(s: string): number {
  let c = 0,
    j = 0,
    n = s.length;
  for (let ch of s) {
    if (Number(ch) === j) {
      c++;
    }
    j ^= 1;
  }
  return Math.min(c, n - c);
}
