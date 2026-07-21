function smallerNumbersThanCurrent(nums: number[]): number[] {
  const allNums: number[] = new Array(101).fill(0);
  const res: number[] = new Array(nums.length).fill(0);

  for (const v of nums) {
    allNums[v]++;
  }

  for (let v = 1; v <= 100; v++) {
    allNums[v] += allNums[v - 1];
  }

  for (let i = 0; i < nums.length; i++) {
    const v = nums[i];
    if (v === 0) {
      res[i] = 0;
    } else {
      res[i] = allNums[v - 1];
    }
  }
  return res;
}
