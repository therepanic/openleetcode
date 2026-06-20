function totalHammingDistance(nums: number[]): number {
  let total = 0;
  const n = nums.length;
  for (let i = 0; i < 32; i++) {
    let ones = 0;
    for (const num of nums) {
      ones += (num >> i) & 1;
    }
    total += ones * (n - ones);
  }
  return total;
}
