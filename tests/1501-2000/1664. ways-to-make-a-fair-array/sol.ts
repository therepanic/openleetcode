function waysToMakeFair(nums: number[]): number {
  let even = 0;
  let odd = 0;
  let even_left = 0;
  let odd_left = 0;
  let result = 0;
  for (let idx = 0; idx < nums.length; idx++) {
    if (idx % 2 === 0) {
      even += nums[idx];
    } else {
      odd += nums[idx];
    }
  }
  for (let idx = 0; idx < nums.length; idx++) {
    if (idx % 2 === 0) {
      even -= nums[idx];
    } else {
      odd -= nums[idx];
    }
    if (even + odd_left === odd + even_left) {
      result++;
    }
    if (idx % 2 === 0) {
      even_left += nums[idx];
    } else {
      odd_left += nums[idx];
    }
  }
  return result;
}
