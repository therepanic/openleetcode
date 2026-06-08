function jump(nums: number[]): number {
  const n = nums.length;
  if (n <= 1) {
    return 0;
  }

  let jumps = 0;
  let currEnd = 0;
  let maxReach = 0;

  for (let i = 0; i < n - 1; i++) {
    maxReach = Math.max(maxReach, i + nums[i]);
    if (i === currEnd) {
      jumps++;
      currEnd = maxReach;
      if (currEnd >= n - 1) {
        break;
      }
    }
  }

  return jumps;
}
