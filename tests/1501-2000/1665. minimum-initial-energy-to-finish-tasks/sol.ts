function minimumEffort(tasks: number[][]): number {
  tasks.sort((a, b) => b[1] - b[0] - (a[1] - a[0]));
  const test = (bal: number): boolean => {
    for (const [cost, thresh] of tasks) {
      if (bal < thresh) return false;
      bal -= cost;
    }
    return true;
  };
  let lo = 0,
    hi = 1000000001;
  while (lo < hi) {
    const mid = Math.floor((lo + hi) / 2);
    if (test(mid)) hi = mid;
    else lo = mid + 1;
  }
  return lo;
}
