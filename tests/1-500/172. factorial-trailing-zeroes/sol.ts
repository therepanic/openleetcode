function trailingZeroes(n: number): number {
  let count = 0;
  for (let divisor = 5; divisor <= n; divisor *= 5)
    count += Math.floor(n / divisor);
  return count;
}
