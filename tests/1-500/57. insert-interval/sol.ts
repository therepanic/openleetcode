function insert(intervals: number[][], newInterval: number[]): number[][] {
  const res: number[][] = [];
  let i = 0;

  while (i < intervals.length && intervals[i][1] < newInterval[0]) {
    res.push([intervals[i][0], intervals[i][1]]);
    i++;
  }

  let start = newInterval[0];
  let end = newInterval[1];
  while (i < intervals.length && intervals[i][0] <= end) {
    if (intervals[i][0] < start) start = intervals[i][0];
    if (intervals[i][1] > end) end = intervals[i][1];
    i++;
  }
  res.push([start, end]);

  while (i < intervals.length) {
    res.push([intervals[i][0], intervals[i][1]]);
    i++;
  }

  return res;
}
