function smallestDivisor(nums: number[], threshold: number): number {
  let low = 1;
  let high = Math.max(...nums);
  let ans = high;

  while (low <= high) {
    let mid = low + Math.floor((high - low) / 2);

    let total = 0;
    for (let num of nums) {
      total += Math.ceil(num / mid);
    }

    if (total <= threshold) {
      ans = mid;
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }

  return ans;
}
