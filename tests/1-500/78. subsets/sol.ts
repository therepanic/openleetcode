function subsets(nums: number[]): number[][] {
  const res: number[][] = [[]];
  for (const x of nums) {
    const sz = res.length;
    for (let i = 0; i < sz; i++) {
      res.push([...res[i], x]);
    }
  }
  return res;
}
