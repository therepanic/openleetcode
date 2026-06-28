function reachNumber(target: number): number {
  target = Math.abs(target);
  const n = Math.floor((-1 + Math.sqrt(1 + 8 * target)) / 2);
  const a = (n * (n + 1)) / 2;
  const b = a + n + 1;

  if (a === target) return n;
  if ((b - target) % 2 === 0) return n + 1;
  return (n + 2) % 2 === 1 ? n + 2 : n + 3;
}
