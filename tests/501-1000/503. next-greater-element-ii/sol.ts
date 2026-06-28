function nextGreaterElements(nums: number[]): number[] {
  const n = nums.length;
  const res: number[] = new Array(n).fill(-1);
  for (let i = 0; i < n; i++) {
    for (let j = i + 1; j < n; j++) {
      if (nums[j] > nums[i]) {
        res[i] = nums[j];
        break;
      }
    }
    if (res[i] === -1) {
      for (let j = 0; j < i; j++) {
        if (nums[j] > nums[i]) {
          res[i] = nums[j];
          break;
        }
      }
    }
  }
  return res;
}
