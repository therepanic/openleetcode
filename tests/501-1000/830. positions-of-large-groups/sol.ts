function largeGroupPositions(s: string): number[][] {
  const intervals: number[][] = [];
  let left = 0;
  while (left < s.length) {
    const start = left;
    while (left + 1 < s.length && s[left + 1] === s[left]) {
      left++;
    }
    if (left - start >= 2) {
      intervals.push([start, left]);
    }
    left++;
  }
  return intervals;
}
