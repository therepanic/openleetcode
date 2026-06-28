function judgeSquareSum(c: number): boolean {
  let left = 0;
  let right = Math.floor(Math.sqrt(c));
  while (left <= right) {
    const currentSum = left * left + right * right;
    if (currentSum === c) {
      return true;
    } else if (currentSum < c) {
      left++;
    } else {
      right--;
    }
  }
  return false;
}
