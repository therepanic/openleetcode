function maxProduct(nums: number[]): number {
  let max1 = 0,
    max2 = 0;
  for (const num of nums) {
    if (num > max1) {
      max2 = max1;
      max1 = num;
    } else if (num > max2) {
      max2 = num;
    }
  }
  return (max1 - 1) * (max2 - 1);
}
