function longestSubsequence(arr: number[], difference: number): number {
  const dic = new Map<number, number>();
  let maxLen = 0;
  for (const x of arr) {
    const prev = dic.get(x - difference);
    if (prev !== undefined) {
      dic.set(x, prev + 1);
    } else {
      dic.set(x, 1);
    }
    const current = dic.get(x)!;
    if (current > maxLen) {
      maxLen = current;
    }
  }
  return maxLen;
}
