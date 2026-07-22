function minTaps(n: number, ranges: number[]): number {
  const maxRange: number[] = new Array(n + 1).fill(0);

  for (let i = 0; i < ranges.length; i++) {
    const left = Math.max(0, i - ranges[i]);
    const right = Math.min(n, i + ranges[i]);
    maxRange[left] = Math.max(maxRange[left], right);
  }

  let end = 0,
    farthest = 0,
    taps = 0;
  let i = 0;

  while (end < n) {
    while (i <= end) {
      farthest = Math.max(farthest, maxRange[i]);
      i++;
    }

    if (farthest <= end) {
      return -1;
    }

    end = farthest;
    taps++;
  }

  return taps;
}
