function reverseBits(n: number): number {
  let value = n >>> 0;
  let ans = 0;
  for (let i = 0; i < 32; i++) {
    ans = ans * 2 + (value & 1);
    value >>>= 1;
  }
  return ans >>> 0;
}
