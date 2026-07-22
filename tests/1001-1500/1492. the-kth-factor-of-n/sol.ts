function kthFactor(n: number, k: number): number {
  const ab: number[] = [];
  for (let i = 1; i <= n; i++) {
    if (n % i === 0) {
      ab.push(i);
    }
  }
  if (ab.length < k) {
    return -1;
  } else {
    return ab[k - 1];
  }
}
