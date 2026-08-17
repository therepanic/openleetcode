function sumOfUnique(nums: number[]): number {
  let s = 0;
  for (let i of nums) {
    if (nums.filter((x) => x === i).length === 1) s += i;
  }
  return s;
}
