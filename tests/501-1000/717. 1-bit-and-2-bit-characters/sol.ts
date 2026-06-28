function isOneBitCharacter(bits: number[]): boolean {
  const n = bits.length;
  let i = 0;
  while (i < n - 1) {
    i += 1 + (bits[i] === 1 ? 1 : 0);
  }
  return i === n - 1;
}
