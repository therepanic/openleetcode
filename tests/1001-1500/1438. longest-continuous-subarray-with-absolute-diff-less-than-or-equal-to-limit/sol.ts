function longestSubarray(nums: number[], limit: number): number {
  const maxq: number[] = [];
  const minq: number[] = [];
  let left = 0;
  let max_len = 1;
  for (let right = 0; right < nums.length; right++) {
    while (maxq.length > 0 && nums[maxq[maxq.length - 1]] <= nums[right]) {
      maxq.pop();
    }
    maxq.push(right);
    while (minq.length > 0 && nums[minq[minq.length - 1]] >= nums[right]) {
      minq.pop();
    }
    minq.push(right);
    while (nums[maxq[0]] - nums[minq[0]] > limit) {
      left++;
      if (maxq[0] < left) {
        maxq.shift();
      }
      if (minq[0] < left) {
        minq.shift();
      }
    }
    max_len = Math.max(max_len, right - left + 1);
  }
  return max_len;
}
