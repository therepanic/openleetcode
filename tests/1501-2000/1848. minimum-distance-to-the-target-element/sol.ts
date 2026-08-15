function getMinDistance(nums: number[], target: number, start: number): number {
  if (nums[start] === target) {
    return 0;
  }

  const n = nums.length;
  let d = 1;

  while (true) {
    if (start - d >= 0 && nums[start - d] === target) {
      return d;
    }

    if (start + d < n && nums[start + d] === target) {
      return d;
    }

    d++;
  }
}
