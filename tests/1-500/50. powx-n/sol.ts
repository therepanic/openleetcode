function myPow(x: number, n: number): number {
  let exp = n;
  if (exp < 0) {
    x = 1 / x;
    exp = -exp;
  }

  let ans = 1;
  while (exp > 0) {
    if (exp % 2 === 1) ans *= x;
    x *= x;
    exp = Math.floor(exp / 2);
  }
  return ans;
}
