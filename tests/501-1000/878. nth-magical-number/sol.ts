function nthMagicalNumber(n: number, a: number, b: number): number {
  const mod = 1000000007;
  const g = gcd(a, b);
  const lcm = Math.floor(a / g) * b;
  let lo = Math.min(a, b);
  let hi = n * lo;
  while (lo < hi) {
    const mid = Math.floor((lo + hi) / 2);
    const cnt =
      Math.floor(mid / a) + Math.floor(mid / b) - Math.floor(mid / lcm);
    if (cnt < n) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }
  return lo % mod;

  function gcd(x: number, y: number): number {
    while (y !== 0) {
      [x, y] = [y, x % y];
    }
    return x;
  }
}
