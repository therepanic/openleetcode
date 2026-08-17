function minOperations(nums: number[]): number {
  let sumBits = 0;
  let maxNum = 0;
  for (const num of nums) {
    sumBits += num.toString(2).split("1").length - 1;
    if (num > maxNum) {
      maxNum = num;
    }
  }
  const doubling = maxNum > 0 ? maxNum.toString(2).length - 1 : 0;
  return sumBits + doubling;
}
