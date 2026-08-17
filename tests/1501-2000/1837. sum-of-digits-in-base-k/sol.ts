function sumBase(n: number, k: number): number {
  let total = 0;
  while (n > 0) {
    total += n % k;
    n = Math.floor(n / k);
  }
  return total;
}
