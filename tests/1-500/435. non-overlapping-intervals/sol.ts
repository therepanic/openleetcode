function eraseOverlapIntervals(intervals: number[][]): number {
  if (intervals.length === 0) return 0;
  intervals.sort((a, b) => a[1] - b[1]);
  let count = 0;
  let end = intervals[0][1];
  for (let i = 1; i < intervals.length; i++) {
    if (end > intervals[i][0]) {
      count++;
    } else {
      end = intervals[i][1];
    }
  }
  return count;
}
