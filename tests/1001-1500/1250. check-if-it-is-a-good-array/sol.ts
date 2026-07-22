function isGoodArray(nums: number[]): boolean {
  const gcd = (a: number, b: number): number => {
    while (b !== 0) {
      [a, b] = [b, a % b];
    }
    return a;
  };
  let g = nums[0];
  for (let i = 1; i < nums.length; i++) {
    g = gcd(g, nums[i]);
  }
  return g === 1;
}
