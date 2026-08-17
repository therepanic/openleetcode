function reductionOperations(nums: number[]): number {
  const freq: number[] = new Array(50001).fill(0);
  for (const num of nums) {
    freq[num]++;
  }
  let idx = 1;
  while (freq[idx] === 0) idx++;
  let val = 0,
    total = 0;
  for (let i = 50000; i > idx; i--) {
    if (freq[i] > 0) {
      val += freq[i];
      total += val;
    }
  }
  return total;
}
