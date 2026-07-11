function prefixesDivBy5(nums: number[]): boolean[] {
  const ans: boolean[] = [];
  let val = 0;
  for (const bit of nums) {
    val = (val * 2 + bit) % 5;
    ans.push(val === 0);
  }
  return ans;
}
