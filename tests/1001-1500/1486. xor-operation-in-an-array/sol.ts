function xorOperation(n: number, start: number): number {
  let ans = 0;
  while (n > 0) {
    ans ^= start;
    start += 2;
    n--;
  }
  return ans;
}
