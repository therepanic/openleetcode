function decompressRLElist(nums: number[]): number[] {
  const a: number[] = [];
  for (let i = 0; i < nums.length; i += 2) {
    const freq = nums[i];
    const val = nums[i + 1];
    a.push(...Array(freq).fill(val));
  }
  return a;
}
