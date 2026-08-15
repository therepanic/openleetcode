function countTriples(n: number): number {
  let cnt = 0;
  const nsqrt = Math.floor(Math.sqrt(n));
  for (let s = 2; s <= nsqrt; s++) {
    const start = (s & 1) + 1;
    for (let t = start; t < s; t += 2) {
      if (gcd(s, t) !== 1) continue;
      const c = s * s + t * t;
      if (c > n) break;
      const k = Math.floor(n / c);
      cnt += 2 * k;
    }
  }
  return cnt;
}
function gcd(a: number, b: number): number {
  while (b !== 0) {
    const temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}
