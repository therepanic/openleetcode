function superPow(a: number, b: number[]): number {
  a %= 1337;
  let result = 1;
  for (const d of b) {
    result = (powMod(result, 10, 1337) * powMod(a, d, 1337)) % 1337;
  }
  return result;
}

function powMod(x: number, n: number, mod: number): number {
  let res = 1;
  x %= mod;
  while (n > 0) {
    if ((n & 1) === 1) {
      res = (res * x) % mod;
    }
    x = (x * x) % mod;
    n = Math.floor(n / 2);
  }
  return res;
}
