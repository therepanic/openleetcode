function minimumPerimeter(neededApples: number): number {
  let lo = 0,
    hi = 100000;
  while (lo < hi) {
    const mid = Math.floor((lo + hi) / 2);
    const apples = 2 * mid * (mid + 1) * (2 * mid + 1);
    if (apples >= neededApples) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }
  return lo * 8;
}
