function maxAlternatingSum(nums: number[]): number {
  let even = 0;
  let odd = 0;
  for (const value of nums) {
    const nextEven = Math.max(even, odd + value);
    const nextOdd = Math.max(odd, even - value);
    even = nextEven;
    odd = nextOdd;
  }
  return even;
}
