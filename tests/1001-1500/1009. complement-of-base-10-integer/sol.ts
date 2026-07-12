function bitwiseComplement(n: number): number {
  if (n === 0) {
    return 1;
  }
  const bitLength = n.toString(2).length;
  const mask = (1 << bitLength) - 1;
  return n ^ mask;
}
