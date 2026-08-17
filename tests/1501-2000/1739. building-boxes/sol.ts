function minimumBoxes(n: number): number {
  let x = Math.floor(Math.cbrt(6 * n));
  while ((x + 1) * (x + 2) * (x + 3) <= 6 * n) x++;
  while (x * (x + 1) * (x + 2) > 6 * n) x--;

  let ans = (x * (x + 1)) / 2;
  n -= (x * (x + 1) * (x + 2)) / 6;
  let k = 1;
  while (n > 0) {
    ans++;
    n -= k;
    k++;
  }
  return ans;
}
