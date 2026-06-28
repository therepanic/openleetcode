function smallestDistancePair(nums: number[], k: number): number {
  nums.sort((a, b) => a - b);
  const n = nums.length;
  let low = 0;
  let high = nums[n - 1] - nums[0];

  while (low < high) {
    const mid = low + Math.floor((high - low) / 2);
    let count = 0;
    let j = 0;
    for (let i = 0; i < n; i++) {
      while (j < n && nums[j] - nums[i] <= mid) {
        j++;
      }
      count += j - i - 1;
    }
    if (count < k) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }
  return low;
}
