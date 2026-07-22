function numEquivDominoPairs(dominoes: number[][]): number {
  const mpp: number[] = new Array(100).fill(0);
  let count = 0;
  for (const [a, b] of dominoes) {
    const key = a <= b ? a * 10 + b : b * 10 + a;
    count += mpp[key];
    mpp[key]++;
  }
  return count;
}
