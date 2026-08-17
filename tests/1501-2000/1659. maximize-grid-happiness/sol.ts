function getMaxGridHappiness(
  m: number,
  n: number,
  introvertsCount: number,
  extrovertsCount: number,
): number {
  const I = introvertsCount,
    E = extrovertsCount;
  if (n > m) [m, n] = [n, m];
  const k = 3 ** n,
    h = Array(k).fill(0),
    ii = Array(k).fill(0),
    ee = Array(k).fill(0);
  for (let x = 0; x < k; x++) {
    let a = x,
      p = 0;
    for (let j = 0; j < n; j++) {
      const d = a % 3;
      a = Math.floor(a / 3);
      if (d === 1) {
        h[x] += 120;
        ii[x]++;
      } else if (d === 2) {
        h[x] += 40;
        ee[x]++;
      }
      if (d && p) h[x] += (d === 1 ? -30 : 20) + (p === 1 ? -30 : 20);
      p = d;
    }
  }
  const mem = new Map<string, number>();
  function f(r: number, i: number, e: number, p: number): number {
    if (r === m) return 0;
    const key = `${r},${i},${e},${p}`;
    if (mem.has(key)) return mem.get(key)!;
    let best = 0;
    for (let c = 0; c < k; c++)
      if (ii[c] <= i && ee[c] <= e) {
        let a = p,
          b = c,
          s = 0;
        for (let j = 0; j < n; j++) {
          const u = a % 3,
            d = b % 3;
          a = Math.floor(a / 3);
          b = Math.floor(b / 3);
          if (u && d) s += (u === 1 ? -30 : 20) + (d === 1 ? -30 : 20);
        }
        best = Math.max(best, h[c] + s + f(r + 1, i - ii[c], e - ee[c], c));
      }
    mem.set(key, best);
    return best;
  }
  return f(0, I, E, 0);
}
