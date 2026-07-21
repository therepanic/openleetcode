function removeCoveredIntervals(intervals: number[][]): number {
  intervals.sort((a, b) => (a[0] === b[0] ? b[1] - a[1] : a[0] - b[0]));
  let res = 0,
    r = 0;
  for (const [st, end] of intervals) {
    if (end > r) {
      res++;
    }
    r = Math.max(r, end);
  }
  return res;
}
