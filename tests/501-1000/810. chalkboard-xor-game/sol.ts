function xorGame(nums: number[]): boolean {
  let totalXor = 0;
  for (const value of nums) {
    totalXor ^= value;
  }

  const isXorZero = totalXor === 0;
  const hasEvenLength = nums.length % 2 === 0;

  return isXorZero || hasEvenLength;
}
