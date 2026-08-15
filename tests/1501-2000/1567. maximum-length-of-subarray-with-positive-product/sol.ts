function getMaxLen(nums: number[]): number {
  let posLen = 0,
    negLen = 0,
    maxLen = 0;
  for (const num of nums) {
    if (num === 0) {
      posLen = 0;
      negLen = 0;
    } else if (num > 0) {
      posLen++;
      negLen = negLen > 0 ? negLen + 1 : 0;
    } else {
      const temp = posLen;
      posLen = negLen > 0 ? negLen + 1 : 0;
      negLen = temp + 1;
    }
    maxLen = Math.max(maxLen, posLen);
  }
  return maxLen;
}
