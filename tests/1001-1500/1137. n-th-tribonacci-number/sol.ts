function tribonacci(n: number): number {
  let ft = 0,
    st = 1,
    tt = 1;
  for (let i = 1; i <= n; i++) {
    const frt = ft + st + tt;
    ft = st;
    st = tt;
    tt = frt;
  }
  return ft;
}
