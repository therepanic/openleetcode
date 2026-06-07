function divide(dividend: number, divisor: number): number {
  if (dividend === -(2 ** 31) && divisor === -1) return 2 ** 31 - 1;
  const ans = Math.trunc(dividend / divisor);
  return Math.min(Math.max(ans, -(2 ** 31)), 2 ** 31 - 1);
}
