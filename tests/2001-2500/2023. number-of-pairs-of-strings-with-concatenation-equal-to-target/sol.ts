function numOfPairs(nums: string[], target: string): number {
  const freq: Record<string, number> = {};
  for (const num of nums) {
    freq[num] = (freq[num] || 0) + 1;
  }

  let totalCnt = 0;

  for (const num of nums) {
    if (target.startsWith(num)) {
      const remain = target.substring(num.length);

      if (remain === num) {
        totalCnt += (freq[remain] || 0) - 1;
      } else {
        totalCnt += freq[remain] || 0;
      }
    }
  }

  return totalCnt;
}
