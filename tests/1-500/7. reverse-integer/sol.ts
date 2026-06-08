function reverse(x: number): number {
  let res = 0;
  while (x !== 0) {
    res = res * 10 + (x % 10);
    x = Math.trunc(x / 10);
    if (res < -2147483648 || res > 2147483647) {
      return 0;
    }
  }
  return res;
}
