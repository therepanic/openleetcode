function getMaximumGenerated(n: number): number {
  if (n === 0) {
    return 0;
  } else if (n === 1 || n === 2) {
    return 1;
  } else {
    const a: number[] = new Array(n + 1).fill(0);
    a[0] = 0;
    a[1] = 1;
    let v = 1;
    for (let i = 2; i <= n; i++) {
      if (i % 2 === 0) {
        a[i] = a[v];
      } else {
        a[i] = a[v] + a[v + 1];
        v++;
      }
    }
    return Math.max(...a);
  }
}
