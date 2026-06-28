function intersectionSizeTwo(intervals: number[][]): number {
  intervals.sort((a, b) => {
    if (a[1] !== b[1]) return a[1] - b[1];
    return b[0] - a[0];
  });
  let ans = 0;
  let a = -1,
    b = -1;
  for (const [l, r] of intervals) {
    if (l > b) {
      a = r - 1;
      b = r;
      ans += 2;
    } else if (l > a) {
      a = b;
      b = r;
      ans += 1;
    }
  }
  return ans;
}
