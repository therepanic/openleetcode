function check(nums: number[]): boolean {
  const n = nums.length;
  let count = 0;
  for (let i = 0; i < n; i++) {
    if (nums[i] > nums[(i + 1) % n]) {
      count++;
    }
  }
  return count <= 1;
}
