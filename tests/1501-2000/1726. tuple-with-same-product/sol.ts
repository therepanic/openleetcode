function tupleSameProduct(nums: number[]): number {
  const productCount: Map<number, number> = new Map();
  let ans = 0;

  for (let i = 0; i < nums.length; i++) {
    for (let j = i + 1; j < nums.length; j++) {
      const product = nums[i] * nums[j];
      ans += 8 * (productCount.get(product) || 0);
      productCount.set(product, (productCount.get(product) || 0) + 1);
    }
  }

  return ans;
}
