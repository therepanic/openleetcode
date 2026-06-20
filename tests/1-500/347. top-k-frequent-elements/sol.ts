function topKFrequent(nums: number[], k: number): number[] {
  const freq: Record<number, [number, number]> = {};
  for (let i = 0; i < nums.length; i++) {
    const value = nums[i];
    const item = freq[value];
    if (item) {
      item[0] += 1;
    } else {
      freq[value] = [1, i];
    }
  }
  return Object.entries(freq)
    .sort((a, b) => {
      const left = freq[Number(a[0])];
      const right = freq[Number(b[0])];
      return right[0] - left[0] || left[1] - right[1];
    })
    .slice(0, k)
    .map((entry) => Number(entry[0]));
}
