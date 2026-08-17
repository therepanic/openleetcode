function rearrangeArray(nums: number[]): number[] {
  nums.sort((a, b) => a - b);
  const res: number[] = new Array(nums.length).fill(0);
  const mid = Math.floor((nums.length + 1) / 2);
  let j = 0;
  for (let i = 0; i < nums.length; i += 2) {
    res[i] = nums[j++];
  }
  j = mid;
  for (let i = 1; i < nums.length; i += 2) {
    res[i] = nums[j++];
  }
  return res;
}
