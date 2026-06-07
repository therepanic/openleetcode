function mySqrt(x: number): number {
  if (x < 2) return x;

  let left = 1;
  let right = Math.floor(x / 2);
  let ans = 1;

  while (left <= right) {
    const mid = left + Math.floor((right - left) / 2);
    if (mid <= Math.floor(x / mid)) {
      ans = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return ans;
}
