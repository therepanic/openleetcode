function getSum(a: number, b: number): number {
  a &= 0xffffffff;
  b &= 0xffffffff;
  while (b) {
    let c = (a & b) << 1;
    a = (a ^ b) & 0xffffffff;
    b = c & 0xffffffff;
  }
  return a < 0x80000000 ? a : ~(a ^ 0xffffffff);
}
