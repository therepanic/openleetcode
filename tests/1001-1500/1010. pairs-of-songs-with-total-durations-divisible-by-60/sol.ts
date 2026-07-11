function numPairsDivisibleBy60(time: number[]): number {
  const remainders: number[] = new Array(60).fill(0);
  for (const t of time) {
    remainders[t % 60]++;
  }

  let count = 0;
  count += (remainders[0] * (remainders[0] - 1)) / 2;
  count += (remainders[30] * (remainders[30] - 1)) / 2;

  for (let i = 1; i < 30; i++) {
    count += remainders[i] * remainders[60 - i];
  }

  return count;
}
