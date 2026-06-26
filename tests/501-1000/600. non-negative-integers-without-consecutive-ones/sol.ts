function findIntegers(n: number): number {
  const f: number[] = new Array(30);
  f[0] = 1;
  f[1] = 2;
  for (let i = 2; i < 30; i++) {
    f[i] = f[i - 1] + f[i - 2];
  }

  let ans = 0;
  let last_seen = 0;
  for (let i = 29; i >= 0; i--) {
    if ((1 << i) & n) {
      ans += f[i];
      if (last_seen) {
        ans -= 1;
        break;
      }
      last_seen = 1;
    } else {
      last_seen = 0;
    }
  }
  return ans + 1;
}
