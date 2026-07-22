function maxEqualFreq(nums: number[]): number {
  const counts = new Map<number, number>();
  const frequencyCounts = new Map<number, number>();
  let best = 0;

  for (let i = 0; i < nums.length; i++) {
    const value = nums[i];
    const index = i + 1;
    const previous = counts.get(value) || 0;
    if (previous > 0) {
      frequencyCounts.set(previous, (frequencyCounts.get(previous) || 0) - 1);
      if (frequencyCounts.get(previous) === 0) {
        frequencyCounts.delete(previous);
      }
    }
    counts.set(value, previous + 1);
    const frequency = previous + 1;
    frequencyCounts.set(frequency, (frequencyCounts.get(frequency) || 0) + 1);

    if (frequencyCounts.size === 1) {
      const [onlyFrequency, valueCount] = frequencyCounts
        .entries()
        .next().value!;
      if (onlyFrequency === 1 || valueCount === 1) {
        best = index;
      }
    } else if (frequencyCounts.size === 2) {
      const keys = Array.from(frequencyCounts.keys()).sort((a, b) => a - b);
      const low = keys[0];
      const high = keys[1];
      if (
        (low === 1 && frequencyCounts.get(low) === 1) ||
        (high === low + 1 && frequencyCounts.get(high) === 1)
      ) {
        best = index;
      }
    }
  }

  return best;
}
