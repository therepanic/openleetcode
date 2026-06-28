function findLHS(nums: number[]): number {
  const frequencyMap: Map<number, number> = new Map();
  for (const num of nums) {
    frequencyMap.set(num, (frequencyMap.get(num) || 0) + 1);
  }

  let maxLength = 0;
  for (const [num, count] of frequencyMap) {
    if (frequencyMap.has(num + 1)) {
      const currentLength = count + frequencyMap.get(num + 1)!;
      maxLength = Math.max(maxLength, currentLength);
    }
  }

  return maxLength;
}
