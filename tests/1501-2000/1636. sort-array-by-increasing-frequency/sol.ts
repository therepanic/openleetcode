function frequencySort(nums: number[]): number[] {
  const freq: Map<number, number> = new Map();
  for (const num of nums) {
    freq.set(num, (freq.get(num) || 0) + 1);
  }
  return nums.sort((a, b) => {
    const freqCompare = (freq.get(a) || 0) - (freq.get(b) || 0);
    if (freqCompare !== 0) return freqCompare;
    return b - a;
  });
}
