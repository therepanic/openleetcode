function hasAlternatingBits(n: number): boolean {
  const x = n ^ (n >> 1);
  return (x & (x + 1)) === 0;
}
