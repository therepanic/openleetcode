function sumOfFlooredPairs(nums: number[]): number {
  const MOD = 1_000_000_007;
  const maxi = 100_001;
  const maxVal = Math.max(...nums);
  const size = 2 * maxi + 1;
  const freq: number[] = new Array(size).fill(0);
  for (const num of nums) {
    freq[num]++;
  }
  for (let i = 1; i < size; i++) {
    freq[i] += freq[i - 1];
  }

  let total = 0;
  for (let num = 1; num <= maxVal; num++) {
    const countNum = freq[num] - freq[num - 1];
    if (countNum === 0) continue;
    let floorValue = 1;
    while (floorValue * num <= maxVal) {
      const left = floorValue * num;
      const right = Math.min((floorValue + 1) * num - 1, maxVal);
      const countInRange = freq[right] - freq[left - 1];
      total = (total + countNum * floorValue * countInRange) % MOD;
      floorValue++;
    }
  }
  return total;
}
