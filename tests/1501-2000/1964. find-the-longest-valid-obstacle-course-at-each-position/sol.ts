function longestObstacleCourseAtEachPosition(obstacles: number[]): number[] {
  const tails: number[] = [];
  const res: number[] = [];
  for (const x of obstacles) {
    const idx = upperBound(tails, x);
    res.push(idx + 1);
    if (idx === tails.length) {
      tails.push(x);
    } else {
      tails[idx] = x;
    }
  }
  return res;
}

function upperBound(arr: number[], target: number): number {
  let lo = 0,
    hi = arr.length;
  while (lo < hi) {
    const mid = lo + ((hi - lo) >> 1);
    if (arr[mid] <= target) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }
  return lo;
}
