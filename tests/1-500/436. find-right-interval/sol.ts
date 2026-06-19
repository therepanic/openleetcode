function findRightInterval(intervals: number[][]): number[] {
  const n = intervals.length;
  const starts: [number, number][] = intervals.map((interval, i) => [
    interval[0],
    i,
  ]);
  starts.sort((a, b) => a[0] - b[0]);
  const res: number[] = [];
  for (const interval of intervals) {
    const end = interval[1];
    let left = 0,
      right = n - 1;
    let idx = -1;
    while (left <= right) {
      const mid = Math.floor((left + right) / 2);
      if (starts[mid][0] >= end) {
        idx = starts[mid][1];
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }
    res.push(idx);
  }
  return res;
}
