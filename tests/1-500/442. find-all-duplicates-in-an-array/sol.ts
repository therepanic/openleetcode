function findDuplicates(nums: number[]): number[] {
  const r: number[] = [];
  for (let x of nums) {
    const idx = Math.abs(x) - 1;
    if (nums[idx] < 0) {
      r.push(Math.abs(x));
    } else {
      nums[idx] = -nums[idx];
    }
  }
  return r;
}
