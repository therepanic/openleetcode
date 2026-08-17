function canDistribute(nums: number[], quantity: number[]): boolean {
  quantity.sort((a, b) => b - a);
  const freqCounts = new Map<number, number>();
  const freqMap = new Map<number, number>();
  for (const n of nums) {
    freqMap.set(n, (freqMap.get(n) || 0) + 1);
  }
  for (const f of freqMap.values()) {
    freqCounts.set(f, (freqCounts.get(f) || 0) + 1);
  }

  function backtrack(i: number): boolean {
    if (i === quantity.length) return true;
    for (const [freq, count] of Array.from(freqCounts.entries())) {
      if (freq >= quantity[i] && count > 0) {
        freqCounts.set(freq, count - 1);
        const newFreq = freq - quantity[i];
        freqCounts.set(newFreq, (freqCounts.get(newFreq) || 0) + 1);
        if (backtrack(i + 1)) return true;
        freqCounts.set(freq, count);
        const newCount = freqCounts.get(newFreq)!;
        if (newCount === 1) {
          freqCounts.delete(newFreq);
        } else {
          freqCounts.set(newFreq, newCount - 1);
        }
      }
    }
    return false;
  }

  return backtrack(0);
}
