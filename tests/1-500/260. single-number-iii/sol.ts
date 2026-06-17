function singleNumber(nums: number[]): number[] {
  let x = 0;
  for (const n of nums) {
    x ^= n;
  }

  const bit = x & -x;
  let a = 0;
  let b = 0;
  for (const n of nums) {
    if ((n & bit) !== 0) {
      a ^= n;
    } else {
      b ^= n;
    }
  }

  return [a, b];
}
