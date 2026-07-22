function rangeSum(
  nums: number[],
  n: number,
  left: number,
  right: number,
): number {
  const MOD = 1000000007;
  const sums: number[] = [];
  for (let i = 0; i < n; i++) {
    let total = 0;
    for (let j = i; j < n; j++) {
      total += nums[j];
      sums.push(total);
    }
  }
  sums.sort((a, b) => a - b);
  let result = 0;
  for (let i = left - 1; i < right; i++) {
    result = (result + sums[i]) % MOD;
  }
  return result;
}
