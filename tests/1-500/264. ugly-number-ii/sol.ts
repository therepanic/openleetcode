function nthUglyNumber(n: number): number {
  const h: number[] = new Array(n);
  h[0] = 1;
  let i = 0,
    j = 0,
    k = 0;

  for (let idx = 1; idx < n; idx++) {
    const m = Math.min(h[i] * 2, h[j] * 3, h[k] * 5);
    h[idx] = m;

    if (m === h[i] * 2) i++;
    if (m === h[j] * 3) j++;
    if (m === h[k] * 5) k++;
  }

  return h[n - 1];
}
