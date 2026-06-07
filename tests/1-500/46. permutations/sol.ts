function permute(nums: number[]): number[][] {
  const res: number[][] = [];

  const backtrack = (i: number): void => {
    if (i === nums.length) {
      res.push([...nums]);
      return;
    }

    for (let j = i; j < nums.length; j++) {
      [nums[i], nums[j]] = [nums[j], nums[i]];
      backtrack(i + 1);
      [nums[i], nums[j]] = [nums[j], nums[i]];
    }
  };

  backtrack(0);
  return res;
}
