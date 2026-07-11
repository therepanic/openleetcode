function sumEvenAfterQueries(nums: number[], queries: number[][]): number[] {
  let total = nums.filter((x) => x % 2 === 0).reduce((a, b) => a + b, 0);
  const ans: number[] = [];
  for (const [val, idx] of queries) {
    if (nums[idx] % 2 === 0) total -= nums[idx];
    nums[idx] += val;
    if (nums[idx] % 2 === 0) total += nums[idx];
    ans.push(total);
  }
  return ans;
}
