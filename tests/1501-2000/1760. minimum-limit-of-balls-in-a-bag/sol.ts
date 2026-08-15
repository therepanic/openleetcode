function minimumSize(nums: number[], maxOperations: number): number {
  let lo = 1;
  let hi = Math.max(...nums);
  while (lo < hi) {
    const mid = Math.floor((lo + hi) / 2);
    let needed = 0;
    for (const x of nums) {
      needed += Math.floor((x - 1) / mid);
    }
    if (needed <= maxOperations) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }
  return lo;
}
