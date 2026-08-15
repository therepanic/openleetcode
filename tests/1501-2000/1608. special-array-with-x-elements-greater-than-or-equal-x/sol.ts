function specialArray(nums: number[]): number {
  const ans: number[] = new Array(nums.length + 1).fill(0);
  for (let i = 0; i <= nums.length; i++) {
    let count = 0;
    for (const ele of nums) {
      if (i <= ele) count++;
    }
    ans[i] = count;
    if (ans[i] === i) return i;
  }
  return -1;
}
