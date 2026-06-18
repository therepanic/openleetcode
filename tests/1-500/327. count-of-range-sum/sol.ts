function countRangeSum(nums: number[], lower: number, upper: number): number {
  const prefix = new Array<number>(nums.length + 1).fill(0);
  for (let i = 0; i < nums.length; i++) {
    prefix[i + 1] = prefix[i] + nums[i];
  }

  const buffer = new Array<number>(prefix.length).fill(0);

  function sortCount(left: number, right: number): number {
    if (right - left <= 1) {
      return 0;
    }

    const mid = left + Math.floor((right - left) / 2);
    let count = sortCount(left, mid) + sortCount(mid, right);

    let low = mid;
    let high = mid;
    for (let i = left; i < mid; i++) {
      while (low < right && prefix[low] - prefix[i] < lower) {
        low++;
      }
      while (high < right && prefix[high] - prefix[i] <= upper) {
        high++;
      }
      count += high - low;
    }

    let p1 = left;
    let p2 = mid;
    let idx = left;
    while (p1 < mid && p2 < right) {
      if (prefix[p1] <= prefix[p2]) {
        buffer[idx++] = prefix[p1++];
      } else {
        buffer[idx++] = prefix[p2++];
      }
    }
    while (p1 < mid) {
      buffer[idx++] = prefix[p1++];
    }
    while (p2 < right) {
      buffer[idx++] = prefix[p2++];
    }
    for (let i = left; i < right; i++) {
      prefix[i] = buffer[i];
    }

    return count;
  }

  return sortCount(0, prefix.length);
}
