function subsetsWithDup(nums: number[]): number[][] {
  nums.sort((a, b) => a - b);
  const res: number[][] = [];
  const cur: number[] = [];
  const dfs = (start: number): void => {
    res.push([...cur]);
    for (let i = start; i < nums.length; i++) {
      if (i > start && nums[i] === nums[i - 1]) continue;
      cur.push(nums[i]);
      dfs(i + 1);
      cur.pop();
    }
  };
  dfs(0);
  return res;
}
