function hammingWeight(n: number): number {
  let value = n >>> 0;
  let ans = 0;
  while (value !== 0) {
    ans += value & 1;
    value >>>= 1;
  }
  return ans;
}
