function findLucky(arr: number[]): number {
  const freq: Map<number, number> = new Map();
  for (const num of arr) {
    freq.set(num, (freq.get(num) || 0) + 1);
  }

  let lucky = -1;
  freq.forEach((count, num) => {
    if (num === count) {
      lucky = Math.max(lucky, num);
    }
  });

  return lucky;
}
