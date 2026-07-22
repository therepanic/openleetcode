function minSetSize(arr: number[]): number {
  const freq: Map<number, number> = new Map();
  for (const num of arr) {
    freq.set(num, (freq.get(num) || 0) + 1);
  }

  const counts = Array.from(freq.values()).sort((a, b) => b - a);

  let sumRemoved = 0;
  let minSetSize = 0;
  for (const count of counts) {
    sumRemoved += count;
    minSetSize++;
    if (sumRemoved >= Math.floor(arr.length / 2)) {
      return minSetSize;
    }
  }
  return minSetSize;
}
