function poorPigs(
  buckets: number,
  minutesToDie: number,
  minutesToTest: number,
): number {
  const base = Math.floor(minutesToTest / minutesToDie) + 1;
  let ans = 0;
  let n = 1;
  while (n < buckets) {
    n *= base;
    ans++;
  }
  return ans;
}
